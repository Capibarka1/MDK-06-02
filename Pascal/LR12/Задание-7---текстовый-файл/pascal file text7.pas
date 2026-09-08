var
  n, summ, num, int_num, count, i: integer;
  s: string;
  z_in, z_out: text;
begin
  write('Введите одно натуральное число n (1 <= n <= 1012) = ');
  readln(n);
  assign(z_in, 'z3.in.txt');
  assign(z_out, 'z3.out.txt');
  rewrite(z_in);
  rewrite(z_out);
  num := 2;
  summ := 0;
  while num ** 4 <= n do begin
    count := 0;
    for i := 1 to num do
      if num mod i = 0 then inc(count);
    if count = 2 then 
      summ := summ + num * num * num * num;
    num := num + 1;
  end;
  writeln(z_in, n);
  writeln(z_out, summ);
  writeln('В файл z_in было записано число n (',n,')');
  writeln('В файл z_out была записана сумма чисел, у которых 5 делителей (',summ,')');
  close(z_in);
  close(z_out);

end.
