import matplotlib.pyplot as plt
import numpy as np
import random
import math
import sys
def random_algo(N):
    index = 1
    while(random_flip(N) != random_flip(N)):
        index += 1
    return index

def algo_wrapper(N,times, fn):
    count = 0
    index = 0
    while index < times:
        count += fn(N)
        index += 1
    print "progress: %d\r" % N 
    sys.stdout.flush()
    return (count / times)

def stay_put_algo(N):
    # index = 1
    loc = get_rand_location(N)
    # while(index < loc)
    #     index += 1
    # end
    return loc

def random_flip(N):
    return random.randrange(1,N)


def get_rand_location(N):
    return random.randrange(1,N)

ns = range(10,1000,1)
times = 100
randoms = list(map(lambda x : algo_wrapper(math.floor(x),times,random_algo),ns))
print("\n")
stay_puts = list(map(lambda x : algo_wrapper(math.floor(x),times,stay_put_algo),ns))

print(randoms)
string = "Coffee Shop Problem"

plt.figure().suptitle(string, fontsize=15)
plt.plot(ns,randoms)
plt.plot(ns,stay_puts)
plt.show()