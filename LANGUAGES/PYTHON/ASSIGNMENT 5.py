#!/usr/bin/env python
# coding: utf-8

# In[68]:


NAME = "GERSHON TETTEH AMANOR"
COLLABORATORS = ""


# In[69]:


from math import sqrt


# In[70]:


# Question 1.a
def pi_1(n):
    p = 0
    for k in range(0,n+1):
        p += (-1)**k/((3**k)*(2*k+1))
    return (6/sqrt(3))*p


# In[71]:


# Question 1.b
def pi_2(n):
    p = 0
    for k in range(0,n+1):
        p += (-3)**(-k)/((2*k+1))
    return (sqrt(12))*p


# In[72]:


# Question 1.c
def pi_3(n):
    p = 0
    for k in range(0,n+1):
        p += (-1)**k/((2*k+1))
    return 4*p

