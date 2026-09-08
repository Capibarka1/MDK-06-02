var
  s: string;
  filetext: text;
begin
  write('Введите строку для добавления в файл ');
  readln(s);
  assign(filetext,'text3.txt');
  append(filetext); 
  writeln(filetext, s); 
  close(filetext);
  write('Строка добавлена в файл');

end.
