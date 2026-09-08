var
  a: array of array of real; // Глобальная переменная
  a2: array of real; // Глобальная переменная
  n, m: integer; // Глобальные переменные
  
function CreateMatrix (var n,  m: integer): array of array of real; // Формальные параметры и передача параметров по ссылке
var
  i, j: integer; // Локальные переменные
  arr: array of array of real; // Локальная переменная
begin
  SetLength(arr, n);
  for i:=0 to n-1 do SetLength(arr[i], m);
  for i:=0 to n-1 do begin
    for j:=0 to m-1 do begin
      write('a[',i,',',j,'] = ');
      readln(arr[i,j]);
    end;
  end;
  m := 0;
  n := 0;
  CreateMatrix := arr;
end;

function Matrix (arr: array of array of real): array of real; // Формальный параметр и передача параметра по значению
var
  i, j: integer; // Локальные переменные
  a: array of real; // Локальная переменная
  flag: boolean; // Локальная переменная
begin
  SetLength(a, length(arr));
  flag:= False;
  for i:=0 to length(arr)-1 do begin
    for j:=0 to length(arr[i])-1 do begin
      if arr[i, j] < 0 then begin
      flag := True;
      break;
      end;
    end;
    if flag then begin
      a[i] := -1;
      flag := False;
    end else a[i] := 1;
  end;
  Matrix := a;
end;

begin
  n := 8;
  m := 6;
  a := CreateMatrix(n, m); // Фактические параметры
  a2 := Matrix(a); // Фактический параметр
  writeln(a2);
  writeln('n = ', n, ' m = ', m);
end.
