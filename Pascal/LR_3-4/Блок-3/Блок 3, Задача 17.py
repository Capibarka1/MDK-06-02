summ = 0
N = int(input("Введите количество товаров "))
while True:
    Val = int(input("Введите цену товара "))
    quantity = int(input("Введите количество товара "))
    summ = summ + Val * quantity
    N -= 1
    if N <= 0:
        break
buyer = int(input("Введите кол-во денег, внесённых покупателем "))
change = buyer - summ
print("Сдача =", change)