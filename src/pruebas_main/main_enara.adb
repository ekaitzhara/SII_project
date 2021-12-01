with Utilidades; use Utilidades;
with Text_IO; use Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure main_enara is
   CMenu: Character;
   
   type NArray is array (1..25) of Float;
   
   procedure Mostrar_Array (Lista: NArray) is
   begin
      for I in Lista'Range loop
         Put(Lista(I), AFT=>2, EXP=>0);
         Put(" , ");
         end loop;
   end Mostrar_Array;
   
   Mi_Array: NArray;
   Elem:  Float;
begin
  Loop
   CMenu:= Fc_Menu;
   case CMenu is 
      when '1' =>
         for I in Mi_Array'Range loop
            Put("Meter valor " &Integer'Image(I));
            Get(Elem);
            Mi_Array(I):=Elem;
         end loop;
         
      when '2' =>
         Mostrar_Array(Mi_Array);
      when '3' =>
         Put("3");
      when '4' =>
         Put("4");
      when '5' =>
         Put("5");
      when '6' => 
         Put("6");
      when '0' =>
         exit;
      when others =>
         null;
         
      end case;
   end loop;
   
   
   
end main_enara;
