
CANT_FIL = ...; {cantidad de filas}
CANT_COL = ...; {cantidad de columnas}
MAX_MIN  = ...; {máxima cantidad de minas}


RangoFilas = 1 .. CANT_FIL;
RangoColum = 1 .. CANT_COL;
Tablero    = array [RangoFilas, RangoColum] of Casilla;


Posicion  = record
		 fila    : RangoFilas;
		 columna : RangoColum
	    end;






procedure IniciarTableroVacio(var t:tablero);
var 
i:RangoFilas;
j:RangoColum;

begin
    for i := 1 to cant_fil do
                for j := 1 to cant_col do
                begin
                     t[i,j].oculto:=True;
                     t[i,j].tipo:=libre;
                     t[i,j].minasAlredor:=0;
                end;
end;

procedure DesocultarMinas(var t:tablero);
var
i:RangoFilas;
j:RangoColum;
begin
    for i := 1 to cant_fil do
                for j := 1 to cant_col do
                begin
                    if t[i,j].tipo=Mina then
                        t[i,j].oculto:=False
                    else 
                        t[i,j].oculto:=True
{capaz es innecesario poner un else}
                end;
end;


function Espocisionvalida(f,c:integer):boolean;
var
i,j:integer;
a:Posicion;
begin
    i:=1
    j:=1
    while (a.fila[i]<=cant.fil) and (a.fila[i]<>f) do
        i:=i+1;
    if ((a.fila[i]<=cant.fil)) then
    begin
        while (a.columna[j]<=cant.colm) and (a.columna[j]<>c) do 
            j:=j+1;
        if (a.columna[j]<=cant.colm) then
            Espocisionvalida:=True;
        else
            Espocisionvalida:=False;
    end;
    else
        Espocisionvalida:=False;
end;