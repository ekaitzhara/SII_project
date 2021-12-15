with Ada.Text_IO;   use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

package body manejo_array_float is
   
   
   
   procedure getElemArray(lista:in out listaElementos; numberOfElem: in Integer) is
   begin
      for i in 1..numberOfElem loop
         lista(i) := Array_Float.get(i);
      end loop;
      
   end getElemArray;
   
   
   procedure mostrarArray(lista: listaElementos) is
   begin
      New_Line;
      Put ("{");
      for I in lista'Range loop
         Put(Float(lista(I)), AFT=>2, EXP=>0);
         if I /= lista'Length then
            Put(" , ");
         end if;
      end loop;
      Put ("}");
      New_Line;
	end mostrarArray;
	
	procedure mediaTemperatura(lista: listaElementos; cont: Integer) is
		suma : Float := 0.0;
		media : Float := 0.0;
   begin
      New_Line;
      for i in 1 .. cont loop
         suma := suma + Float(lista(i));
      end loop;
      media := suma / Float(cont);
      Put ("La temperatura media es de: " );
      Put(media, Aft => 2, Exp => 0);
      New_Line;
	end mediaTemperatura;
	
	procedure umbralTemperatura(lista: listaElementos; cont: Integer) is
		porcentaje : float;
		cont_mayor : Integer := 0;
		umbral : Float := 0.0;
   begin
      Put ("Dame un umbral: ");
      Get (umbral);
      New_Line;
      for i in 1 .. cont loop
         if Float(lista (i)) > umbral then
            cont_mayor := cont_mayor + 1;
         end if;
      end loop;
      porcentaje := (Float(cont_mayor) / Float(cont)) * 100.0;
      Put ("El porcentaje de temperaturas que supera al umbral es : ");
      Put (porcentaje, Aft => 2, Exp => 0);
      Put (" %");
      New_Line;
   end umbralTemperatura;
   
   procedure maximaTemperatura(lista: listaElementos; cont: Integer) is
      max : Float := Float'First;
   begin
      for i in 1 .. cont loop
         if Float(lista (i)) > max then
            max := Float(lista(i));
         end if;
      end loop;
      
      New_Line;
      Put ("La temperatura máxima es : ");
      Put (max, Aft => 2, Exp => 0);
      New_Line;
      
   end maximaTemperatura;
   
   procedure minimaTemperatura(lista: listaElementos; cont: Integer) is
      min : Float := Float'Last;
   begin
      for i in 1 .. cont loop
         if Float(lista (i)) < min then
            min := Float(lista(i));
         end if;
      end loop;
      
      New_Line;
      Put ("La temperatura mínima es : ");
      Put (min, Aft => 2, Exp => 0);
      New_Line;
   
   end minimaTemperatura;
   
   

end manejo_array_float;
