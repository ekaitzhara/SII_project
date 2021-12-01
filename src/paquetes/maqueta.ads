with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package maqueta is

   function fcCalentar return Integer;

   procedure pcGeneraTension (valorTension : out T_tension);

   procedure pcGeneraTemperatura (valorTension : in T_tension; valorTemperatura : out T_temperatura);

end maqueta;
