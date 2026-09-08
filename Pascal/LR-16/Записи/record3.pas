type toy = record
  name: string;
  price: integer;
  age: integer;
end;

begin
  var toys :array[1..3] of toy;
  with toys[1] do begin
    name := 'Пазлы';
    price := 999;
    age := 6;
  end;
  with toys[2] do begin
    name := 'Деревянные кубики';
    price := 499;
    age := 3;
  end;
  with toys[3] do begin
    name := 'Домино';
    price := 1499;
    age := 6;
  end;
  for var i:=1 to 3 do println(toys[i].name,'/ Цена:',toys[i].price,'/ Минимальный возраст:',toys[i].age);
end.