def CreateMatrix (n: int, m: int) -> list:
    a = []
    for i in range(n):
        a.append([])
        for j in range(m):
            a[i].append(float(input(f"a[{str(i)},{str(j)}] = ")))
    return a

def Matrix (arr: list) -> list:
    a = []
    flag = False
    for i in range(len(arr)):
        for j in range(len(arr[i])):
            if arr[i][j] < 0:
                flag = True
                break
        if flag:
            a.append(-1)
            flag = False
        else:
            a.append(1)
    return a

n = 8
m = 6
a = CreateMatrix(n, m)
a2 = Matrix(a)

print(a2)

