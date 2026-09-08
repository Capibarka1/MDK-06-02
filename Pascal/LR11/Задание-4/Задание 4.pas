uses GraphABC;
var
  N, x, y, i: integer;
Begin
  N := 9;
  x := 50;
  for i:=1 to N do begin
    Circle(x, 100, 10);
    floodfill(x, 100, rgb(random(256), random(256), random(256)));
    x := x + 30;
  end;
end.