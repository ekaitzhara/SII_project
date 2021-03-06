package body maqueta is
   
   
   function  fcCalentar return Integer is 

      iConsigna : Integer;

   begin

      loop
         New_line ;
         Put ("Introduzca los watios de consigna (50..350): ") ;
         Get (iConsigna);

         exit when iConsigna in 50..350;
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

   end pcGeneraTension;
   
   
   procedure pcGeneraTemperatura (valorTension : in T_tension; valorTemperatura : out T_temperatura) is 
      
   begin
      
      valorTemperatura := T_temperatura(20.0*valorTension);
      
   end pcGeneraTemperatura;
   
   procedure termometro(temperatura: T_temperatura) is 
      valor : Integer := Integer(temperatura);
   begin
      New_Line;
      Put_Line("------------------------------------------------------------");
      Put_Line("0 - 5 - 10 - 15 - 20 - 25 - 30 - 35 - 40 - 45 - 50 - 55 - 60");
      Put_Line("------------------------------------------------------------");
      
      for i in 1..valor loop
         
         Put("|");
      end loop;
      New_Line;
   end termometro;
   

end maqueta;
