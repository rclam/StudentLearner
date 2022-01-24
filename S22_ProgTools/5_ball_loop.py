"""
2021-01-25
Programming Tools (CERI 8102)

    OBJ: write a loop w/2000 time step between t=0 and t=2
         compare y_[i+1] and y_i
"""
import numpy as np

t = np.linspace(0, 2, 2000)
v0 = 5      # m/s
g = 9.81    # m/s

for i in t:
    y = v0*t - 0.5 * g * t**2

# Check for answer w/out loop
max_y = max(y)
print('max height: ', max_y)
max_index = np.where(y == max_y)
print('index: ', max_index[0])

# Solve for answer with loop
largest_h = y[0]            # initial guess
for i in y:
    if i > largest_h:       # condition
        largest_h = i       # overwrite guess_i with new value

print('\nlargest height: ', largest_h)

new_index = np.where(y == largest_h)
print('index: ', new_index[0])
print('timestep: ', t[new_index])

