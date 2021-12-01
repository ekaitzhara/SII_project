with Ada.Text_IO;   use Ada.Text_IO;
with Utilidades; use Utilidades;


procedure Main is

   --Declaraci�n de las variables del programa principal
   CMenu: Character;
   iConsigna : Integer;
   valorTension : T_tension;
   valorTemperatura : T_temperatura;
   lista : G_lista;
   contador : Positive;

begin

  Loop
      CMenu := Fc_Menu;


   case CMenu is

      when '1' =>
         Put_Line("Opci�n: Calentar");
         iConsigna := fcCalentar;

      when '2' =>
         Put_Line("Opci�n: Mostrar temperatura actual");
         pcGeneraTemperatura(valorTension,valorTemperatura);

      when '3' =>
         Put_Line("Opci�n: Leer temperatura y guardar en array");

      when '4' =>
         Put_Line("Opci�n: Mostrar temperaturas del array");
         Mostrar_Array

      when '5' =>
         Put_Line("Opci�n: Calcular la temperatura media");
         mediaTemperatura(T_lista, contador);

      when '6' =>
         Put_Line("Opci�n: Calcular porcentaje de temperaturas que superan un umbral");
         umbralTemperatura(T_lista, contador);

      when '0' =>
         exit;

      when others =>
         null;

   end case;

  end loop;

end Main;
