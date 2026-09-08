type
  MyString = string[255];
var
  str1, str2: file of MyString;
  s: MyString;
  maxLength, i: integer;
begin
  assign(str1, 'strings.dat');
  assign(str2, 'strings_2.dat');
  reset(str1);
  maxLength := 0;
  for i := 0 to FileSize(str1) - 1 do begin
    seek(str1, i);
    read(str1, s);
    if length(s) > maxLength then maxLength := length(s);
  end;
  reset(str1);
  rewrite(str2);
  for i:=FileSize(str1) - 1 downto 0 do begin
    seek(str1, i);
    read(str1, s);
    if length(s) = maxLength then write(str2, s);
  end;
  close(str1);
  close(str2);
  writeln('В был создан strings_2.dat, в котором все строки макисмальной длины из strings.dat выведены в обратном порядке');
  writeln('Strings2.dat');
  reset(str2);
  for i := 0 to FileSize(str2) - 1 do begin
    read(str2, s);
    writeln(s);
  end;

end.
