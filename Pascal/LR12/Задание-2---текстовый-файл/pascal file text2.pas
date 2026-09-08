var
  N, K, i: integer;
  filetext: text;
begin
  write('Введите количество строк в файле ');
  readln(N);
  write('Введите количество звёздочек в строке ');
  readln(K);
  assign(filetext,'text2.txt');
  rewrite(filetext);
  for i:=1 to N do begin
    writeln(filetext, StringOfChar('*', K));
  end;
  writeln('В файл была записана данная последовательность звёздочек');
  for i:=1 to N do begin
    writeln(StringOfChar('*', K));
  end;
  close(filetext);

end.
