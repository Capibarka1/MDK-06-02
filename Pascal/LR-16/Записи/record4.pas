type t_toy = record
  name: string[100];
  price: integer;
  age: integer;
end;

begin
  var toy: t_toy;
  var f: file of t_toy;
  Assign(f, 'toys.dat');
  rewrite(f);
  var toys :array of t_toy;
  setlength(toys, 3);
  with toys[0] do begin
    name := 'Пазлы';
    price := 999;
    age := 6;
  end;
  write(f, toys[0]);
  with toys[1] do begin
    name := 'Деревянные кубики';
    price := 499;
    age := 3;
  end;
  write(f, toys[1]);
  with toys[2] do begin
    name := 'Домино';
    price := 1499;
    age := 6;
  end;
  write(f, toys[2]);
  close(f);
  reset(f);
  while not EOF(f) do begin
    Read(f, toy);
    println(toy.name, '/ Цена:', toy.price, '/ Минимальный возраст:', toy.age);
  end;
  close(f);
end.