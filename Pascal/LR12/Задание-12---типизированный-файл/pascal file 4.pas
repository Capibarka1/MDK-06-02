var
  reals1: file of real;
  num1, num2, num3, last_max: real;
  i: integer;
  max_found: boolean;
begin
  max_found := False;
  assign(reals1, 'Pascalfile4.dat');
  reset(reals1);
  if Filesize(reals1) < 3 then begin
    writeln('В файле меньше 3 чисел или он пустой');
    close(reals1);
    exit;
  end;
  seek(reals1, 0);
  read(reals1, num1);
  read(reals1, num2);
  read(reals1, num3);
  if (num2 > num1) and (num2 > num3) then 
  begin
    last_max := num2;
    max_found := True;
  end;
  for i := 3 to FileSize(reals1) - 1 do 
  begin
    num1 := num2;
    num2 := num3;
    read(reals1, num3);
    if (num2 > num1) and (num2 > num3) then 
    begin
      last_max := num2;
      max_found := True;
    end;
  end;
  close(reals1);
  if max_found then writeln('Последний локальный максимум в файле = ', last_max)
  else writeln('Локальных максимумов нет');

end.
