with tipos;  use tipos;

package manejo_array_float is
   
   procedure getElemArray(lista:in out listaElementos; numberOfElem: in Integer);

   procedure mostrarArray(lista: listaElementos);
   
   procedure mediaTemperatura(lista: listaElementos; cont: Integer);
   
   procedure umbralTemperatura(lista: listaElementos; cont: Integer);
   
   procedure maximaTemperatura(lista: listaElementos; cont: Integer);
   
   procedure minimaTemperatura(lista: listaElementos; cont: Integer);
   
	procedure addFichero (lista : listaElementos; cont : Integer);
--Este procedimiento lo que hace es crear un archivo ".txt" cuyo formato de nombre es 
 --la fecha y la hora, y guarda en él los valores de temperatura recogidos en "Lista".
 --La finalidad de implementar esto, es poder guardar los datos para proceder a un tratamiento
 --posterior de los mismos.
end manejo_array_float;
