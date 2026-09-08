var
  i: integer;
  var f: Text;
begin
  Assign(f, 'numbers.txt');
  Rewrite(f);
  for i := 1 to 100 do begin
    Write(f, Random(-101, 101), ' ');
    if i = 100 then begin
      Write(f, Random(-101, 101));
      break;
    end;
  end;
  Close(f);
  WriteLn('Файл создан!');
end.