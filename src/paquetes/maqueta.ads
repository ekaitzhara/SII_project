with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Float_Random;
with tipos;   use tipos;

package maqueta is

   --type T_tension is new Float range 0.0..5.0; -- definido en tipos
   package paqueteTension is new Ada.Text_IO.Float_IO(T_tension);
   use paqueteTension;

   --type T_temperatura is new Float range 0.0..100.0;
   package paqueteTemperatura is new Ada.Text_IO.Float_IO(T_temperatura);
   use paqueteTemperatura;

   function fcCalentar return Integer;

   procedure pcGeneraTension (valorTension : out T_tension);

   procedure pcGeneraTemperatura (valorTension : in T_tension; valorTemperatura : out T_temperatura);

end maqueta;
