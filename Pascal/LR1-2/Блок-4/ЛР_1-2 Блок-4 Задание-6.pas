var a1, a2, b1, b2 :real;
beat :boolean;
begin
  write('Введите номер столбца, на которой стоит слон ');
  readln(a1);
  write('Введите номер строки, на которой стоит слон ');
  readln(a2);
  write('Введите номер столбца, на которой стоит другая фигура ');
  readln(b1);
  write('Введите номер строки, на которой стоит другая фигура ');
  readln(b2);
  beat := False;
  if (a1 + 2 <= 8) and (b1 = a1 + 2) and (a2 + 1 <= 8) and (b2 = a2 + 1) then begin
    writeln('Слон может бить фигуру');
    beat := True
  end;
  if (a1 + 1 <= 8) and (b1 = a1 + 1) and (a2 + 2 <= 8) and (b2 = a2 + 2) then begin
    writeln('Слон может бить фигуру');
    beat := True
  end;
  if (a1 - 1 > 0) and (b1 = a1 - 1) and (a2 + 2 <= 8) and (b2 = a2 + 2) then begin
    writeln('Слон может бить фигуру');
    beat := True
  end;
  if (a1 - 2 > 0) and (b1 = a1 - 2) and (a2 + 1 <= 8) and (b2 = a2 + 1) then begin
    writeln('Слон может бить фигуру');
    beat := True
  end;
  if (a1 - 2 > 0) and (b1 = a1 - 2) and (a2 - 1 > 0) and (b2 = a2 - 1) then begin
    writeln('Слон может бить фигуру');
    beat := True
  end;
  if (a1 - 1 > 0) and (b1 = a1 - 1) and (a2 - 2 > 0) and (b2 = a2 - 2) then begin
    writeln('Слон может бить фигуру');
    beat := True
  end;
  if (a1 + 1 <= 8) and (b1 = a1 + 1) and (a2 - 2 > 0) and (b2 = a2 - 2) then begin
    writeln('Слон может бить фигуру');
    beat := True
  end;
  if (a1 + 2 <= 8) and (b1 = a1 + 2) and (a2 - 1 > 0) and (b2 = a2 - 1) then begin
    writeln('Слон может бить фигуру');
    beat := True
  end;
  if beat = False then begin
    writeln('Слон не может бить фигуру');
  end;
end.