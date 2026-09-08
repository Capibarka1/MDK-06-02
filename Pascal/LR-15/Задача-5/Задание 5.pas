function NOD(num: integer; num2: integer): integer; // Параметризация
begin
  var ostatok := num mod num2;
  if ostatok = 0 then NOD := num2 // База рекурсии
  else NOD := NOD(num2, ostatok); // Декомпозиция
end;

begin
  var a := ReadInteger('Введите целое число > 0:');
  if a <= 0 then begin
    Print('Введено неправильное число');
    exit;
  end;
  var b := ReadInteger('Введите второе целое число > 0:');
  if b <= 0 then begin
    Print('Введено неправильное число');
    exit;
  end;
  if a > b then Print(NOD(a, b))
  else Print(NOD(b, a))
end.