#!/usr/bin/env python3
# fluxboxcolors.py
# Public Domain
#
# style your fluxbox with random colors!
import random

SATURATION = 0.69
VALUE = 0.42

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
    return (R,G,B)

static_config = '''*.handleWidth:5
*.textColor:white
window.label.focus.textColor:white
window.label.unfocus.textColor:grey
window.button.focus.picColor:white
window.button.unfocus.picColor:grey
*.frameWidth:0
*.bevelWidth:0
menu.bullet.position:right
menu.bullet:triangle
*.borderWidth:0
*.font:-*-terminus-bold-r-*-*-16-*-*-*-*-*-iso10646-1'''

colors = '''toolbar.clock.color:
toolbar.clock.colorTo:
toolbar.workspace.color: 
toolbar.workspace.colorTo: 
toolbar.iconbar.empty.color: 
toolbar.iconbar.empty.colorTo: 
toolbar.iconbar.focused.color: 
toolbar.iconbar.focused.colorTo: 
toolbar.iconbar.unfocused.color: 
toolbar.iconbar.unfocused.colorTo:
toolbar.button.color: 
toolbar.button.colorTo: 
toolbar.button.picColor: 
toolbar.button.pressed.color: 
toolbar.button.pressed.colorTo: 
toolbar.button.pressed.picColor: 
window.title.focus.color: 
window.title.focus.colorTo: 
window.title.unfocus.color: 
window.title.unfocus.colorTo: 
window.label.focus.color: 
window.label.focus.colorTo: 
window.label.unfocus.color: 
window.label.unfocus.colorTo: 
window.handle.focus.color: 
window.handle.focus.colorTo: 
window.handle.unfocus.color: 
window.handle.unfocus.colorTo: 
window.grip.focus.color: 
window.grip.focus.colorTo: 
window.grip.unfocus.color: 
window.grip.unfocus.colorTo: 
window.button.focus.color: 
window.button.focus.colorTo: 
window.button.unfocus.color: 
window.button.unfocus.colorTo: 
window.button.pressed.color: 
window.button.pressed.colorTo: 
menu.title.color: 
menu.title.colorTo: 
menu.frame.color: 
menu.frame.colorTo: 
menu.hilite.color: 
menu.hilite.colorTo:'''


textured = '''toolbar.clock:
toolbar.workspace:
toolbar.iconbar.empty:
toolbar.iconbar.focused:
toolbar.iconbar.unfocused:
toolbar.button:
toolbar.button.pressed:
window.title.focus:
window.title.unfocus:
window.label.focus:
window.label.unfocus:
window.handle.focus:
window.handle.unfocus:
window.grip.focus:
window.grip.unfocus:
window.button.focus:
window.button.unfocus:
window.button.pressed:
menu.title:
menu.frame:
menu.hilite:
slit:'''

def print_config():
    random_angle = random.randint(0, 360)
    golden_angle = 137.508
    for line in colors.split():
        r, g, b = hsv_to_rgb(random_angle, SATURATION, VALUE)
        print("{}#{:02x}{:02x}{:02x}".format(line, r, g, b))
        random_angle = random_angle+golden_angle
        if random_angle > 360:
            random_angle = random_angle - 360
    appearance = ['flat','raised','sunken']
    texture = [
            'gradient',
            #'solid'
            ]
    gradient = ['horizontal', 'vertical',
    'diagonal','pipecross','elliptic','rectangle', 'pyramid', 'crossdiagonal']
    interlaced = ['', 'Interlaced']
    bevel = ['bevel1','bevel2']
    for line in textured.split():
        print(line + random.choice(appearance) + ' ' 
                + random.choice(texture) + ' '
                + random.choice(gradient) + ' '
                + random.choice(interlaced) + ' '
                + random.choice(bevel))

if __name__ == '__main__':
    print(static_config)
    print_config()
