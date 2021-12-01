with Ada.Text_IO;  use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

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
      f : Float;
   begin
      
      for I in Lista'Range loop
         --f := Float'Value(lista(I));
         --  Put(Lista(I), AFT=>2, EXP=>0);  -- mirar como enseñar el array
         Put(image(lista(I)));
         Put(" , ");
         end loop;
   end Mostrar_Array;
   
end manejo_arrays;
