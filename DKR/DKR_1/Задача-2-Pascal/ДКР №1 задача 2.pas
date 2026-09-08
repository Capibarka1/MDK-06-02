var x, y: real;
begin
  x := -9;
  while x <= - 3 do begin
    if x < -7 then begin
      y := tan(x) - log(abs(x));
    end
    else begin
      if x < -5 then begin
        y := ln(abs(x)) / 72 - 96 / ln(abs(x));
      end
      else begin
        y := abs(x) ** (0.1 * x) + cos(2 * x);
      end;
    end;
    x := round(x, 1);
    writeln('x = ', x, '    y = ', y:1:2);
    x := x + 0.1;
  end;

end.
