package body maqueta is

   function  fcCalentar return Integer is

      iConsigna : Integer;

   begin

      loop
         New_line ;
         Put ("Introduzca los watios de consigna (50..350): ") ;
         Get (iConsigna);

         exit when iOpcion in 50..350;
            Put_Line ("Introduzca un valor entre 50  y 350");
      end loop;

      return iConsigna;

   end fcCalentar;
   

end maqueta;
