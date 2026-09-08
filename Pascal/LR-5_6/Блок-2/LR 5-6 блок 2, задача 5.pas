var 
  a: array [1..1000] of integer;
  n, count, max_count, max_num, num, i, j: integer;
begin
  writeln('Введите количество элементов в массиве');
  readln(n);
  for i:=1 to n do begin
    write('Введите элемент массива №',i, ' ');
    readln(num);
    a[i] := num;
  end;
  max_count := 0;
  max_num := 0;
  count := 0;
  for i:=1 to n do begin
    for j:=1 to n do begin
      if a[j] = a[i] then count := count + 1;
    end;
    if count > max_count then begin
      max_count := count;
      max_num := a[i];
    end;
    count := 0;
  end;
  writeln('Наиболее часто повторяющееся число в массиве: ', max_num)
end.
