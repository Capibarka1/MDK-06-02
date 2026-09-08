from math import log, cos, tan

x = float(input("Введите число x "))
if x < -7:
    y = tan(x) - log(abs(x))
else:
    if x < -5:
        y = log(abs(x)) / 72 - 96 / log(abs(x))
    else:
        y = abs(x) ** (0.1 * x) + cos(2 * x)

print("y =", round(y, 2))
