var
  chars_file: file of char;
  chars: char;
  i: integer;
begin
  assign(chars_file, 'PascalChars.txt');
  reset(chars_file);
  if FileSize(chars_file) = 0 then begin
    writeln('Файл пуст!');
    close(chars_file);
    exit;
  end;
  writeln('Текущее содержимое файла:');
  while not EOF(chars_file) do begin
    read(chars_file, chars);
    write(chars);
  end;
  writeln;
  writeln('Заменяем чётные элементы на знак !');
  seek(chars_file, 0);
  for i:=1 to FileSize(chars_file) step 2 do begin
    seek(chars_file, i);
    write(chars_file, '!');
  end;
  seek(chars_file, 0);
  while not EOF(chars_file) do begin
    read(chars_file, chars);
    write(chars);
  end;
  writeln;
  writeln('Замена произошла успешно');
  close(chars_file);
end.

