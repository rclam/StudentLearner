"""
2021-01-20
Programming Tools (CERI 8102)

    OBJ: compute sum with for loop
"""

x = 0
n = 10
for i in range( n):
    # x = x + 5*i
    x += 5*i
    # print( i, 'of', n, 'x', x)

print( 'final value of x after %i iterations = '%(n), x)
print( 'final value of x after %i iterations = %5.2f'%(n, x))


