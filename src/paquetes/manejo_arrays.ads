generic
   Type T is private;
   Size    : Positive;
   Default : T;

package manejo_arrays is
   
   SubType Index is Positive range 1..Size;
  
   --type G_Lista is array (Natural range <>) of T;   
   
   procedure add(elem: T);
   
   procedure remove;
   
   function get(pos: Positive) return T;
   
private
   type G_lista is array(Index) of T;
   

end manejo_arrays;
