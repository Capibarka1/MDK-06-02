var 
  Arr: array of integer;

begin
  println('Сколько элементов в массиве');
  var N := ReadInteger;
  Setlength(Arr, N);
  for var i:=0 to N-1 do begin
    Arr[i] := random(-100, 100);
  end;
  write('массив: ');
  Arr[::1].println();
  
  var max := Arr[::1].indexMax;
  Arr := Arr[:max] + Arr[max+1:];
  
  write('результат: ');
  Arr[::1].println();
end.