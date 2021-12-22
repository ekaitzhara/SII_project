with tipos;  use tipos;

package manejo_array_float is
   
   procedure getElemArray(lista:in out listaElementos; numberOfElem: in Integer);
   -- Este procedimiento rellena la lista de tipo listaElementos, con las temperaturas
   -- que se hayan recogido hasta entonces. El atributo numberOfElem determina cuantos valores
   -- de temperaturas se han recogido, y después los consigue de la lista en el paquete Array_Float

   procedure mostrarArray(lista: listaElementos);
   -- Muestra todos los elementos del array
   
   procedure mediaTemperatura(lista: listaElementos; cont: Integer);
   -- Calcula la temperatura media de los elementos de la lista
   
   procedure umbralTemperatura(lista: listaElementos; cont: Integer);
   -- Calcula las temperaturas por debajo de un umbral preestablecido
   
   procedure maximaTemperatura(lista: listaElementos; cont: Integer);
   -- Calcula la máxima temperatura recogida de los elementos de la lista
   
   procedure minimaTemperatura(lista: listaElementos; cont: Integer);
   -- Calcula la mínima temperatura recogida de los elementos de la lista
   
	procedure addFichero (lista : listaElementos; cont : Integer);
--Este procedimiento lo que hace es crear un archivo ".txt" cuyo formato de nombre es 
 --la fecha y la hora, y guarda en él los valores de temperatura recogidos en "Lista".
 --La finalidad de implementar esto, es poder guardar los datos para proceder a un tratamiento
 --posterior de los mismos.

end manejo_array_float;
