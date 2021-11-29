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

--  Low-level test of the tone generator

with Ada.Real_Time;    use Ada.Real_Time;
with Interfaces;       use Interfaces;
with NXT.Last_Chance;
with NXT.AVR;          use NXT.AVR;
with NXT.Display;      use NXT.Display;
with NXT.Audio;        use NXT.Audio;

procedure Test_Tone_Generator is
   use NXT;

   Tone_Duration      : constant := 300;
   Last_Note_Duration : constant := 2 * Tone_Duration;
   Volume             : constant := 50;

   subtype Octave_Steps is Integer range 1 .. 13;

   Notes : constant array (Octave_Steps) of Unsigned_32 :=
     (440, 466, 494, 523, 554, 587, 622, 659, 699, 740, 784, 831, 880);

   procedure Play_Scale is
      Interval : Unsigned_32;
   begin
      Interval := Tone_Duration;
      for Next in Octave_Steps loop
         if Next = Notes'Last then
            Interval := Last_Note_Duration;
         end if;
         Play_Tone (Notes (Next), Interval, Volume);
         delay until Clock + Milliseconds (Integer (Interval));
      end loop;

      delay until Clock + Milliseconds (200);

      Interval := Tone_Duration;
      for Next in reverse Octave_Steps loop
         if Next = Notes'First then
            Interval := Last_Note_Duration;
         end if;
         Play_Tone (Notes (Next), Interval, Volume);
         delay until Clock + Milliseconds (Integer (Interval));
      end loop;
   end Play_Scale;

begin
   Await_Data_Available;
   Play_Scale;
   delay until Clock + Seconds (3);

   Put_Line ("Powering off");
   loop
      Power_Down;
      delay until Clock + Seconds (1);
   end loop;
end Test_Tone_Generator;
