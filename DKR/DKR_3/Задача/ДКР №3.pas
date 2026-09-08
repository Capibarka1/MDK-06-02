uses Crt;
const
  NORM=LightGray; {цвет невыделенного пункта}
  SEL=LightGreen; {цвет выделенного пункта}
  N=2;
var
  menu:array[1..N] of string[70]; {Названия меню пунктов}
  punkt: integer;
  ch: char;
  x, y, k: integer;
  
function GetRealNumber: string;
var
  ch: char;
  result_: string;
  hasDecimal: boolean;
begin
  result_ := '';
  hasDecimal := false;
  repeat
    ch := ReadKey;
    // Цифры
    if ch in ['0'..'9'] then begin
      result_ := result_ + ch;
      clearline;
      write(result_);
    end
    // Десятичная точка (только одну и не в начале)
    else if (ch = '.') and not hasDecimal and (length(result_) > 0) and (result_[1] <> '-') then begin
      result_ := result_ + ch;
      clearline;
      write(result_);
      hasDecimal := true;
    end
    else if (ch = '.') and not hasDecimal and (length(result_) > 1) and (result_[1] = '-') then begin
      result_ := result_ + ch;
      clearline;
      write(result_);
      hasDecimal := true;
    end
    // Знак минус только в начале
    else if (ch = '-') and (length(result_) = 0) then begin
      result_ := result_ + ch;
      clearline;
      write(result_);
    end
    // Backspace
    else if (ch = #8) and (length(result_) > 0) then begin
      if result_[length(result_)] = '.' then hasDecimal := false;
      delete(result_, length(result_), 1);
      clearline;
      write(result_);
    end
    // Enter для завершения
    else if ch = #13 then begin
      // Проверяем, что число не пустое и не состоит только из минуса
      if (length(result_) > 0) and not ((length(result_) = 1) and (result_[1] = '-')) then break;
    end;
  until false;
  writeln();
  GetRealNumber := result_;
end;

function func (x: real): real;
begin
  func := 1 * x**3 + 0 * x**2 + -3 * x + 3;
end;

function Primitive (x: real): real;
begin
  Primitive := (x ** 4) / 4 + (-3 * x**2) / 2 + 3 * x;
end;

function AccuratelyCalculate (a, b: real): real;
var
  Prim1, Prim2: real;
begin 
  Prim1:= Primitive(b);
  Prim2:= Primitive(a);
  AccuratelyCalculate := abs(Prim1 - Prim2);
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

Procedure punkt1;
var
  a, b, S, result2, Acc_s: real;
  numStr: string;
  errorCode: integer;
begin
  repeat
    ClrScr;
    writeln('Введите первую координату, ОТ которой по оси OX считать криволинейную трапецию');
    numStr := GetRealNumber;
    Val(numStr, a, errorCode);
    writeln('Введите вторую координату, ДО которой по оси OX считать криволинейную трапецию');
    numStr := GetRealNumber;
    Val(numStr, b, errorCode);
    if a >= b then
      begin
        writeln('Ошибка: левая граница должна быть меньше правой!');
        writeln('Нажмите любую клавишу...');
        readkey;
        continue; // Перезапускаем цикл
      end;
    writeln('Введите на сколько трапеций (натуральное число) разделить криволинейную трапецию (точность измерения)');
    numStr := GetRealNumber;
    Val(numStr, k, errorCode);
    if k <= 0 then
      begin
        writeln('Ошибка: количество разбиений должно быть положительным и натруальным!');
        writeln('Нажмите любую клавишу...');
        readkey;
        continue; // Перезапускаем цикл
      end;
    if func(a) * func(b) < 0 then begin
      writeln('Ошибка: при a = ', a,' и b = ', b,' функция меняет знак на отрезке!');
      writeln('Для точного вычисления площади нужно найти корни.');
      readkey;
      continue; // Перезапускаем цикл
    end;
    S := Calculate(a, b, k);
    Acc_s := AccuratelyCalculate(a, b);
    writeln('Точная площадь криволинейной трапеции = ', S);
    writeln('Оценка погрешности:');
    result2 := Acc_s - S;
    writeln('Точное значение: ', Acc_s);
    writeln('Погрешность: ', result2);
    writeln('Нажмите Q для возвращения или Enter для нового вычисления');
      repeat
        ch := readkey;
      until ch in [#113, #81, #1049, #1081, #13];
    until ch in [#113, #81, #1049, #1081];
end;
  
Procedure MenuToScr; {Вывод меню на экран}
var i: integer;
begin
  ClrScr;
  for i:=1 to N do begin
    GoToXY(x, y+i-1);
    write(menu[i])
  end;
  TextColor(SEL);
  GoToXY(x, y+punkt-1);
  write(menu[punkt]); {Выделим строку меню}
  TextColor(NORM);
end;

begin
  menu[1] := 'Площадь криволинейной трапеции через метод левых прямоугольников';
  menu[2] := 'Выход';
  punkt := 1;
  x := 5;
  y := 3;
  TextColor(NORM);
  MenuToScr;
  repeat
    ch := ReadKey;
    if ch = #0 then begin
      ch := ReadKey;
      case ch of
        #40: {Стрелка ВНИЗ}
          if punkt < N then begin
            TextColor(NORM);  
            GoToXY(x, y+punkt-1);
            write(menu[punkt]);
            punkt:=punkt+1;
            TextColor(SEL);
            GoToXY(x, y+punkt-1);
            write(menu[punkt]);
            TextColor(NORM);
          end;
        #38: {Стрелка ВВЕРХ}
          if punkt > 1 then begin
            TextColor(NORM);  
            GoToXY(x, y+punkt-1);
            write(menu[punkt]);
            punkt:=punkt-1;
            TextColor(SEL);
            GoToXY(x, y+punkt-1);
            write(menu[punkt]);
            TextColor(NORM);
          end;
      end;
    end
    else if ch = #13 then begin {Нажата клавиша Enter}
      case punkt of
        1: punkt1;
        2: ch := #27; {Выход}
      end;
      MenuToScr;
    end;
  until ch = #27; {27 - код Esc}
  ClrScr;
end.

