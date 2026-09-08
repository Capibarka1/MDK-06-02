var
  Arr: array [1..1000] of real;
  n, k, i: integer;
  s, sum: real;
begin
  write('Введите длину массива ');
  readln(n);
  for i:=1 to n do begin
    write('Arr[', i, '] = ');
    readln(Arr[i]);
  end;
  writeln('Введите s ');
  readln(s);
  k := 0;
  sum := 0;
  for i:=1 to n do begin
    if Arr[i] + sum <= s then begin
      inc(k);
      sum := sum + Arr[i];
    end
    else break;
  end;
  writeln('k = ', k);
end.