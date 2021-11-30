with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Float_Random;

   type T_tension is new Float range 0.0..5.0;
   package paqueteTension is new Ada.Text_IO.Float_IO(T_tension);
   use paqueteTension;

procedure main_jonan is
begin
   
end main_jonan;
