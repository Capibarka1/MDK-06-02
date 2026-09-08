s = str(input("Введите строку "))
count = 0
uniq = 0
if len(s) < 3:
    print(0)
else:
    for i in range(len(s)-2):
        for j in range(len(s)-2):
            if s[j] == s[i] and s[j+1] == s[i+1] and s[j+2] == s[i+2]:
                count += 1
        if count == 1:
            uniq += 1
        count = 0
print("Количество уникальных строк из 3 символов =", uniq)