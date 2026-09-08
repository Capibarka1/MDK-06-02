uses GraphABC;
Begin
  setpenwidth(2);
  Circle(100, 150, 50);
  floodfill(100, 150, clred);
  MoveTo(150, 150);
  LineTo(400, 150);
  LineTo(275, 75);
  LineTo(150, 150);
  floodfill(300, 125, clblue);
  Circle(450, 150, 50);
  floodfill(450, 150, clyellow);
  MoveTo(150, 150);
  LineTo(275, 225);
  LineTo(400, 150);
  floodfill(300, 175, clLime);
end.