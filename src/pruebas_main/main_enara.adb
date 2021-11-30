with Utilidades; use Utilidades;
with Text_IO; use Text_IO;
procedure main_enara is
CMenu: Character;
begin
  Loop
   CMenu:= Fc_Menu;
   case CMenu is 
      when '1' =>
         Put("1");
      when '2' =>
         Put("2");
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
