s1 = str(input("Введите строку №1 "))
s2 = str(input("Введите строку №2 "))
print()
if len(s1) > len(s2):
    count = len(s1) - len(s2)
    for i in range(count):
        print(s1)
else:
    count = len(s2) - len(s1)
    for i in range(count):
        print(s2)