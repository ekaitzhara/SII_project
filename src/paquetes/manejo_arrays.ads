generic
   Type T is private;
   Size    : Positive;
   Default : T;

package manejo_arrays is
   
   subType Index is Positive range 1..Size;
   
   procedure add(elem: T);
   
   function getNumElements return Integer;
   
   function get(pos: Positive) return T;
   
private
   type G_lista is array(Index) of T;

end manejo_arrays;
