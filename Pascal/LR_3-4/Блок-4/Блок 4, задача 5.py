N = int(input("Введите количество предприятий "))
all = 0
index = 0
max = 0
while index < N:
    index += 1
    power = int(input("Введите мощность предприятия номер " + str(index) + " "))
    all = all + power
    if power > max:
        max = power
        max_index = index
print("Общая мощность предприятий =", all)
print("Средняя мощность предприятий по отрасли =", round(all / index, 2))
print("Номер предприятия с наибольшей энергетической мощностью =", max_index)