with Ada.Text_IO; use Ada.Text_IO;
with Text_IO; use Text_IO;
with Ada.Calendar; use Ada.Calendar;
with Ada.Calendar.Formatting; use Ada.Calendar.Formatting;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure ficheros is

   ahora:Time;


	fichero1 : File_Type;
	fichero2 : File_Type;

   nombre:String(1..19);
	nombre_bueno : String (1 .. 14);
	contador:Integer:=0;
	begin
	contador:=1;
	ahora := Clock;

	--Put_Line ("Current time: " & Image (ahora));
	nombre:=Image(ahora);
	--Put_Line ("Prueba: " & nombre);

	--Crear ficheros

	for i in 1 .. 19 loop
		if i /= 11 and nombre(i)/= ' ' and nombre(i)/=':' and nombre(i)/='-'then
			nombre_bueno (contador) := nombre (i);
			contador := contador + 1;
		else
			null;
		end if;

	end loop;
	Put_Line(nombre_bueno);
	Create (fichero1, Name => ("C:\TEMP\" & nombre_bueno & ".txt"));

	--Rellenar fichero:

	--Cerrar ficheros
	Close (fichero1);

end ficheros;
