uses graphABC;
var i, j, x1, y1, x, y, N: integer;
ch: char;
begin  
  SetWindowSize(500, 500);
  x1 := 50; y1 := 50;
  N := 8;
  y := 50;
  for i:=1 to N do begin
    x := 50;
    for j:=1 to N do begin
      Rectangle(x, y, x1+x, y1+y);
      if (i + j) mod 2 = 0 then floodfill(x+1, y+1, clBlack);
      x := x + x1;
    end;
    y := y + y1;
  end;
  y := y1 + y1 div 2;
  x := x1 - x1 div 2;
  for i := 1 to N do begin
    textout(x, y, Chr(ord('a')+i));
    y := y + y1;
  end;
  y := y - 20;
  x := x + x1;
  for i := 1 to N do begin
    textout(x, y, intToStr(i));
    x := x + x1;
  end;
end.