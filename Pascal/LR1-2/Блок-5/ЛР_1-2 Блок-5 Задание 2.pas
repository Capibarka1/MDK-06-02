var d1, d2, d3 :integer;
begin
  write('Введите вес 1-ой гантели ');
  readln(d1);
  write('Введите вес 2-ой гантели ');
  readln(d2);
  write('Введите вес 3-ей гантели ');
  readln(d3);
  if (d1 > d2) and (d1 > d3) then begin
    if (d2 > d3) then begin
      writeln('Разница между самыми тяжёлыми и лёгкими гантелями = ' + (d1 - d3));
    end
    else begin
      writeln('Разница между самыми тяжёлыми и лёгкими гантелями = ' + (d1 - d2));
    end;
  end;
  if (d2 > d1) and (d2 > d3) then begin
    if (d1 > d3) then begin
      writeln('Разница между самыми тяжёлыми и лёгкими гантелями = ' + (d2 - d3));
    end
    else begin
      writeln('Разница между самыми тяжёлыми и лёгкими гантелями = ' + (d2 - d1));
    end;
  end;
  if (d3 > d2) and (d3 > d1) then begin
    if (d2 > d1) then begin
      writeln('Разница между самыми тяжёлыми и лёгкими гантелями = ' + (d3 - d1));
    end
    else begin
      writeln('Разница между самыми тяжёлыми и лёгкими гантелями = ' + (d3 - d2));
    end;
  end;
end.