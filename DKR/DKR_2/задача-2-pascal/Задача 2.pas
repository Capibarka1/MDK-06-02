var
  s: string;
  uniq, count, i, j: integer;
begin
  write('Введите строку ');
  readln(s);
  uniq := 0;
  count := 0;
  if length(s) < 3 then writeln(0)
  else begin
    for i:=1 to length(s)-2 do begin
      for j:=1 to length(s)-2 do begin
        if (s[i]=s[j]) and (s[i+1]=s[j+1]) and (s[i+2]=s[j+2]) then inc(count);
      end;
      if count = 1 then begin 
        inc(uniq);
        count := 0;
      end;
      count := 0;
    end;
  end;
  print('Количество уникальных строк из 3 символов =', uniq);
end.