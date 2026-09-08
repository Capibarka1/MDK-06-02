var
  s: string;
  i: integer;
begin
  writeln('Введите строку');
  readln(s);
  for i:=1 to length(s)-1 do begin
    if s[length(s)] = s[i] then writeln('Номер символа, который совпадает с последним символом строки ', i);
  end;
end.