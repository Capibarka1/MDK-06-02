var
  num1: file of real;
  n: real;
  i, nums: integer;
begin
  assign(num1, 'Pascalfile3.dat');
  write('Введите сколько чисел будет в файле ');
  readln(nums);
  rewrite(num1);
  for i:=1 to nums do begin
    writeln('Введите ',i,' число');
    readln(n);
    write(num1, n);
  end;
  close(num1);
  writeln('Типизированный файл создан успешно!');

end.
