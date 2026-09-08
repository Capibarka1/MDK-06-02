var S, bottles, remains :integer;
begin
  write('Введите количество копеек ');
  readln(S);
  if S >= 45 then begin
    bottles := 1;
    remains := S - 45;
    bottles := bottles + remains div 25;
    writeln('количество бутылок, которое можно купить = ' + bottles)
  end
  else begin
    writeln('количество бутылок, которое можно купить = ' + 0)
  end;
end.