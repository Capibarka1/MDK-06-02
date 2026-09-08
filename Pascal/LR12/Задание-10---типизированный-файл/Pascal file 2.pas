var
  reals1, reals2, reals3: file of real;
  num: real;
  i: integer;
begin
  assign(reals1, 'Pascalfile2.dat');
  assign(reals2, 'Pascalfile2_2.dat');
  assign(reals3, 'Pascalfile2_3.dat');
  reset(reals1);
  if FileSize(reals1) = 0 then
  begin
    writeln('Файл пуст!');
    close(reals1);
    exit;
  end;
  rewrite(reals2);
  rewrite(reals3);
  for i:=0 to Filesize(reals1)-1 do begin
    read(reals1, num);
    if i mod 2 = 0 then write(reals2, num)
    else write(reals3, num);
  end;
  close(reals1);
  close(reals2);
  close(reals3);
  writeln('Разделение завершено!');
  reset(reals2);
  writeln('Файл с нечетными номерами:');
  while not EOF(reals2) do
  begin
    read(reals2, num);
    write(num + ' ');
  end;
  writeln;
  close(reals2);
  reset(reals3);
  writeln('Файл с четными номерами:');
  while not EOF(reals3) do
  begin
    read(reals3, num);
    write(num + ' ');
  end;
  close(reals3);

end.
