#!/usr/bin/python

keys = {}
class Key:
    def __init__(self, name, action):
        self.name = name
        self.action = action
        keys[name] = self

mappings = {}
class Mapping:
    def __init__(self, name, code=None, sym=None):
        self.name = name
        self.code = code
        self.sym = sym
        mappings[name] = self

Key(name="ablaze screen", action="exec zsh $basedir/i3-screenshot.zsh 0 0")
Key(name="ablaze window", action="exec zsh $basedir/i3-screenshot.zsh 0 -u")
Key(name="ablaze public screen", action="exec zsh $basedir/i3-screenshot.zsh -p 0")
Key(name="ablaze public window", action="exec zsh $basedir/i3-screenshot.zsh -p -u")

keyboard = "apple"
if keyboard == "apple":
    Mapping(name="ablaze screen", code="$mod+192")
    Mapping(name="ablaze window", code="$mod+193")
    Mapping(name="ablaze public screen", code="$mod+Shift+192")
    Mapping(name="ablaze public window", code="$mod+Shift+193")

elif keyboard == "g710+":
    Mapping(name="ablaze screen", code="$mod+172")
    Mapping(name="ablaze window", code="$mod+174")
    Mapping(name="ablaze public screen", code="$mod+Shift+172")
    Mapping(name="ablaze public window", code="$mod+Shift+174")

for name in mappings:
    if name in keys:
        key = keys[name]
        mapping = mappings[name]
        if mapping.code:
            print "bindcode %s %s" % (mapping.code, key.action)
        elif mapping.sym:
            print "bindsym %s %s" % (mapping.sym, key.action)
