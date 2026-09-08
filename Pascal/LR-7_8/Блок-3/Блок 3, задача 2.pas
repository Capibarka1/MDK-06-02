var
  s: string;
  i, count: integer;
begin
  writeln('Введите строку');
  readln(s);
  for i:=1 to length(s) do begin
    if s[i] in ['0'..'9'] then inc(count);
  end;
  writeln('Количество цифр в строке = ', count)
end.