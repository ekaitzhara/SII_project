package body utilidades is

   function Fc_Menu return Character is
      
      CEleccion: Character;

   begin
      loop
         New_Line;
         Put_Line("----------- MENU OPCIONES -----------");
         Put_Line("1: Calentar");
         Put_Line("2: Mostrar temperatura actual");
         Put_Line("3: Leer temperatura y guardar en array");
         Put_Line("4: Mostrar temperaturas del array");
         Put_Line("5: Calcular y mostrar temperatura media");
         Put_Line("6: Calcular y mostrar porcentaje temperaturas > umbral");
         Put_Line("7: Calcular y mostrar la máxima temperatura registrada");
		  Put_Line ("8: Calcular y mostrar la mínima temperatura registrada");
		  Put_Line("9: Guardar el array en un fichero externo");
         Put_Line("0- Salir");
         New_Line(2);
         Put("Pulsa el numero de la opcion: ");
         Get(CEleccion);
         exit when CEleccion in '0'..'9'; -- Se preguntara la opcion deseada hasta que se introduzca un valor valido
         Put_Line("Elija una de las opciones indicadas");
      end loop;
      New_Line;

      return CEleccion;
   end Fc_Menu;


end utilidades;
