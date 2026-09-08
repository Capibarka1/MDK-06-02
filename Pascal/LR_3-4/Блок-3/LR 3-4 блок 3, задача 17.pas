var summ, val, buyer, change :real;
var N, quantity: integer;
begin
  summ := 0;
  writeln('Введите количество товаров');
  readln(N);
  Repeat
    writeln('Введите цену товара');
    readln(val);
    writeln('Введите количество товара');
    readln(quantity);
    summ := summ + val * quantity;
    N := N - 1;
  until N <= 0;
  writeln('Введите кол-во денег, внесённых покупателем ');
  readln(buyer);
  change := buyer - summ;
  writeln('Сдача = ' + change)
end.