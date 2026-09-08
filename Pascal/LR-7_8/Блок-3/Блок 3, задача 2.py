s = str(input("Введите строку "))
nums = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
count = 0
for i in range(len(s)):
    if s[i] in nums:
        count += 1
print("Количество цифр в строке =", count)