var
   input, output: text;
   max_num, min_num, num: integer;
begin
  assign(input,'input.txt');
  assign(output,'output.txt');
  reset(input);
  if EOF(input) then begin
    writeln('Файл input пустой');
    close(input);
    exit;
  end;
  rewrite(output);
  readln(input, num);
  max_num := num;
  min_num := num;
  while not EOF(input) do begin
    readln(input, num);
    if num > max_num then max_num := num;
    if num < min_num then min_num := num;
  end;
  writeln(output, max_num);
  writeln(output, min_num);
  writeln('В файл output записаны максимальное (', max_num, ') и минимальное (', min_num, ') число из файла input');
  close(input);
  close(output);

end.
