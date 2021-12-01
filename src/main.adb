with Ada.Text_IO;   use Ada.Text_IO;
with Utilidades; use Utilidades;


procedure Main is

   --Declaración de las variables del programa principal
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
         Put_Line("Opción: Calentar");
         iConsigna := fcCalentar;

      when '2' =>
         Put_Line("Opción: Mostrar temperatura actual");
         pcGeneraTemperatura(valorTension,valorTemperatura);

      when '3' =>
         Put_Line("Opción: Leer temperatura y guardar en array");

      when '4' =>
         Put_Line("Opción: Mostrar temperaturas del array");
         Mostrar_Array

      when '5' =>
         Put_Line("Opción: Calcular la temperatura media");
         mediaTemperatura(T_lista, contador);

      when '6' =>
         Put_Line("Opción: Calcular porcentaje de temperaturas que superan un umbral");
         umbralTemperatura(T_lista, contador);

      when '0' =>
         exit;

      when others =>
         null;

   end case;

  end loop;

end Main;
