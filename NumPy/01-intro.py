# Data Science And AI Practicum
# Data analytics: Numpy library

import numpy as np

my_list = list(range(1000)) # python list 0 ~ 999 => normal
npy_arr = np.array(range(1000)) # numpy array 0 ~ 999 => vectorized

%time for _ in range(10): [x*2 for x in my_list] # Normal
%time for _ in range(10): npy_arr * 2 # Vectorized

705 - 103

602 # Vectorized(Numpy) way is 602 times faster than normal(python_list)
