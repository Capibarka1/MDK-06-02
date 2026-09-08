def findNums(arr: list): # Формальный параметр, list - изменяемый тип
    min_abs = arr[1]  # Локальная переменная
    max_negative = 0  # Локальная переменная
    for i in range(len(arr)):
        if abs(arr[i]) < abs(min_abs):
            min_abs = arr[i]
        if arr[i] < 0 and max_negative == 0:
            max_negative = arr[i]
        elif arr[i] < 0 and max_negative < arr[i]:
            max_negative = arr[i]
    print("Минимальный элемент массива по модулю =", min_abs)
    if max_negative == 0:
        print("Нет отрицательных элементов")
    else:
        print("Максимальный отрицательный элемент массива =", max_negative)

a = [] # Глобальная переменная
N = int(input("Введите длину списка ")) # Глобальная переменная
for i in range(N):
    a.append(int(input(f"a[{str(i)}] = ")))
findNums(a) # Фактический параметр



