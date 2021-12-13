with tipos;  use tipos;

package manejo_array_float is
   
   procedure getElemArray(lista:in out listaElementos; numberOfElem: in Integer);

   procedure mostrarArray(lista: listaElementos);
   
   procedure mediaTemperatura(lista: listaElementos; cont: Integer);
   
   procedure umbralTemperatura(lista: listaElementos; cont: Integer);
   
   procedure maximaTemperatura(lista: listaElementos; cont: Integer);
   
   procedure minimaTemperatura(lista: listaElementos; cont: Integer);
   

end manejo_array_float;
