a = [0] * 20
for i in range(20):
    a[i] = int(input("Введите число " + str(i+1) + " "))
count = 20
if a[19] < 0:
    a[19] = 0
    count -= 1
for i in range(19, -1, -1):
    if a[i] < 0:
        for j in range(i, 19):
            a[j] = a[j+1]
        a[19] = 0
        count -= 1
for i in range(count):
    print(a[i], end=' ')
