#!/usr/bin/env python3
# fluxboxcolors.py
# Public Domain
#
# style your fluxbox with random colors!
import random

SATURATION = 0.55
VALUE = 0.55

def hsv_to_rgb(H, s, v):
    '''degrees -> float -> float -> rgb'''
    C = v * s
    X = C * (1 - abs(((H/60) % 2) -1))
    m = v - C

    if H > 0 and H < 60:
        r,g,b = C,X,0
    elif H > 60 and H < 120:
        r,g,b = X,C,0
    elif H > 120 and H < 180:
        r,g,b = 0,C,X
    elif H > 180 and H < 240:
        r,g,b = 0,X,C
    elif H > 240 and H < 300:
        r,g,b = X,0,C
    else:
        r,g,b = C,0,X
    r = 256*(r+m)
    g = 256*(g+m)
    b = 256*(b+m)
    R = int(r)
    G = int(g)
    B = int(b)
    # print("h:{} s:{} v:{}".format(h,s,v))
    # print("C:{} H:{} X:{} m:{}".format(C,H,X,m))
    # print("r:{} g:{} b:{}".format(R,G,B))
    return (R,G,B)

static_config = '''*.handleWidth:5
*.textColor:white
*.frameWidth:0
*.bevelWidth:0
menu.bullet.position:right
menu.bullet:triangle
*.borderWidth:0
*.font:-*-terminus-bold-r-*-*-16-*-*-*-*-*-iso10646-1'''

fluxstr = """*.focus.color:
*.unfocus.color:
*.button.color:
*.focused.color:
*.unfocused.color:
toolbar.iconbar.focused.color:
window.handle.focus.color:
window.handle.unfocus.color:
menu.title.color:
menu.frame.color:
menu.hilite.color:
menu.frame.disableColor:
toolbar.clock.color:
toolbar.workspace.color:
toolbar.systray.color:
"""

def print_config():
    random_angle = random.randint(0, 360)
    golden_angle = 137.508
    for line in fluxstr.split():
        r, g, b = hsv_to_rgb(random_angle, SATURATION, VALUE)
        print("{}#{:02x}{:02x}{:02x}".format(line, r, g, b))
        random_angle = random_angle+golden_angle
        if random_angle > 360:
            random_angle = random_angle - 360

if __name__ == '__main__':
    print(static_config)
    print_config()
