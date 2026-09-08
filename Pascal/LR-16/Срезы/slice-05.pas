var 
  a: array of integer;

begin
  println('Сколько элементов в массиве');
  var k := readInteger;
  Setlength(a, k);
  for var i:=0 to k-1 do begin
    a[i] := random(-100, 100);
  end;
  
  write('массив: ');
  a[::1].println();
  
  println('Введите n:');
  var n := readInteger;
  
  var min := a[::1].indexMin;
  a := a[:min-1] + Arr(n) + a[min:];
  
  write('результат: ');
  a[::1].println();
end.