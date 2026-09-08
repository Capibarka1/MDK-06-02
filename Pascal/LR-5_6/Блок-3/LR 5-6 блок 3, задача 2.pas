var
  a: array [1..20] of integer;
  n, i, j, num, count: integer;
begin
  writeln('Введите количество элементов в массиве');
  readln(n);
  for i:=1 to n do begin
    writeln('Введите №', i,' элемент массива');
    readln(num);
    a[i] := num;
  end;
  count := n;
  if a[n] < -1 then begin
    a[n] := 0;
    dec(count);
  end;
  for i := n to 1 step -1 do begin
    if a[i] < 0 then begin
      for j:=i to n-1 do begin
        a[j] := a[j + 1];
      end;
      a[n] := 0;
      dec(count);
    end;
  end;
  for i:=1 to count do begin
    write(a[i], ' ');
  end;
end.
