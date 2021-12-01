with manejo_arrays;
with Ada.Text_IO;  use Ada.Text_IO;
with Ada.Float_Text_IO;  use Ada.Float_Text_IO;

procedure main_ekaitz is
   
   package Array_Float is new manejo_arrays(T => Float, Size => 25, Default => Float'First);
   
begin
   
   Array_Float.add(0.5);
   Put_Line(Array_Float.get(1)'Image);
   Put_Line(Float'First'Image);
   
   Array_Float.Mostrar_Array;
   
end main_ekaitz;
