with manejo_arrays;

package tipos is
   
   type T_temperatura is new Float range 0.0..100.0;
   --Tipo float con rango de 0.0 a 100.0
   
   type T_tension is new Float range 0.0..5.0;
   --Tipo float con rango de 0.0 a 5.0
   
   package Array_Float is new manejo_arrays(T => T_temperatura, Size => 25, Default => T_temperatura'First);
   -- Paquete que instancia el paquete generico de manejo_arrays en un array de Float. Esto se ha realizado ya que 
   -- se ha analizado la necesidad al tener que realizar calculos matemáticos. Para instanciar el paquete generico
   -- se ha tenido que establecer que tipo de elementos contiene el array(Float), el tamaño de esto y un elemento por
   -- defecto para rellenar las posiciones donde no se han recogido aun valores de temperatura
   
   type listaElementos is array(Natural range<>) of T_temperatura;
   -- Lista auxiliar para el desarrollo de los calculos matemáticos como calcular la medio, máxima o mínima temperatura.
   -- Esta lista auxiliar solo contendrá valores que se hayan recogido, es decir, solo las temperaturas tomadas de la estación,
   -- a diferencia del Array_Float que contiene la lista entera (temperaturas recogidas y aun no recogidas).
   
end tipos;
