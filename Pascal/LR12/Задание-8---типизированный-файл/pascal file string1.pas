var
  chars, chars2: file of char;
  last_space, i: integer;
  ch: char;
  space_found: boolean; 
begin
  space_found := False;
  assign(chars, 'chars.txt');
  assign(chars2, 'chars_2.txt');
  reset(chars);
  for i:=filesize(chars)-1 downto 0 do begin
    seek(chars, i);
    read(chars, ch);
    if ch = ' ' then begin
      last_space := i;
      space_found := True;
      break
    end;
  end;
  if space_found = False then begin
    writeln('Пробелов в файле chars.txt нет');
    close(chars);
    exit;
  end;
  rewrite(chars2);
  seek(chars, 0);
  for i:=0 to last_space-1 do begin
    read(chars, ch);
    write(chars2, ch);
  end;
  close(chars);
  close(chars2);
  erase(chars);
  Rename(chars2, 'chars.txt');
  writeln('В файле chars.txt были удалены все символы после последнего пробела');

end.
