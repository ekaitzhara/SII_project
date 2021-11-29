------------------------------------------------------------------------------
--                                                                          --
--                           GNAT RAVENSCAR for NXT                         --
--                                                                          --
--                        Copyright (C) 2011, AdaCore                       --
--                                                                          --
-- This is free software; you can  redistribute it  and/or modify it under  --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 2,  or (at your option) any later ver- --
-- sion. This is distributed in the hope that it will be useful, but WITH-  --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License --
-- for  more details.  You should have  received  a copy of the GNU General --
-- Public License  distributed with GNARL; see file COPYING.  If not, write --
-- to  the Free Software Foundation,  59 Temple Place - Suite 330,  Boston, --
-- MA 02111-1307, USA.                                                      --
--                                                                          --
-- As a special exception,  if other files  instantiate  generics from this --
-- unit, or you link  this unit with other files  to produce an executable, --
-- this  unit  does not  by itself cause  the resulting  executable  to  be --
-- covered  by the  GNU  General  Public  License.  This exception does not --
-- however invalidate  any other reasons why  the executable file  might be --
-- covered by the  GNU Public License.                                      --
--                                                                          --
------------------------------------------------------------------------------

--  Low-level test for I2C ports.
--  Run with an ultrasonic sensor (or some other I2C device) attached.

with Ada.Real_Time;      use Ada.Real_Time;
with NXT.AVR;
with NXT.Display;        use NXT.Display;
with NXT.Last_Chance;
with Interfaces;         use Interfaces;
with System;
with NXT.I2C_Ports;      use NXT.I2C_Ports;
with NXT.Sensor_Ports;   use NXT.Sensor_Ports;
with Test_Utils;         use Test_Utils;

procedure Test_I2C_Ports is
   use NXT;

   Command_Delay : constant Time_Span := Milliseconds (5);
   Data_Delay    : constant Time_Span := Milliseconds (15);

   Next_Command_Time : Time := Clock + Command_Delay;

   Port : constant Sensor_Id := Sensor_1;
   --  arbitrary

   procedure Send_Data
     (Device   : Unsigned_32;
      Register : Unsigned_32;
      Buffer   : System.Address;
      Length   : Positive;
      Result   : out Integer)
   is
      Transaction_Reply : array (1 .. 32) of Unsigned_8;
   begin
      Start_Transaction
        (Port                   => Port,
         Device_Address         => Device,
         Register_Address       => Register,
         Register_Address_Bytes => 1,
         Write_Buffer           => Buffer,
         Bytes_To_Transfer      => Length,
         Operation              => Write,
         Result                 => Result);

      if Result /= 0 then
         return;
      end if;

      while Busy (Port) loop
         delay until Clock + Milliseconds (1);
      end loop;

      Complete_Transaction
        (Port            => Port,
         Incoming_Buffer => Transaction_Reply'Address,
         Bytes_To_Read   => Length,
         Result          => Result);

      if Result >= 0 then
         if Result = Length then
            Result := 0;
         else
            Result := -1;
         end if;
      end if;
   end Send_Data;

   procedure Get_Data
     (Device   : Unsigned_32;
      Register : Unsigned_32;
      Buffer   : System.Address;
      Length   : Positive;
      Result   : out Integer)
   is
   begin
      Start_Transaction
        (Port                   => Port,
         Device_Address         => Device,
         Register_Address       => Register,
         Register_Address_Bytes => 1,
         Write_Buffer           => System.Null_Address,
         Bytes_To_Transfer      => Length,
         Operation              => Read,
         Result                 => Result);

      if Result /= 0 then
         return;
      end if;

      while Busy (Port) loop
         delay until Clock + Milliseconds (0);
      end loop;

      Complete_Transaction
        (Port            => Port,
         Incoming_Buffer => Buffer,
         Bytes_To_Read   => Length,
         Result          => Result);

      if Result >= 0 then
         if Result = Length then
            Result := 0;
         else
            Result := -1;
         end if;
      end if;
   end Get_Data;

   procedure Ultrasonic_Get_Data
     (Device   : Unsigned_32;
      Register : Unsigned_32;
      Buffer   : System.Address;
      Length   : Positive;
      Result   : out Integer)
   is
   begin
      delay until Next_Command_Time;
      Get_Data (Device, Register, Buffer, Length, Result);
      Next_Command_Time := Clock + Command_Delay;
   end Ultrasonic_Get_Data;

   procedure Ultrasonic_Send_Data
     (Device   : Unsigned_32;
      Register : Unsigned_32;
      Buffer   : System.Address;
      Length   : Positive;
      Result   : out Integer)
   is
   begin
      delay until Next_Command_Time;
      Send_Data (Device, Register, Buffer, Length, Result);
      Next_Command_Time := Clock + Command_Delay;
   end Ultrasonic_Send_Data;

   procedure Fetch_String
     (Device   : Unsigned_32;
      Register : Unsigned_32;
      Length   : Positive;
      Fetched  : out String;
      Success  : out Boolean)
   is
      Buffer : aliased String (Fetched'Range);
      Result : Integer;
   begin
      Ultrasonic_Get_Data (Device, Register, Buffer'Address, Length, Result);
      if Result /= 0 then
         Success := False;
         return;
      end if;
      for K in Fetched'Range loop
         if Buffer (K) = Character'Val (0) then
            Fetched (K) := ' ';
         else
            Fetched (K) := Buffer (K);
         end if;
      end loop;
      Success := True;
   end Fetch_String;

   My_Device_Address : constant := 2; -- 1;
   Mode_Register     : constant := 16#41#;

begin
   Set_Input_Power (Port, NXT_9V);
   Set_Pin_Mode  (Port, Digital_0, Output);
   Set_Pin_Mode  (Port, Digital_1, Output);
   Set_Pin_State (Port, Digital_0, Low);
   Set_Pin_State (Port, Digital_1, Low);

   --  It is essential, when driving the Lego ultrasonic sensor, that we
   --  operate in "Lego" mode. Otherwise the sensor will not interact properly
   --  at the I2C level.
   Configure_I2C_Port (Port, Lego_Mode);

   --  Reset the device. Restores things to the default state. Following this
   --  call the sensor will be operating in continuous mode.
   Ultrasonic_Reset : declare
      Reset : constant := 4;
      Buff  : aliased Unsigned_8 := Reset;
      Result : Integer;
   begin
      Ultrasonic_Send_Data
        (Device   => My_Device_Address,
         Register => Mode_Register,
         Buffer   => Buff'Address,
         Length   => 1,
         Result   => Result);
   end Ultrasonic_Reset;

   --  Get the current operating mode of the sensor.
   --  0 : sensor is off
   --  1 : single shot ping mode
   --  2 : continuous ping mode (default)
   --  3 : event capture mode
   Ultrasonic_Get_Mode : declare
      Buff   : aliased Unsigned_8 := 42;
      Result : Integer;
   begin
      Ultrasonic_Get_Data
        (Device   => My_Device_Address,
         Register => Mode_Register,
         Buffer   => Buff'Address,
         Length   => 1,
         Result   => Result);
   end Ultrasonic_Get_Mode;

   Get_Product_Id : declare
      Reply_Length    : constant := 8;
      Reply           : String (1 .. Reply_Length) := (others => '!');
      Successful_Read : Boolean;
      Product_Id      : constant := 16#08#;
   begin
      Fetch_String
        (Device   => My_Device_Address,
         Register => Product_Id,
         Length   => Reply_Length,
         Fetched  => Reply,
         Success  => Successful_Read);

      if Successful_Read then
         Put_Line (Reply);
      else
         Put_Line ("Fetch failed");
      end if;
   end Get_Product_Id;

   Get_Version  : declare
      Reply_Length    : constant := 8;
      Reply           : String (1 .. Reply_Length);
      Successful_Read : Boolean;
      Version_Register : constant := 16#00#;
   begin
      Fetch_String
        (Device   => My_Device_Address,
         Register => Version_Register,
         Length   => Reply_Length,
         Fetched  => Reply,
         Success  => Successful_Read);

      if Successful_Read then
         Put_Line (Reply);
      else
         Put_Line ("Fetch failed");
      end if;
   end Get_Version;

   Get_Sensor_Type     : declare
      Reply_Length    : constant := 8;
      Reply           : String (1 .. Reply_Length);
      Successful_Read : Boolean;
      Sensor_Type_Register : constant := 16#10#;
   begin
      Fetch_String
        (Device   => My_Device_Address,
         Register => Sensor_Type_Register,
         Length   => Reply_Length,
         Fetched  => Reply,
         Success  => Successful_Read);

      if Successful_Read then
         Put_Line (Reply);
      else
         Put_Line ("Fetch failed");
      end if;
   end Get_Sensor_Type;

   Put_Line ("Done");
   Await_Button_Press;

   Put_Line ("Power off");
   loop
      NXT.AVR.Power_Down;
      delay until Clock + Seconds (1);
   end loop;
end Test_I2C_Ports;
