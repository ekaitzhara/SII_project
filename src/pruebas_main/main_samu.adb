with Ada.Text_IO; use Ada.Text_IO;
with Text_IO; use Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure main_samu is
	
	type a_temperatura is array (1 .. 25) of Float;
	
	procedure temperatura_media (lista :in a_temperatura; contador : in Integer) is
		suma : Float:=0.0;
		media:Float:=0.0;
	begin
		
		for i in 1 .. contador loop
			suma := suma + lista (i);
			
		end loop;
		media := suma / Float(contador-1);
		Put ("La temperatura media es de: " );
		Put(media, Aft => 2, Exp => 0);
		New_Line;
	end temperatura_media;
	
	procedure umbral_temperatura (lista : in a_temperatura; contador : in Integer) is
		porcentaje : float;
		cont_mayor : Integer := 0;
		umbral:Float:=0.0;
	begin
		Put ("Dame un umbral: ");
	Get (umbral);
	New_Line;
		for i in 1 .. contador loop
			if lista (i) > umbral then
				cont_mayor := cont_mayor + 1;
				end if;
		end loop;
			porcentaje :=(Float(cont_mayor) / Float(contador-1)) * 100.0;
			Put ("El porcentaje de temperaturas que supera al umbral es : ");
			Put (porcentaje, Aft => 2, Exp => 0);
			Put (" %");
			New_Line;
	end umbral_temperatura;
	
	
	matriz : a_temperatura;
	fin : integer := 4;
	contador:Integer:=1;

	
	fichero1 : File_Type;
	fichero2 : File_Type;
	linea : String (1 .. 200);
	lon_linea:Natural;
	
	--abierto : Boolean; --Dice si un fichero está abierto
	
begin

	--Abrir ficheros
	Open (fichero1, Mode => In_File, Name => "C:\TEMP\original.txt");
	Create (fichero2, Name => "C:\TEMP\copia.txt");
	
	--Copiar fichero1 en fichero2
	while not End_Of_File (fichero1) loop
		Get_Line (fichero1, linea, lon_linea);
		Put_Line (fichero2, linea (1 .. lon_linea));
	end loop;
	
	--Cerrar ficheros
	Close (fichero1);
	Close (fichero2);

	null;
	
	--Para probar que calcula la media, se introducen valores hasta que el usuario mete un 0.
	
	while fin /= 0 loop
		Put ("Introduce una temperatura: ");
		Get (matriz (contador));
		New_Line;
		contador := contador + 1;
		
		Put ("¿Otra temperatura?");
		Get (fin);
		New_Line;
		
	end loop;
	temperatura_media (matriz, contador);
	umbral_temperatura (matriz, contador);
			
end main_samu;
