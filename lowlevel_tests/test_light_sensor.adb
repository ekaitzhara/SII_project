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

--  Low-level test for light sensors

with NXT.AVR;
with NXT.Display;              use NXT.Display;
with Ada.Real_Time;            use Ada.Real_Time;
with NXT.Light_Sensors;        use NXT.Light_Sensors;
with NXT.Light_Sensors.Ctors;  use NXT.Light_Sensors.Ctors;

procedure Test_Light_Sensor is
   use NXT;  -- for types

   PhotoDetector : Light_Sensor := Make (Sensor_1, Floodlight_On => False);

begin
   NXT.AVR.Await_Data_Available;
   Put_Line ("Ready");

   loop
      Put_Noupdate (PhotoDetector.Light_Value);
      Put_Noupdate ("%,  0x");
      Put_Hex (NXT.AVR.Raw_Input (Sensor_1));
      New_Line;
      exit when NXT.AVR.Button /= No_Button;
      delay until Clock + Milliseconds (100);
   end loop;

   Put_Line ("Powering off");
   loop
      NXT.AVR.Power_Down;
      delay until Clock + Seconds (1);
   end loop;
end Test_Light_Sensor;
