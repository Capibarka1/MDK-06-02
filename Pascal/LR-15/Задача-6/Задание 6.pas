procedure fib (i,n, count: integer); // Параметризация
begin
  Print(i+n);
  if count <= 1 then exit // Базовый случай
  else fib(n, i+n, count-1) // Декомпозиция
end;

begin
  fib(0,1,10);
end.