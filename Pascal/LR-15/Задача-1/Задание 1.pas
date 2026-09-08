procedure row(number: integer); // Параметризация
begin
  if number < 1 then exit // Базовый случай
  else begin
    Print(number);
    row(number - 2); // Декомпозиция
  end;
end;

begin
  var x := ReadInteger('Введите число больше 0, с которого начнём строку');
  if x <= 0 then begin
    Print('Введено неправильное число');
    exit;
  end;
  row(x)
end.