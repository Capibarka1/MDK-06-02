var
  K, Line: integer;
  s: string;
  filetext, filetext2: text;
begin
  write('Введите номер строки, перед которой нужно поставить пустую строку ');
  readln(K);
  assign(filetext, 'text4.txt');
  assign(filetext2, 'text4_2.txt');
  rewrite(filetext2);
  reset(filetext);
  Line := 1;
  if K < 1 then begin
    writeln('Нужно ввести положительное число');
    close(filetext);
    close(filetext2);
    erase(filetext2);
    exit;
  end;
  while not EOF(filetext) do
  begin
    if Line = K then writeln(filetext2, '');
    readln(filetext, s);
    writeln(filetext2, s);
    inc(Line);
  end;
  close(filetext);
  close(filetext2);
  if K < Line then begin
    erase(filetext);
    Rename(filetext2, 'text4.txt');
    writeln('Файл изменён - пустая строка вставлена перед строкой ', K);
  end
  else begin
    erase(filetext2);
    writeln('Строки с номером ', K, ' не существует. Файл оставлен без изменений.');
  end;

end.
