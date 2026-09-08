unit DragonFractal;

interface

procedure DrawDragon(x1, y1, x2, y2, depth: integer);

implementation

uses GraphABC;

procedure DrawDragon(x1, y1, x2, y2, depth: integer);
var xn, yn: integer;
begin
  if depth > 0 then begin
    xn := (x1 + x2) div 2 + (y2 - y1) div 2;
    yn := (y1 + y2) div 2 - (x2 - x1) div 2;
    DrawDragon(x1, y1, xn, yn, depth-1);
    DrawDragon(x2, y2, xn, yn, depth-1);
  end
  else begin
    line(x1, y1, x2, y2);
  end;
end;

end.