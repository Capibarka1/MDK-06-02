S = int(input("Введите количество копеек "))
if S >= 45:
    bottles = 1
    remains = S - 45
    bottles = bottles + remains // 25
    print("количество бутылок, которое можно купить =", bottles)
else:
    print("количество бутылок, которое можно купить =", 0)