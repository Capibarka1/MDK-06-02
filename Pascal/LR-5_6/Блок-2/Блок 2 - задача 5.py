n = int(input("Введите количество элементов в массиве "))
a = []
for i in range(n):
    a.append(int(input("Введите число " + str(i+1) + " ")))
count = 0
max_count = 0
max_num = 0
for i in range(n):
    for j in range(i, n):
        if a[j] == a[i]:
            count += 1
    if count > max_count:
        max_count = count
        max_num = a[i]
    count = 0
print("Наиболее часто повторяющееся число в массиве:", max_num)
