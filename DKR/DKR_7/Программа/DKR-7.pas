uses GraphABC, DragonFractal;
var 
  depth, x, y, x2, y2, err: integer;
  str_Depth, str_x, str_y, str_x2, str_y2: string;

procedure UpdateDisplay;
begin
  ClearWindow;
  DrawDragon(x, y, x2, y2, depth);
  SetFontColor(clRed);
  textout(10, 10, 'Масштабирование: PageUp/PageDown');
  textout(10, 30, 'Глубина: + / -');
  textout(10, 50, 'Сброс: R');
  textout(10, 70, 'Перемещение: стрелки');
  SetFontColor(clBlack);
end;

procedure KeyPress(key: char);
var rx, ry: integer;
begin
  case key of
    '+': begin  
      if depth < 15 then begin 
        depth := depth + 1;
        UpdateDisplay;
      end;
    end;
    
    '-': begin  
      if depth > 0 then begin 
        depth := depth - 1;
        UpdateDisplay;
      end;
    end;
    
    'R', 'r', 'к', 'К': begin
      x := 300;
      x2 := 500;
      y := 300;
      y2 := 300;
      UpdateDisplay;
    end;
  end;
end;

procedure KeyDown(key: integer);
var centerX, centerY, signX, signY: integer;
  scaleUp, scaleDown: real;
begin
  case key of
    VK_Left: begin
      x := x - 25;
      x2 := x2 - 25;
      UpdateDisplay;
    end;
    
    VK_Right: begin
      x := x + 25;
      x2 := x2 + 25;
      UpdateDisplay;
    end;
    
    VK_Up: begin
      y := y - 25;
      y2 := y2 - 25;
      UpdateDisplay;
    end;
    
    VK_Down: begin
      y := y + 25;
      y2 := y2 + 25;
      UpdateDisplay;
    end;
    
    VK_PageUp: begin
      scaleUp := 1.1;
      if (abs(x2 - x) < 1000) and (abs(y2 - y) < 1000) then begin
        
        centerX := (x + x2) div 2;
        centerY := (y + y2) div 2;
        
        if x2 < x then signX := -1
        else signX := 1;
        if y2 < y then signY := -1
        else signY := 1;
        
        x := centerX - signX * round((abs(x2 - x) / 2 * scaleUp));
        x2 := centerX + signX * round((abs(x2 - x) / 2 * scaleUp));
        y := centerY - signY * round((abs(y2 - y) / 2 * scaleUp));
        y2 := centerY + signY * round((abs(y2 - y) / 2 * scaleUp));
        
        UpdateDisplay; 
      end;
    end;
    
    VK_PageDown: begin
      scaleDown := 0.9;
      if (abs(x2 - x) > 30) and (abs(y2 - y) > 30) then begin
        
        centerX := (x + x2) div 2;
        centerY := (y + y2) div 2;
        
        if x2 < x then signX := -1
        else signX := 1;
        if y2 < y then signY := -1
        else signY := 1;
        
        x := centerX - signX * round((abs(x2 - x) / 2 * scaleDown));
        x2 := centerX + signX * round((abs(x2 - x) / 2 * scaleDown));
        y := centerY - signY * round((abs(y2 - y) / 2 * scaleDown));
        y2 := centerY + signY * round((abs(y2 - y) / 2 * scaleDown));
        
        UpdateDisplay;
      end;
    end;
  end;
end;

function ThisIsPosNumber(str: string): boolean;
var num, err: integer;
begin
  val(str, num, err);
  if err = 0 then begin
    if num > 0 then ThisIsPosNumber := true
    else ThisIsPosNumber := false;
  end
  else ThisIsPosNumber := false;
end;

function checkNum (str: string): boolean;
begin
  if ThisIsPosNumber(str) = false then begin
    ClearWindow;
    TextOut(10, 30, 'Введено неверное значение, оно должно содержать только цифры и быть положительным');
    checkNum := true;
  end
  else checkNum := false;
end;

begin
  TextOut(10, 10, 'Введите координату x1 первой точки для создания линии');
  readln(str_x);
  if checkNum(str_x) then exit;
  val(str_x, x, err);
  
  TextOut(10, 10, 'Введите координату y1 первой точки для создания линии');
  readln(str_y);
  if checkNum(str_y) then exit;
  val(str_y, y, err);
  
  TextOut(10, 10, 'Введите координату x2 второй точки для создания линии');
  readln(str_x2);
  if checkNum(str_x2) then exit;
  val(str_x2, x2, err);
  
  TextOut(10, 10, 'Введите координату y2 второй точки для создания линии');
  readln(str_y2);
  if checkNum(str_y2) then exit;
  val(str_y2, y2, err);
  
  if (x > 1000) or (y > 1000) or (x2 > 1000) or (y2 > 1000) then begin
    ClearWindow;
    TextOut(10, 30, 'Значения координат не могут быть больше 1000'); 
    exit;
  end;
  if (x = x2) and (x = y) and (x = y2) then begin
    ClearWindow;
    TextOut(10, 30, 'Все значения координат не могут быть одинаковыми');
    exit;
  end;
  
  TextOut(10, 10, 'Введите стартовую глубину');
  readln(str_Depth); 
  if checkNum(str_Depth) then exit;  // Проверка, что это число
  val(str_Depth, depth, err);   
  if depth > 15 then begin
    ClearWindow;
    TextOut(10, 30, 'Глубина не может быть больше 15');
    exit; 
  end;
  ClearWindow;
  
  SetWindowSize(1000, 1000);
  OnKeyPress := KeyPress;
  OnKeyDown := KeyDown;
  UpdateDisplay;
end.