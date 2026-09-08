uses GraphABC;
const
  Width = 800;
  Height = 600;
var
  x, y, x1, y1, step_ln: integer;
  x2: real;
  indentX, indentY: integer;
  indentX0, indentY0: integer;
  a, b, step, scale: real;
  k: integer;
  
function func(x: real): real;
begin
  func := 1 * x**3 + 0 * x**2 + -3 * x + 3;
end;

function Primitive (x: real): real;
begin
  Primitive := (x ** 4) / 4 + (-3 * x**2) / 2 + 3 * x;
end;

function CheckSign(a, b: real): boolean;
begin
  if func(a) * func(b) < 0 then CheckSign := True
  else CheckSign := False;
end;

function Calculate (a, b: real; k: integer): real;
var
  h, S, X: real;
begin
  S := 0;
  h := (b - a)/k;
  X := a;
  while X < b do begin
    S := S + abs(func(X));
    X := X + h;
  end;
  S := S * h;
  Calculate := S;
end;

function AccuratelyCalculate (a, b: real): real;
var
  Prim1, Prim2: real;
begin 
  Prim1:= Primitive(b);
  Prim2:= Primitive(a);
  AccuratelyCalculate := abs(Prim1 - Prim2);
end;

Procedure DrawRectangles(a, b: real; k: integer);
var
  i: integer;
  x4, step_r: real;
  x_screen, y_screen: real;
begin
  SetBrushStyle(bsSolid);
  SetBrushColor(ARGB(100, 255, 200, 200));
  SetPenColor(clRed);
  SetPenWidth(1);
  step_r := (b - a) / k;
  for i := 0 to k-1 do begin
    x4 := a + i * step_r;
    x_screen := width div 2 + (x4 * indentX); 
    y_screen := height div 2 - (func(x4) * indentY);
    if func(x4) >= 0 then rectangle(round(x_screen), round(y_screen), round(x_screen + step_r * indentX), Height div 2)
    else rectangle(round(x_screen), Height div 2, round(x_screen + step_r * indentX), round(y_screen))
  end;
  SetPenColor(clBlack);
  SetBrushColor(clWhite);
end;

procedure DrawHatching(a, b: real);
var
  points: array of Point;
  i, count: integer;
  x3, step_h: real;
begin
  count := 1002;
  SetLength(points, count);
  points[0].X := Width div 2 + Round(a * indentX);
  points[0].Y := Height div 2;
  step_h := (b - a) / 1000;
  x3 := a;
  for i := 1 to 1000 do begin
    points[i].X := Width div 2 + Round(x3 * indentX);
    points[i].Y := Height div 2 - Round(func(x3) * indentY);
    x3 := x3 + step_h;
  end;
  points[1001].X := Width div 2 + Round(b * indentX);
  points[1001].Y := Height div 2;
  SetBrushStyle(bsHatch);
  SetBrushColor(clLightGray);
  SetPenWidth(1);
  Polygon(points);
  SetBrushStyle(bsSolid);
  SetBrushColor(clWhite);
end;

Procedure drawlines(step_ln: integer);
var
  i: integer;
begin
  for i:=-1000 to 1000 step step_ln do begin
    if i <> 0 then begin
      x := width div 2 + i * indentX;
      line(x, Height div 2 - 5, x, Height div 2 + 5);
      TextOut(x - 5, Height div 2 + 10, intToStr(i));
    end;
  end;
  for i:=-1000 to 1000 step step_ln do begin
    if i <> 0 then begin
      y := Height div 2 - i * indentY;
      line(Width div 2 - 5, y, Width div 2 + 5, y);
      TextOut(Width div 2 + 10, y - 7, intToStr(i));
    end;
  end;
end;

procedure DrawGraph;
var
  S, Acc_s, result_: real;
begin
  ClearWindow;
  SetFontSize(10);
  
  indentX := round(indentX0 * scale);
  indentY := round(indentY0 * scale);
  
  if indentX < 1 then indentX := 1;
  if indentY < 1 then indentY := 1;
  
  step := 1.0 / indentX;
  if step > 0.05 then step := 0.05;
  if step < 0.0005 then step := 0.0005;
  
  Line(0, Height div 2, Width, Height div 2);
  Line(Width div 2, 0, Width div 2, Height);
  
  Line(Width, Height div 2, Width - 10, Height div 2 - 5);
  Line(Width, Height div 2, Width - 10, Height div 2 + 5);
  Line(Width div 2, 0, Width div 2 - 5, 10);
  Line(Width div 2, 0, Width div 2 + 5, 10);
  
  TextOut(Width - 20, Height div 2 - 20, 'X');
  TextOut(Width div 2 - 20, 10, 'Y');
  
  SetPenColor(clGray);
  Line(Width div 2 + round(indentX * a), 0, Width div 2 + round(indentX * a), height);
  Line(Width div 2 + round(indentX * b), 0, Width div 2 + round(indentX * b), height);
  SetPenColor(clBlack);
  drawlines(step_ln);
  DrawHatching(a, b);
  DrawRectangles(a, b, k);
  SetPenColor(clBlue);
  SetPenWidth(2);
  x2 := a;
  x1 := Width div 2 + Round(x2 * indentX);
  y1 := Height div 2 - Round(func(x2) * indentY);
  MoveTo(x1, y1);
  while x2 <= b do
  begin
    x1 := Width div 2 + Round(x2 * indentX);
    y1 := Height div 2 - Round(func(x2) * indentY);
    LineTo(x1, y1);
    x2 := x2 + step;
  end;
  SetPenColor(clBlack);
  SetPenWidth(1);
  
  TextOut(10, 10, 'Кривая: y = x³ - 3x + 3');
  TextOut(10, 30, 'ДКР №4 - Метод левых прямоугольников');
  TextOut(10, 50, 'Визуализация графика');
  TextOut(10, 70, '+: увеличение, -: уменьшение, R: сброс');
  TextOut(10, 90, 'Прямоугольников: ' + IntToStr(k));
  
  S := Calculate(a, b, k);
  Acc_s := AccuratelyCalculate(a, b);
  result_ := Acc_s - S;
  if CheckSign(a, b) then TextOut(10, 560, 'Функция меняет знак на отрезке, точная площадь будет не будет посчитана')
  else begin
    TextOut(10, 540, 'Погрешность: ' + result_);
    TextOut(10, 560, 'Точная площадь криволинейной трапеции: ' + Acc_s);
  end;
  TextOut(10, 580, 'Примерная площадь криволинейной трапеции: ' + S);
end;

procedure KeyPress(key: char);
begin
  case key of
    '+': begin
        scale := scale * 1.2;
        if scale > 20 then scale := 20;
        if round(1 / scale) = 0 then step_ln := 1
        else step_ln := round(1 / scale);
        DrawGraph;
      end;
    '-': begin
        scale := scale / 1.2;
        if scale < 0.01 then scale := 0.01;
        if round(1 / scale) = 0 then step_ln := 1
        else step_ln := round(1 / scale);
        DrawGraph;
      end;
    'R', 'r', 'К', 'к': begin
        scale := 1.0;
        DrawGraph;
      end;
  end;
end;

begin
  SetWindowsize(width, height);
  indentX0 := width div 20;
  indentY0 := height div 20;
  scale := 1.0;
  step_ln := 1;
  TextOut(10, 10, 'Введите левую границу');
  readln(a);
  ClearWindow;
  TextOut(10, 10, 'Введите правую границу');
  readln(b);
  ClearWindow;
  if a >= b then begin
    TextOut(10, 10, 'Левая граница не может быть больше правой. Перезапустите программу');
    exit;
  end;
  TextOut(10, 10, 'Введите, на какое количество прямоугольников нужно разделить');
  readln(k);
  if k <= 0 then begin
    ClearWindow;
    TextOut(10, 10, 'Количество прямоугольников должно быть положительным. Перезапустите программу');
    exit;
  end;
  OnKeyPress := KeyPress;
  DrawGraph;
end.