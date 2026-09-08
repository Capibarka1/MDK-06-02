var
  a: array of real; // Глобальная переменная
  N, i: integer; // Глобальные переменные
  
procedure findNums(arr: array of real); // Формальный параметр и передача параметра по значению
var
  min_abs, max_negative: real; // Локальные переменные
  i: integer; // Локальная переменная
begin
  min_abs := arr[1];
  max_negative := 0;
  for i:=0 to length(arr)-1 do begin
    if abs(arr[i]) < abs(min_abs) then min_abs := arr[i];
    if (arr[i] < 0) and (max_negative = 0) then max_negative := arr[i]
    else if (arr[i] < 0) and (max_negative < arr[i]) then max_negative := arr[i];
  end;
  writeln('Минимальный элемент массива по модулю = ', min_abs);
  if max_negative = 0 then writeln('Нет отрицательных элементов')
  else writeln('Максимальный отрицательный элемент массива = ', max_negative);
end;
  
begin
  write('Введите длину массива ');
  readln(N);
  SetLength(a, N);
  for i:=0 to N-1 do begin
    write('a[',i,'] = ');
    readln(a[i]);
  end;
  findNums(a); // Фактический параметр

end.

