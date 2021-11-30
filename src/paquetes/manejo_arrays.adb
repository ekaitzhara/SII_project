with Ada.Text_IO;  use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;

package body manejo_arrays is
   
   
   cont: Integer := 0;

  
   procedure add(lista: in out G_lista, elem: T) is
   Aux: Integer:=0;
   begin 
      if (cont = lista'Length) then
         Cont:=5;
         for I in Lista'Range loop
            if Aux < 4 then 
               Lista(Aux+1):=Lista(Lista'Length-Aux);
            else 
               Lista(Aux+1):=T'Null_Parameter;
            end if;
           
            Aux:= Aux+1;
         end loop;
         Lista(Cont):=Elem;
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
