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

--  Low-level test for digital pin output

--  Attach a volt-meter or multi-meter to sensor port 1, pin 5, and observe the
--  voltage values present during the state changes. You are prompted to press
--  a button (any button) in order to apply the step indicated prior to the
--  prompt.

with Ada.Real_Time;     use Ada.Real_Time;
with NXT.AVR;
with NXT.Last_Chance;
with NXT.Display;       use NXT.Display;
with NXT.Sensor_Ports;  use NXT.Sensor_Ports;
with Test_Utils;        use Test_Utils;

use NXT;

procedure Test_Pin_Outputs is
begin
   NXT.AVR.Await_Data_Available;

   Put_Line ("Reset port 1");
   Await_Button_Press;
   Reset (Port => Sensor_1);

   Set_Pin_Mode (Sensor_1, Digital_0, Output);

   Put_Line ("Set pin 5 high");
   Await_Button_Press;
   Set_Pin_State (Sensor_1, Digital_0, High);

   Put_Line ("Set pin 5 low");
   Await_Button_Press;
   Set_Pin_State (Sensor_1, Digital_0, Low);

   Put_Line ("Power off");
   Await_Button_Press;
   loop
      NXT.AVR.Power_Down;
      delay until Clock + Seconds (1);
   end loop;
end Test_Pin_Outputs;
