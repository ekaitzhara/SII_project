with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Float_Random;
with tipos;   use tipos;

package maqueta is

   function fcCalentar return Integer;
   --Funcion que pide al usuario el valor de consigna en W

   procedure pcGeneraTension (valorTension : out T_tension);
   --Procedure que genera tension aleatoria para las simulaciones

   procedure pcGeneraTemperatura (valorTension : in T_tension; valorTemperatura : out T_temperatura);
   --Procedure para convertir el valor de tension en temperatura

   procedure termometro(temperatura: T_temperatura);
   --Procedure para crear un termometro digital

   package paqueteTension is new Ada.Text_IO.Float_IO(T_tension);
   --Crear paquete de tipo T_Tension
   use paqueteTension;

   package paqueteTemperatura is new Ada.Text_IO.Float_IO(T_temperatura);
   --Crear paquete de tipo T_temperatura
   use paqueteTemperatura;

end maqueta;
