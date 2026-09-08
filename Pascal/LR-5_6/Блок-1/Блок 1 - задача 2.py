from random import randint
a = [0] * 20
for i in range(20):
    a[i] = randint(-22, 93)
print("Случайный массив на 20 элементов из диапазона [-22, 93]")
print(a)
count = 0
pr = 1
summ = 0
for i in range(0, 20):
    if a[i] % 2 == 0 and i % 2 != 0:
        count += 1
    if a[i] % 2 != 0:
        pr = pr * a[i]
print("Количество чётных элементов массива, стоящих на нечётных местах =", count)
print("произведение нечётных элементов массива =", pr)
start = int(input("Введите начало промежутка от 1 до 20 "))
finish = int(input("Введите конец промежутка от 1 до 20 "))
for i in range(start - 1, finish):
    summ += a[i]
print("Сумма элементов массива на диапазоне от", start, "до", finish, "=", summ)
