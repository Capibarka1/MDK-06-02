var i_ptr: ^integer;
begin
  var i := 2;
  i_ptr := @i;
  println('Значение в переменной i =', i_ptr^);
end.