uses GraphABC;
  var
  N, x, y, rad, i: integer;
Begin
  SetWindowWidth(800);
  SetWindowHeight(800);
  N := 20;
  x := 400;
  y := 400;
  rad := 300;
  for i:=1 to N do begin
    Circle(x, y, rad);
    rad := rad - 15
  end;
end.