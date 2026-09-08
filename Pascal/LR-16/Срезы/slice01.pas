var 
  Arr: array of integer;

begin
  println('Сколько элементов в массиве');
  var N := ReadInteger;
  Setlength(Arr, N);
  for var i:=0 to N-1 do begin
    Arr[i] := random(-100, 100);
  end;
  writeln('Массив:');
  Arr[::1].println();
  writeln('Результат:');
  Arr[::-1].println();
end.