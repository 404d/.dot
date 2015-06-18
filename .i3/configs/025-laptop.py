#!/usr/bin/env python
import platform
host = platform.node().lower()

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

Key(name="brightness up", action="exec zsh $basedir/bin/brightness-up.zsh")
Key(name="brightness down", action="exec zsh $basedir/bin/brightness-down.zsh")
Key(name="backlight up", action="exec zsh $basedir/bin/backlight-up.zsh")
Key(name="backlight down", action="exec zsh $basedir/bin/backlight-down.zsh")

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
