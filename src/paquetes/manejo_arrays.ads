generic
   type G_lista is private;   -- Lista generica
   type T is private;

package manejo_arrays is

   function makeArray return G_lista;
   
   procedure add(lista: in out G_lista, elem: T);
   
   procedure remove(lista: in out G_lista);
   

end manejo_arrays;
