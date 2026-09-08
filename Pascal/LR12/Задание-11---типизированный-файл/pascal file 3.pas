var
  reals1: file of real;
  num, summ: real;
  i: integer;
begin
  assign(reals1, 'Pascalfile3.dat');
  reset(reals1);
  if FileSize(reals1) = 0 then begin
    writeln('Файл пуст!');
    close(reals1);
    exit;
  end;
  summ := 0;
  writeln('Элементы с четными номерами:');
  for i:=0 to Filesize(reals1)-1 do begin
    read(reals1, num);
    if i mod 2 = 1 then begin
      writeln('Номер ', i+1, ': ', num);
      summ := summ + num;
    end;
  end;
  close(reals1);
  writeln('Сумма чётных элементов в файле = ', summ);

end.

