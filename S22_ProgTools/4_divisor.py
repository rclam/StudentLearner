"""
2021-01-25
Programming Tools (CERI 8102)

    OBJ: check if list of divisors results
         in modulo = 0 (python: %)
"""

def get_divisor( integer_in):
    """
    Parameter
    ----------
    integer_in : User-input some integer value
    
    
    
    Returns
    -------
    all possible divisors (from 2 to 9) as list
    """
    
    
    # generate list of all possible divisors
    l_div_all = [2, 3, 4, 5, 6, 7, 8, 9]  #[for i in range(2, 10)]
    
    l_div_out = []
    # chech which divisors have modulo 0
    for curr_div in l_div_all:
        modulo = integer_in%curr_div
        if modulo == 0 and curr_div != integer_in:
            # add this number to list
            l_div_out.append( curr_div)
    return l_div_out
            


# ============= generate simple test case =============

my_int = 6 # return should belist [2, 3, 4, 6]
l_div_out = get_divisor( my_int)
print("integer input: %i, divisors=%s"%(my_int, l_div_out))

