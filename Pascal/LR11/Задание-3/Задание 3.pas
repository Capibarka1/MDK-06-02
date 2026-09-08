uses GraphABC;
Begin
  setpenwidth(2);
  Circle(100, 150, 25);
  floodfill(100, 150, clblue);
  Circle(600, 150, 25);
  floodfill(600, 150, clLime);
  Circle(350, 100, 25);
  floodfill(350, 100, clred);
  Line(110, 173, 200, 400);
  Line(120, 165, 280, 300);
  Line(335, 120, 250, 400);
  Line(365, 120, 450, 400);
  Line(580, 165, 420, 300);
  Line(590, 173, 500, 400);
  Line(200, 400, 500, 400);
  floodfill(350, 350, clred);
  floodfill(200, 300, clblue);
  floodfill(500, 250, clLime);
end.