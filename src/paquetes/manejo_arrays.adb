with Ada.Text_IO;  use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;

package body manejo_arrays is
   
   cont: Integer := 0;

   
   function makeArray return G_lista is
      dim : Natural;
   begin
      New_Line;
      Put_Line("Añade las dimension del array");
      Get(dim);
      
      declare
         New_Array : G_lista(1..dim);
      begin
         return New_Array;
      end;
   end makeArray;
   
   
   procedure add(lista: in out G_lista, elem: T) is
   begin 
      if (cont = lista'Length) then
         lista(cont) := elem;
      else
         cont := cont + 1;
         lista(cont) := elem;
      end if;
      
   end add;
   
   
   procedure remove(lista: in out G_lista) is
   begin
      if (cont > 0) then
         cont := cont - 1;
      end if;
      
      
   end remove;
   
   

end manejo_arrays;
