print("Программа, которая считает y в функции y = 2x + 1 на промежутке от a до b")
for i in range(25, 4, -5):
    x = i / 10
    y = (2 * x) + 1
    print("y =", y)
    x = x + 0.5

a = int(input("\nВведите a "))
b = int(input("Введите b (больше чем a) "))
for i in range (a, b):
    x = i
    y = (2 * x) + 1
    print("для x =", x, "  y =", (2 * x + 1))

a = int(input("\nВведите a "))
b = int(input("Введите b (больше чем a) "))
h = int(input("Введите шаг "))
for i in range (a, b, h):
    x = i
    y = (2 * x) + 1
    print("для x =", x, "  y =", (2 * x + 1))