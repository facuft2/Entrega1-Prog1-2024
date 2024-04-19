//  SEPARADOR   = ' ';   { caracter que separa palabras }
//  FINALIZADOR = '.';   { caracter que determina fin de oración }

// Procedimiento leerPalabraLargo. Lee de la entrada estándar una palabra,
// es decir, una cadena de caracteres terminada en SEPARADOR o FINALIZADOR.
// Retorna en el parámetro de salida largo el largo de la palabra (sin contar
// al SEPARADOR o FINALIZADOR) y en el parámetro de salida fin un booleano
// que indica si el último carácter es FINALIZADOR o no. Asumir que el largo
// de la palabra es mayor o igual que uno.

procedure leerPalabraLargo ( var largo : integer; var fin : boolean);
var
  c : char;
begin
    largo := 0;
    fin := false;
    read(c);
    while (c <> SEPARADOR) and (c <> FINALIZADOR) do begin
        largo := largo + 1;
        read(c);
    end;
    if c = FINALIZADOR then
        fin := true;
    end;

// Procedimiento leerOracionDatos. Lee de la entrada estándar una oración
// compuesta de palabras separadas por un único carácter SEPARADOR, que
// finaliza con el carácter FINALIZADOR. Retorna en el parámetro de salida
// cantPalabras la cantidad de palabras de la oración, en masLarga la
// cantidad de letras de la palabra más larga y en masCorta la cantidad de
// letras de la palabra más corta. Asumir que la oración tiene al menos una
// palabra. Notar que para implementar este procedimiento se debe invocar
// al procedimiento leerPalabraLargo.

procedure leerOracionDatos (var cantPalabras, masLarga, masCorta : integer);
var
  largo : integer;
  fin : boolean;
begin
    cantPalabras := 0;
    masLarga := 0;
    masCorta := 0;
    leerPalabraLargo(largo, fin);
    while not fin do begin
        cantPalabras := cantPalabras + 1;
        if largo > masLarga then
            masLarga := largo;
        if (largo < masCorta) or (masCorta = 0) then
            masCorta := largo;
        leerPalabraLargo(largo, fin);
    end;
    cantPalabras := cantPalabras + 1;
    if largo > masLarga then
        masLarga := largo;
    if (largo < masCorta) or (masCorta = 0) then
        masCorta := largo;
end;
