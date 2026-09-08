n = int(input("Введите количество элементов в массиве "))
a = [0] * n
for i in range(n):
    a[i] = float(input("Введите число " + str(i+1) + " "))
s = float(input("Введите s "))
k = 0
sum = 0
for i in range(n):
    if a[i] + sum <= s:
        k += 1
        sum += a[i]
    else:
        break
print("k =", k)