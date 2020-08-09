import math

def area(r):
    return math.pi*(r**2)


for i in range(1, 5, 1):
    
    for j in range(2, 6, 1):
        try:
            p = 91.12 / ((1/i**2)-(1/j**2))
            print(p, " ", i, " ", j)
        except ZeroDivisionError:
            continue