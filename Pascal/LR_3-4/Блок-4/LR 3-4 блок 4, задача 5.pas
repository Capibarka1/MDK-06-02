var N, index, max_index: integer;
var power, all, max: real;
begin
  writeln('Введите количество предприятий');
  readln(N);
  all := 0;
  max := 0;
  max_index := 0;
  index := 0;
  while index < N do begin
    index := index + 1;
    writeln('Введите мощность предприятия номер ', index);
    readln(power);
    all := all + power;
    if power > max then begin
      max := power;
      max_index := index;
    end;
  end;
  writeln('Общая мощность предприятий = ', all);
  writeln('Средняя мощность предприятий по отрасли = ', (all / index):1:2);
  writeln('Номер предприятия с наибольшей энергетической мощностью = ', max_index);
end.