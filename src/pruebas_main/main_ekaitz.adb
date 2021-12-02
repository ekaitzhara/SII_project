with manejo_array_float;  use manejo_array_float;
with tipos;   use tipos;
with Ada.Text_IO;  use Ada.Text_IO;
with Ada.Float_Text_IO;  use Ada.Float_Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

procedure main_ekaitz is
   
   numberOfElem : Integer;
   
begin
   
   Array_Float.add(0.5);
   Put_Line(Array_Float.get(1)'Image);
   Put_Line(Array_Float.getNumElements'Image);
   
   Array_Float.add(0.6);
   Put_Line(Array_Float.get(2)'Image);
   Put_Line(Array_Float.getNumElements'Image);
   
   Array_Float.add(0.7);
   Put_Line(Array_Float.get(3)'Image);
   Put_Line(Array_Float.getNumElements'Image);

   numberOfElem := Array_Float.getNumElements;
   
   declare
      lista : listaElementos(1..numberOfElem);
   begin
      getElemArray(lista,numberOfElem);
      mediaTemperatura(lista, numberOfElem);
      umbralTemperatura(lista, numberOfElem);
      
      mostrarArray(lista);
   end;
   
   
end main_ekaitz;
