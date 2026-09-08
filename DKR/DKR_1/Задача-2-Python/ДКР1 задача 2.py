from math import log, cos, tan

x = -9
while x <= -3:
    if x < -7:
        y = tan(x) - log(abs(x)) 
    else:
        if x < -5:
            y = log(abs(x)) / 72 - 96 / log(abs(x))
        else:
            y = abs(x) ** (0.1 * x) + cos(2 * x)
    x = round(x, 1)
    print('x =', x, '   y =', round(y, 2))
    x += 0.1
