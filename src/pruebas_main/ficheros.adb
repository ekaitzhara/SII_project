with Ada.Text_IO; use Ada.Text_IO;
with Text_IO; use Text_IO;

procedure ficheros is

	fichero1 : File_Type;
	fichero2 : File_Type;
	linea : String (1 .. 200);
	lon_linea:Natural;

	abierto : Boolean; --Dice si un fichero está abierto

begin
	--Abrir ficheros
	Open (fichero1, Mode => In_File, Name => "original.txt");
	Create (fichero2, Name => "copia.txt");

	--Copiar fichero1 en fichero2
	while not End_Of_File (fichero1) loop
		Get_Line (fichero1, linea, lon_linea);
		Put_Line (fichero2, linea (1 .. lon_linea));
	end loop;

	--Cerrar ficheros
	Close (fichero1);
	Close (fichero2);
end ficheros;
