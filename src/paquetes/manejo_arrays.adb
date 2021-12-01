with Ada.Text_IO;  use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;

package body manejo_arrays is
   
   
   cont: Integer := 0;
   lista: G_lista;
  
   procedure add(elem: T) is
   Aux: Integer:=0;
   begin 
      if (cont = lista'Length) then
         Cont:=5;
         for I in Lista'Range loop
            if Aux < 4 then 
               Lista(Aux+1):=Lista(Lista'Length-Aux);
            else 
               Lista(Aux+1):=Default;  -- valor por defecto asignado al instanciar el paquete generico
            end if;
           
            Aux:= Aux+1;
         end loop;
         Lista(Cont):=Elem;
      else
         cont := cont + 1;
         lista(cont) := elem;
      end if;
      
   end add;
   
   
   procedure remove is
   begin
      if (cont > 0) then
         cont := cont - 1;
      end if;
  
   end remove;
   
   function get(pos: Positive) return T is
   begin
      return lista(pos);
   end get;
   
   
   procedure Mostrar_Array is
   begin
      for I in Lista'Range loop
         --  Put(Lista(I), AFT=>2, EXP=>0);  -- mirar como enseñar el array
         Put(T'Image(lista(I)));
         Put(" , ");
         end loop;
	end Mostrar_Array;
	
	procedure mediaTemperatura is
		suma : Float:=0.0;
		media:Float:=0.0;
	begin
		
		for i in 1 .. cont loop
			suma := suma + lista (i);
			
		end loop;
		media := suma / Float(cont-1);
		Put ("La temperatura media es de: " );
		Put(media, Aft => 2, Exp => 0);
		New_Line;
	end mediaTemperatura;
	
	procedure umbralTemperatura is
		porcentaje : float;
		cont_mayor : Integer := 0;
		umbral:Float:=0.0;
	begin
		Put ("Dame un umbral: ");
	Get (umbral);
	New_Line;
		for i in 1 .. cont loop
			if lista (i) > umbral then
				cont_mayor := cont_mayor + 1;
				end if;
		end loop;
			porcentaje :=(Float(cont_mayor) / Float(cont-1)) * 100.0;
			Put ("El porcentaje de temperaturas que supera al umbral es : ");
			Put (porcentaje, Aft => 2, Exp => 0);
			Put (" %");
			New_Line;
	end umbralTemperatura;
   
end manejo_arrays;
