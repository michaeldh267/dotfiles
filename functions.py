#!/usr/bin/env python3
# Functions!

import math

def hsv_to_rgb(H, s, v):
    '''degrees:range(0,360) -> float -> float -> rgb'''
    C = v * s
    HH = H/60.0
    X = C * (1 - abs((HH % 2 - 1)))
    m = v - C
    r = g = b = 0
    if H <= 60:
        r, g, b = C, X, 0
    elif H <= 120:
        r, g, b = X, C, 0
    elif H <= 180:
        r, g, b = 0, C, X
    elif H <= 240:
        r, g, b = 0, X, C
    elif H <= 300:
        r, g, b = X, 0, C
    else:
        r, g, b = C, 0, X
    r = int(math.ceil(255*(r+m)))
    g = int(math.ceil(255*(g+m)))
    b = int(math.ceil(255*(b+m)))
    return (r, g, b)
