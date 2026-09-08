var a, b :real;
begin
  write('Введите 1-ое действительное число ');
  readln(a);
  write('Введите 2-ое действительное число ');
  readln(b);
  if (a <= b) then begin
    a := 0;
    writeln(a + ' и ' + b);
  end
  else begin
    writeln(a + ' и ' + b);
  end;
end.