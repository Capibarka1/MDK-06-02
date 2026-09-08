var
  reals1, reals2: file of real;
  num, min_num, max_num: real;
  min_num_index, max_num_index: integer;
  i: integer;
begin
  assign(reals1, 'Pascalfile5.dat');
  assign(reals2, 'Pascalfile5_2.dat');
  reset(reals1);
  if FileSize(reals1) = 0 then begin
    writeln('Файл пуст!');
    close(reals1);
    exit;
  end;
  min_num_index := 0;
  max_num_index := 0;
  read(reals1, num);
  min_num := num;
  max_num := num;
  writeln('Изначальная последовательность: ');
  write(num, ' ');
  for i:=1 to Filesize(reals1)-1 do begin
    read(reals1, num);
    if num > max_num then begin
      max_num := num;
      max_num_index := i;
    end;
    if num < min_num then begin
      min_num := num;
      min_num_index := i;
    end;
    write(num, ' ');
  end;
  seek(reals1, 0);
  rewrite(reals2);
  writeln;
  writeln('Новая последовательность, в которой поменяли местами максимальное и минимальное число:');
  for i:=0 to Filesize(reals1)-1 do begin
    read(reals1, num);
    if i = min_num_index then begin
      write(max_num, ' ');
      write(reals2, max_num);
    end
    else if i = max_num_index then begin
      write(min_num, ' ');
      write(reals2, min_num);
    end
    else begin
      write(num, ' ');
      write(reals2, num);
    end;
  end;
  close(reals2);
  close(reals1);
  DeleteFile('Pascalfile5.dat');
  rename(reals2, 'Pascalfile5.dat');
  writeln('В файле теперь именно такая последовательность');

end.

