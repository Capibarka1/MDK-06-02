var N, a, b, sq :integer;
begin
  writeln('Введите количество комнат');
  readln(N);
  while N > 0 do begin
    writeln('Введите длину комнаты');
    readln(a);
    writeln('Введите ширину комнаты');
    readln(b);
    writeln('Площадь комнаты = ' + (a * b));
    sq := sq + a * b;
    N := N - 1;
  end;
  writeln('Площадь квартиры = ' + sq);
end.