'''
Вычисляет решение Гаусса для заданной матрицы и вектора
'''

import numpy as np

m_deniska = np.array([[2, -1], [6, 1]])
v_deniska = np.array([-4, -6])

def gauss(m, v):
    m_inv = np.linalg.inv(m)
    return np.matmul(m_inv, v)
