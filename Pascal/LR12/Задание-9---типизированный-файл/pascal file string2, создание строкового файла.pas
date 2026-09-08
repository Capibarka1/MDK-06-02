type
  MyString = string[255];

var
  str1: file of MyString;
  s: MyString;
  strings, i: integer;
begin
  assign(str1, 'strings.dat');
  write('Введите сколько строк будет в файле ');
  readln(strings);
  rewrite(str1);
  for i:=1 to strings do begin
    writeln('Введите ',i,' строку');
    readln(s);
    write(str1, s);
  end;
  close(str1);
  writeln('Типизированный файл создан успешно!');

end.
