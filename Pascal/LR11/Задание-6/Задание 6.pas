uses GraphABC;
var
  N, x, y, z, i: integer;
begin
  N := 8;
  x := 50;
  y := 50;
  z := 10;
  setpenwidth(2);
  SetWindowWidth(700);
  SetWindowHeight(600);
  for i:=1 to N do begin
    Circle(x, y, z);
    floodfill(x, y, rgb(random(256), random(256), random(256)));
    x := x + 60;
    y := y + 50;
    z := z + 10;
  end;
end.