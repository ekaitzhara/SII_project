with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

with utilidades; use utilidades;
with maqueta; use maqueta;
with tipos; use tipos;

with manejo_array_float;  use manejo_array_float;

with driver_pcm3712_ao_ehu; use driver_pcm3712_ao_ehu; -- Drivers para la maqueta
with Driver_Pcm3718_Ai;  use Driver_Pcm3718_Ai;

procedure Main is

   --Declaración de las variables del programa principal
   CMenu: Character;
   iConsigna : Integer;
   valorTension : T_tension;
   valorTemperatura : T_temperatura;
   numberOfElem : Integer;

begin

   Configuracion_Inicial (Conexion => Differential_Ended, --Configuracion inicial para ejecutar la maqueta
                          Canal_Primero => 0,
                          Canal_Ultimo => 0,
                          Disparo => Software,
                          Numero_Muestras => 1,
                          Rango => Unipolar_5) ;

   Initialize_PCM3712; --Funcion de la maqueta para inicializarla


  loop
      CMenu := Fc_Menu; --Funcion que muestra las opciones que puede escoger el usuario, tambien devuelve la opcion elegida

      case CMenu is

         when '1' =>
            Put_Line("Opción: Calentar");
            iConsigna := fcCalentar; --Funcion que pide al usuario el valor de consigna en W
            Write_ao_PCM3712 (Float(iConsigna)) ; --Funcion de la maqueta para pasar la consigna de potencia

         when '2' =>
            Put_Line("Opción: Mostrar temperatura actual");
            --pcGeneraTension(valorTension); --Procedure que genera tension aleatoria para las simulaciones
            valorTension := T_tension(Adquirir); --Funcion de la maqueta para obtener el valor de la tension
            pcGeneraTemperatura(valorTension,valorTemperatura); --Procedure que realiza la conversion de tension a temperatura
            Put("La temperatura actual es: ");
            Put(Float(valorTemperatura), Aft=>2, Exp=>0);
            Put(" grados");

            termometro(valorTemperatura); --Procedure añadida para visualizar un termometro digital


         when '3' =>
            Put_Line("Opción: Leer temperatura y guardar en array");
            --pcGeneraTension(valorTension);
            valorTension := T_tension(Adquirir);
            pcGeneraTemperatura(valorTension,valorTemperatura);
            Array_Float.add(valorTemperatura); --Añadir temperatura actual al array
            Put("Valor leído y guardado: ");
            Put(Float(valorTemperatura), Aft=>2, Exp=>0);
            Put(" grados");

         when '4' | '5' |  '6' | '7' | '8' | '9'=> --En estas opciones se trabaja con los valores del paquete generico
            numberOfElem := Array_Float.getNumElements; --Obtenemos la cantidad de elementos que tiene nuestro array
            declare
               lista : listaElementos(1..numberOfElem);  --Se crea array tipo listaElementos de tamaño igual al numero de temperaturas leidas
            begin
               getElemArray(lista,numberOfElem); --Se pasan las temperaturas leídas al array lista, para utilizarlo en las funciones posteriores

               case CMenu is
                  when '4' =>
                     Put_Line("Opción: Mostrar temperaturas del array");
                     mostrarArray(lista); --Funcion que muestra los elementos del array (temperaturas leidas hasta el momento)
                  when '5' =>
                     Put_Line("Opción: Calcular la temperatura media");
                     mediaTemperatura(lista, numberOfElem); --Funcion que calcula la media de las temperaturas leidas hasta el momento
                  when '6' =>
                     Put_Line("Opción: Calcular porcentaje de temperaturas que superan un umbral");
                     umbralTemperatura(lista, numberOfElem); --Funcion que calcula porcentaje de temperaturas leidas por encima del umbral especificado
                  when '7' =>
                     Put_Line("Opción: Calcular máxima temperatura registrada");
                     maximaTemperatura(lista, numberOfElem);--Funcion que calcula la temperatura maxima de las temperaturas leidas hasta el momento
                  when '8' =>
                     Put_Line("Opción: Calcular mínima temperatura registrada");
							minimaTemperatura (lista, numberOfElem); --Funcion que calcula la temperatura minima de las temperaturas leidas hasta el momento
						when '9' =>
							Put_Line ("Opción: Guardar el array en un fichero externo");
							addFichero (lista, numberOfElem);
                  when others =>
                     null;
               end case;

            end;

         when '0' =>
            Fin_Adquisicion; --Funcion de la maqueta para finalizar el programa
            exit;

         when others =>
            null;

      end case;

      New_Line;
  end loop;

end Main;
