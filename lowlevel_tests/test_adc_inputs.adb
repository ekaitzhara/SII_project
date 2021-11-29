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

--  Low-level test for reading ADC input

--  For use with a power source attached to sensor port,
--  in this case supplying power to the A/D pin input of sensor 1

with Ada.Real_Time;     use Ada.Real_Time;
with NXT.AVR;
with NXT.Last_Chance;
with NXT.Display;       use NXT.Display;
with Test_Utils;        use Test_Utils;

use NXT;

procedure Test_ADC_Inputs is
begin
   NXT.AVR.Await_Data_Available;

   Put_Line ("Scan ADC pin");
   Await_Button_Press;
   loop
      Put_Hex (NXT.AVR.Raw_Input (Sensor_1)); Put (ASCII.CR);
      Screen_Update;
      exit when NXT.AVR.Button /= No_Button;
      delay until Clock + Milliseconds (10);
   end loop;

   New_Line;
   Put_Line ("Powering off");
   loop
      NXT.AVR.Power_Down;
      delay until Clock + Seconds (1);
   end loop;
end Test_ADC_Inputs;
