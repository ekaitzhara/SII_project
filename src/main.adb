with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

with utilidades; use utilidades;
with maqueta; use maqueta;
with tipos; use tipos;

with manejo_array_float;  use manejo_array_float;

procedure Main is

   --Declaración de las variables del programa principal
   CMenu: Character;
   iConsigna : Integer;
   valorTension : T_tension;
   valorTemperatura : T_temperatura;
   --lista : G_lista;
   --contador : Integer;
   numberOfElem : Integer;

begin


  loop
      CMenu := Fc_Menu;

      case CMenu is

         when '1' =>
            Put_Line("Opción: Calentar");
            iConsigna := fcCalentar;

         when '2' =>
            Put_Line("Opción: Mostrar temperatura actual");
            pcGeneraTension(valorTension);
            pcGeneraTemperatura(valorTension,valorTemperatura);
            Put("La temperatura actual es: ");
            Put(Float(valorTemperatura), Aft=>2, Exp=>0);
            Put(" grados");

            termometro(valorTemperatura);


         when '3' =>
            Put_Line("Opción: Leer temperatura y guardar en array");
            pcGeneraTension(valorTension);
            pcGeneraTemperatura(valorTension,valorTemperatura);
            Array_Float.add(valorTemperatura);
            Put("Valor leído y guardado: ");
            Put(Float(valorTemperatura), Aft=>2, Exp=>0);
            Put(" grados");

         when '4' | '5' |  '6' =>
            numberOfElem := Array_Float.getNumElements;
            declare
               lista : listaElementos(1..numberOfElem);
            begin
               getElemArray(lista,numberOfElem);

               case CMenu is
                  when '4' =>
                     Put_Line("Opción: Mostrar temperaturas del array");
                     mostrarArray(lista);
                  when '5' =>
                     Put_Line("Opción: Calcular la temperatura media");
                     mediaTemperatura(lista, numberOfElem);
                  when '6' =>
                     Put_Line("Opción: Calcular porcentaje de temperaturas que superan un umbral");
                  umbralTemperatura(lista, numberOfElem);
                  when others =>
                     null;
               end case;

            end;


      --  when '5' =>
      --
      --     mediaTemperatura;
      --
      --  when '6' =>
      --
      --     umbralTemperatura;

         when '0' =>
            exit;

         when others =>
            null;

      end case;

      New_Line;
  end loop;

end Main;
