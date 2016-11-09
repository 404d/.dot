#!/usr/bin/env python
import platform
host = platform.node().lower().split(".")[0]

keys = {}
class Key(object):
    def __init__(self, name, action):
        self.name = name
        self.action = action
        keys[name] = self

mappings = {}
class Mapping(object):
    def __init__(self, name, code=None, sym=None):
        self.name = name
        self.code = code
        self.sym = sym
        mappings[name] = self

Key(name="brightness up", action="exec zsh $basedir/bin/backlight.zsh $backlight_screen_path +")
Key(name="brightness down", action="exec zsh $basedir/bin/backlight.zsh $backlight_screen_path -")
Key(name="backlight up", action="exec zsh $basedir/bin/backlight.zsh $backlight_keyboard_path +")
Key(name="backlight down", action="exec zsh $basedir/bin/backlight.zsh $backlight_keyboard_path -")

Mapping(name="brightness down", code="232")
Mapping(name="brightness up", code="233")
Mapping(name="backlight down", code="237")
Mapping(name="backlight up", code="238")

for name in mappings:
    if name in keys:
        key = keys[name]
        mapping = mappings[name]
        if mapping.code:
            print("bindcode %s %s" % (mapping.code, key.action))
        elif mapping.sym:
            print("bindsym %s %s" % (mapping.sym, key.action))
