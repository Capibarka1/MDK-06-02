uses GraphABC;
var
  x, y: integer;
begin
  x := 100;
  y := 400;
  SetPenColor(clBlack);
  LockDrawing;
  repeat
    ClearWindow; 
    x := x + 1;
    y := y - 2;
    Rectangle(x, y, x + 15, y + 15);
    floodfill(x+1, y+1, clBlack);
    Redraw; 
    sleep(1);
  until x > 275;
  repeat
    ClearWindow;
    x := x + 1;
    y := y + 2;
    Rectangle(x, y, x + 15, y + 15);
    floodfill(x+1, y+1, clBlack);
    Redraw;
    sleep(1);
  until x > 450;
end.