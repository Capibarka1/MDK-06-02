var
   filetext, filetext2: text;
   i: integer;
   s: string;
begin
  assign(filetext, 'text6.txt');
  assign(filetext2, 'text6_2.txt');
  rewrite(filetext2);
  reset(filetext);
  while not EOF(filetext) do
  begin
    readln(filetext, s);
    if s = '' then continue;
    writeln(filetext2, s);
  end;
  close(filetext);
  close(filetext2);
  erase(filetext);
  Rename(filetext2, 'text6.txt');
  writeln('Из файла были удалены все пустые строки');

end.
