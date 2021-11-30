with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Float_Random;


procedure main_jonan is
   
   type T_tension is new Float range 0.0..5.0;
   package paqueteTension is new Ada.Text_IO.Float_IO(T_tension);
   use paqueteTension;

   procedure pcGeneraTension (valorTension : out T_tension) is

      G_tension : Ada.Numerics.Float_Random.Generator;
      valorTension_aux : Float;

   begin

      Ada.Numerics.Float_Random.Reset(G_tension);
      --Ada.Numerics.Float_Random.Reset(G_salida);

      valorTension_aux := Ada.Numerics.Float_Random.Random(G_tension);
      --valorSalidaAnterior_aux := Ada.Numerics.Float_Random.Random(G_salida);

      valorTension := 5.00 * T_tension(valorTension_aux);
      --valorSalidaAnterior := 5.00 * T_tension(valorSalidaAnterior_aux);

      --Put_Line("La acción de control generada: " & T_tension'Image(valorTension));
      --Put_Line("La salida anterior: " & T_tension'Image(valorSalidaAnterior));

   end pcGeneraTension;
   
   --Variables main Jonan
   num : T_tension;
   
begin
   
   pcGeneraTension(num);
   
   Put(num);
   
end main_jonan;
