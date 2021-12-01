generic
   Type T is private;
   Size    : Positive;
   Default : T;
   with function image(Item : in T) return String;

package manejo_arrays is
   
   SubType Index is Positive range 1..Size;
  
   --type G_Lista is array (Natural range <>) of T;   
   
   procedure add(elem: T);
   
   procedure remove;
   
   function get(pos: Positive) return T;
   
	procedure Mostrar_Array;
	
	procedure mediaTemperatura;
	
	procedure umbralTemperatura;
   
private
   type G_lista is array(Index) of T;
    

end manejo_arrays;
