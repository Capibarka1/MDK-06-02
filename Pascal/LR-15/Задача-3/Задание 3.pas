function stepen(a, b: integer): integer; // Параметризация
begin
  if b > 0 then stepen := a * stepen(a, b - 1) // Декомпозиция
  else stepen := 1; // База рекурсии
end;

begin
  var x := ReadInteger('Введите число, которое хотите возвести в степень');
  var y := ReadInteger('Введите, в какую степень хотите ввести число');
  Print(stepen(x, y));
end.