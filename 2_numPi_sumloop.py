"""
2021-01-20
Programming Tools (CERI 8102)

    OBJ: compute sum of pi using Leibniz method
"""
import math
import numpy

n = 10
pi = 0

for i in range( n):
    pi += 1./((4*i + 1)*(4*i + 3))

pi = 8 * pi
print('pi approximated: ', pi, '\nn = ', n)

error = math.pi - pi
print('error after %i iterations: %5.5f'%(n, error))

# n = [10, 50, 100, 1000]

# ==========================================
#           Thomas sol'n
# ==========================================

# for n in [10, 50, 100, 1000]:
#     sum_pi = 0
#     for k in range( n):
#         sum_pi += 1./((4*k+1)*(4*k+3))
#     sum_pi *= 8
    
#     print('\nmy pi approx. = ', sum_pi)
#     print('error = ',abs(sum_pi-numpy.pi), 'after %i iterations'%(n))

def my_pi( max_iter):
    sum_pi = 0
    for k in range( max_iter):
        sum_pi += 1./((4*k+1)*(4*k+3))
    sum_pi *= 8
    return sum_pi

for n in [10, 50, 100, 1000]:
    sum_pi = my_pi( n)
    print('\nmy pi approx. = ', sum_pi)
    print('error = ',abs(sum_pi-numpy.pi), 'after %i iterations'%(n))

print(my_pi(1000))
print(my_pi(1000000))