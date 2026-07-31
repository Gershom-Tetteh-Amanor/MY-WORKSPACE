#!/usr/bin/env python
# coding: utf-8

# In[ ]:


NAME = "MR. GERSHON TETTEH AMNOR"
COLLABORATORS = ""


# In[8]:


import numpy as np


# In[9]:


# Question 1
# A function to calculate the area of acircle
def circ_area(r):
    return np.pi*r**2


# In[10]:


# Testing the function with r = 1
assert circ_area(1)==np.pi


# In[ ]:





# In[6]:


# Question 2
# A function to check if a list is a sequence
def isAP(x):
    d = x[1]-x[0]
    for i in range(2,len(x)):
        if x[i]-x[i-1] !=d:
            return False
    return True


# In[13]:


# testing the sequence  1,3,5,6,9,11,13
assert isAP([1,3,5,6,9,11,13])==False


# In[ ]:





# In[26]:


# Question 3
def get_grade(Marks,Attendance,Total_Lectures):
    if (Marks >=0) and (Marks<=100):
        score = (9/10)*Marks + 10 *(Attendance/Total_Lectures)
        if ((score >=80) and (score <100)):
            remark="Distinction"
        elif (score <80):
            remark = "Pass"
        else:
            remark = "Fail"
        return {'score':score,'Remark':remark}        


# In[ ]:





# In[34]:


# Question 4
def polar2rect(r,theta):
    from math import cos,sin
    x = r*cos(theta)
    y = r*sin(theta)
    return((x,y))


# In[ ]:





# In[40]:


# Question 5
def vect_dist(a,b):
    from math import sqrt
    d = sqrt((a[0]-b[0])**2-(a[1]-b[1])**2)
    return d


# In[ ]:





# In[92]:


# Question 6
def line_intersect(L1,L2):
    m1=L1[0]
    c1=L1[1]
    m2=L2[0]
    c2=L2[1]
    if m1!=m2:
        x = (c2-c1)/(m1-m2)
        y = m1*x +c1
        return(x,y)
    


# In[ ]:





# In[86]:


# Quesstion 7
def list_intersect(A,B):
    return list(set(A) & set(B))


# In[ ]:




