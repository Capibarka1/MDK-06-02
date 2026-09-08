a1 = int(input("Введите номер столбца, на которой стоит слон "))
a2 = int(input("Введите номер строки, на которой стоит слон "))
b1 = int(input("Введите номер столбца, на которой стоит другая фигура "))
b2 = int(input("Введите номер строки, на которой стоит другая фигура "))
beat = False
if a1 + 2 <= 8 and b1 == a1 + 2 and a2 + 1 <= 8 and b2 == a2 + 1:
    print("Слон может бить фигуру")
    beat = True
if a1 + 1 <= 8 and b1 == a1 + 1 and a2 + 2 <= 8 and b2 == a2 + 2:
    print("Слон может бить фигуру")
    beat = True
if a1 - 1 > 0 and b1 == a1 - 1 and a2 + 2 <= 8 and b2 == a2 + 2:
    print("Слон может бить фигуру")
    beat = True
if a1 - 2 > 0 and b1 == a1 - 2 and a2 + 1 <= 8 and b2 == a2 + 1:
    print("Слон может бить фигуру")
    beat = True
if a1 - 2 > 0 and b1 == a1 - 2 and a2 - 1 > 0 and b2 == a2 - 1:
    print("Слон может бить фигуру")
    beat = True
if a1 - 1 > 0 and b1 == a1 - 1 and a2 - 2 > 0 and b2 == a2 - 2:
    print("Слон может бить фигуру")
    beat = True
if a1 + 1 <= 8 and b1 == a1 + 1 and a2 - 2 > 0 and b2 == a2 - 2:
    print("Слон может бить фигуру")
    beat = True
if a1 + 2 <= 8 and b1 == a1 + 2 and a2 - 1 > 0 and b2 == a2 - 1:
    print("Слон может бить фигуру")
    beat = True
if beat == False:
    print("Слон не может бить фигуру")