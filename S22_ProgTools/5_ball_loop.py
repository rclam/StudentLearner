"""
2021-01-25
Programming Tools (CERI 8102)

    OBJ: write a loop w/2000 time step between t=0 and t=2
         compare y_[i+1] and y_i
"""
import numpy as np

t = np.linspace(0, 2, 2000)
v0 = 5      # m/s
g = 9.81    # m/s^2

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

print('\n\nThomas code:')


# ============= Thomas method (w/out Numpy) =============

# ============= Step 1 =============
#          height function
# ==================================
def get_height( t, g, v0):
    return v0 * t - 0.5 * g * t**2


# ============= Step 2 =============
#          set parameters
# ==================================
v0 = 5               # m/s
g = 9.81             # m/s^2
tmin, tmax = 0, 2    # seconds
N_iter = 2000
# size of time steps
step = (tmax - tmin)/N_iter
# l_t = [for i/step in range(N_iter)]


# ============= Step 3 =============
#          find peak height, t
# ==================================
# set initial height and time step
t       = tmin
y_old   = 0   #-1

# for loop of N_iter
for i in range(N_iter):
    y_new = get_height(t, g, v0)
    # print(i, y_old, y_new, t)
    # check if y_new < y_old --->  reached the peak
    if y_new < y_old:
        print( 'peak height: %.2f m, at time: %.2f s'%(y_old, t))
        t_at_peak = t - step
        y_at_peak = y_old
        break
    # update time and height variables
    t    += step
    y_old = y_new


# ============= Step 4 =============
#          create plot (uses Numpy)
# ==================================
import matplotlib.pyplot as plt

a_t = np.linspace(tmin, tmax-step, N_iter)

plt.figure(1)
plt.plot( a_t, get_height(a_t, g, v0))
plt.plot( [t_at_peak],[y_at_peak], 'r*', ms=20)
plt.xlabel( 'Time (s)')
plt.ylabel( 'Height (m)')
plt.show()


print('\n\nThomas 2nd code:')
# ============= Thomas method (w Numpy) =============
a_t = np.linspace(tmin, tmax-step, N_iter)
print( 'max height: ', get_height(a_t, g, v0).max(), ' m')


