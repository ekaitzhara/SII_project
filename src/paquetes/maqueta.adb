package body maqueta is
   

   type T_tension is new Float range 0.0..5.0;
   package paqueteTension is new Ada.Text_IO.Float_IO(T_tension);
   use paqueteTension;
   
   type T_temperatura is new Float range 0.0..100.0;
   package paqueteTemperatura is new Ada.Text_IO.Float_IO(T_temperatura);
   use paqueteTemperatura;   
   

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
   

   procedure pcGeneraTension (valorTension : out T_tension) is

      G_tension : Ada.Numerics.Float_Random.Generator;
      valorTension_aux : Float;

   begin

      Ada.Numerics.Float_Random.Reset(G_tension);      

      valorTension_aux := Ada.Numerics.Float_Random.Random(G_tension);

      valorTension := 5.00 * T_tension(valorTension_aux);

      Put_Line("El valor de tensión generado es: " & T_tension'Image(valorTension));

   end pcGeneraTension;
   
   
   procedure pcGeneraTemperatura (valorTension : in T_tension; valorTemperatura : out T_temperatura) is
      
   begin
      
      valorTemperatura := T_temperatura(20.0*valorTension);
      
      Put_Line("La temperatura correspondiente es: " & T_temperatura'Image(valorTemperatura));
      
   end pcGeneraTemperatura;
   

end maqueta;
