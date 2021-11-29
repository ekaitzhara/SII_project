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

--  Low-level test for reading motor encoders

with Ada.Real_Time;            use Ada.Real_Time;
with NXT.AVR;
with NXT.Display;              use NXT.Display;
with NXT.Last_Chance;
with NXT.Motors.Simple;        use NXT.Motors.Simple;
with NXT.Motors.Simple.Ctors;  use NXT.Motors.Simple.Ctors;
with NXT.Motor_Encoders;       use NXT.Motor_Encoders;

procedure Test_Motor_Encoder is
   use NXT;

   Engine : Simple_Motor := Make (Motor_A);

begin
   Engine.Set_Power (50);
   Engine.Forward;

   loop
      Put_Noupdate (Encoder_Count (Motor_A)); New_Line;
      exit when NXT.AVR.Button /= No_Button;
      delay until clock + milliseconds (100);
   end loop;

   Engine.Stop;
   Engine.Set_Power (0);
   delay until Clock + Seconds (20);

   Put_Line ("Powering off");
   loop
      NXT.AVR.Power_Down;
      delay until Clock + Seconds (1);
   end loop;
end Test_Motor_Encoder;
