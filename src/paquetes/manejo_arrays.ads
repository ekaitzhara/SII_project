with tipos; use tipos;

package manejo_arrays is
  
   type G_Lista is array (Natural range <>) of T;   
   
   procedure add(lista: in out G_lista, elem: T);
   
   procedure remove(lista: in out G_lista);
   
   procedure Mostrar_Array (Lista: G_Lista);

end manejo_arrays;
