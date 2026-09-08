var
  s1, s2: string;
  i, count: integer;
begin
  writeln('Введите строку №1');
  readln(s1);
  writeln('Введите строку №2');
  readln(s2);
  if length(s1) > length(s2) then begin
    count := length(s1) - length(s2);
    writeln;
    for i:=1 to count do writeln(s1);
  end
  else begin
    count := length(s2) - length(s1);
    writeln;
    for i:=1 to count do writeln(s2);
  end;
end.