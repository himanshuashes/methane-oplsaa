import matplotlib.pyplot as plt
import numpy as np

data = np.loadtxt('out.txt')

# with open('out.txt') as temp:
#     lines = temp.readlines()
#     x = [line.split()[0] for line in lines]
#     y = [line.split()[1] for line in lines]

#%%
fig1 = plt.figure()
plt.plot(data[:,0],label='Density')
plt.legend(loc=1)
fig2 = plt.figure()
plt.plot(data[:,1],label='E pair')

plt.legend(loc=1)

#%%
density = np.average(data[:,0])
print(density)