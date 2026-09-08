function sumTo(number: integer): integer; // Параметризация
begin
  if number >= 1 then SumTo := number + sumTo(number - 1) // Декомпозиция
  else sumTo := number; // База рекурсии
end;

begin
  var x := ReadInteger('Введите целое число больше 0:');
  if x <= 0 then begin
    Print('Введено неправильное число');
    exit;
  end;
  Print(sumTo(x))
end.