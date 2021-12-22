with manejo_arrays;

package tipos is
   
   type T_temperatura is new Float range 0.0..100.0; --Tipo float con rango de 0.0 a 100.0
   
   type T_tension is new Float range 0.0..5.0; --Tipo float con rango de 0.0 a 5.0
   
   package Array_Float is new manejo_arrays(T => T_temperatura, Size => 25, Default => T_temperatura'First);
   
   type listaElementos is array(Natural range<>) of T_temperatura;
   
end tipos;
