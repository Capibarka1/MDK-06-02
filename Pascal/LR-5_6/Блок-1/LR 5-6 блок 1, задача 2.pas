var 
  a: array [1..20] of integer;
  count, summ, start, finish, i: integer;
  pr: longint;
begin
  writeln('Случайный массив на 20 элементов из диапазона [-22, 93]');
  for i:=1 to 20 do begin 
    a[i] := random(-22, 93);
  end;
  writeln(a);
  count := 0;
  pr := 1;
  summ := 0;
  for i:=1 to 20 do begin
    if (i mod 2 = 1) and (a[i] mod 2 = 0) then inc(count);
    if a[i] mod 2 <> 0 then pr := pr * a[i];
  end;
  writeln('Количество чётных элементов массива, стоящих на нечётных местах = ', count);
  writeln('Произведение нечётных элементов массива = ', pr);
  writeln('Введите начало промежутка от 1 до 20');
  readln(start);
  writeln('Введите конец промежутка от 1 до 20');
  readln(finish);
  for i:=start to finish do summ := summ + a[i];
  writeln('Сумма элементов массива на диапазоне от ', start, ' до ', finish, ' = ', summ);
end.
