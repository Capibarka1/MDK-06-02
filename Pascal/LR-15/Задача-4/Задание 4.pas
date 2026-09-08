procedure LoopFor(i, n: integer); // Параметризация
{Первый параметр – счетчик шагов, второй параметр – общее количество шагов}
begin
  if i > n then exit // Базовый случай
  else begin
    Print('привет', i);
    writeln;
    LoopFor(i + 1, n); // Декомпозиция
  end
end;

begin
  LoopFor(1, 10);                    
end.