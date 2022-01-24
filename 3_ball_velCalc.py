"""
2021-01-25
Programming Tools (CERI 8102)

    OBJ: introduce errors and see python react
         old name = inC_1_ball_error.py

"""
# Program for computing the height of a ball in vertical motion

# hello
v0 = 5             # Initial velocity
g = 9.81           # Acceleration of gravity
t = 0.6            # Time

# y = v0*t - 0.5*g*t**2        # Vertical position
y = v0*t - (1/2)*g*t**2

print( y)
