#!/usr/bin/env python3
# rnd_style.py
# Public Domain
#
# style your fluxbox with random colors!
import itertools
import math
import random

SATURATION = 0.666
VALUE = 0.42

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

color_config = '''toolbar.clock.color:
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
window.title.unfocus.color:
window.title.focus.colorTo:
window.title.unfocus.colorTo:
window.label.focus.color:
window.label.unfocus.color:
window.label.focus.colorTo:
window.label.unfocus.colorTo:
window.handle.focus.color:
window.handle.unfocus.color:
window.handle.focus.colorTo:
window.handle.unfocus.colorTo:
window.grip.focus.color:
window.grip.unfocus.color:
window.grip.focus.colorTo:
window.grip.unfocus.colorTo:
window.button.focus.color:
window.button.unfocus.color:
window.button.focus.colorTo:
window.button.unfocus.colorTo:
window.button.pressed.color:
window.button.pressed.colorTo:
menu.title.color:
menu.title.colorTo:
menu.frame.color:
menu.frame.colorTo:
menu.hilite.color:
menu.hilite.colorTo:'''


texture_config = '''toolbar.clock:
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


def hsv_to_rgb(H, s, v):
    '''degrees:range(0,360) -> float -> float -> rgb'''
    C = v * s
    HH = H/60.0
    X = C * (1 - abs((HH % 2 - 1)))
    m = v - C
    r = g = b = 0
    # print(C,X,m)
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
    # print(r,g,b)
    r = int(math.ceil(255*(r+m)))
    g = int(math.ceil(255*(g+m)))
    b = int(math.ceil(255*(b+m)))
    # print(r,g,b)
    return (r, g, b)


def gen_rgb():
    '''each time we get a new rgb value, it should be random'''
    while True:
        random_angle = random.randint(0, 360)
        r, g, b = hsv_to_rgb(random_angle, SATURATION, VALUE)
        yield (r, g, b)


def gen_rgb2():
    '''each time we get a new rgb value, it should be random'''
    golden_angle = 137.508
    random_angle = random.randint(0, 360)
    while True:
        random_angle = random_angle+golden_angle
        if random_angle > 360:
            random_angle = random_angle - 360
        r, g, b = hsv_to_rgb(random_angle, SATURATION, VALUE)
        yield (r, g, b)


def hexstr(rgb):
    r, g, b = rgb
    return "#{:02x}{:02x}{:02x}".format(r, g, b)


def gen_texture():
    appearance = [
            'flat',
            'raised',
            'sunken']
    texture = [
            'gradient',
            # 'solid'
            ]
    gradient = [
            'horizontal',
            'vertical',
            'diagonal',
            'pipecross',
            'elliptic',
            'rectangle',
            'pyramid',
            'crossdiagonal'
            ]
    interlaced = [
            '',
            'Interlaced'
            ]
    bevel = [
            'bevel1',
            'bevel2']
    options = [
            appearance,
            texture,
            gradient,
            interlaced,
            bevel
            ]
    return [random.choice(x) for x in options]


if __name__ == '__main__':
    # print(static_config)
    for line in color_config.split():
        # print(line + hexstr(*itertools.islice(gen_rgb(), 1)))
        print(line + hexstr(*itertools.islice(gen_rgb2(), 1)))
    # for line in texture_config.split():
        # print(line + ' '.join(gen_texture()))
