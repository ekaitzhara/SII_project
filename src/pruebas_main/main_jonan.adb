with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Float_Random;

with maqueta; use maqueta;


procedure main_jonan is
  


   --Variables main Jonan
   num : T_tension;
   temp : T_temperatura;
   
begin
   
   pcGeneraTension(num);
   pcGeneraTemperatura(num,temp);
   
end main_jonan;
