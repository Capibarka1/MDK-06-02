var a, b, h, i :integer;
x :real;
begin
  writeln('Программа, которая считает y в функции y = 2x + 1 на промежутке от a до b');
  x := 0.5;
  for i := 25 to 5 step -5 do begin
    x := i / 10;
    writeln('y = ' + (2 * x + 1));
  end;
  writeln('Введите a');
  readln(a);
  writeln('Введите b (больше чем a)');
  readln(b);
  for i := a to b do begin
    x := i;
    writeln('для x = ', x, '  y = ' + (2 * x + 1));
  end;
  writeln('Введите a');
  readln(a);
  writeln('Введите b (больше чем a)');
  readln(b);
  writeln('Введите шаг');
  readln(h);
  for i := a to b step h do begin
    x := i;
    writeln('для x = ', x, '  y = ' + (2 * x + 1));
  end;
end.