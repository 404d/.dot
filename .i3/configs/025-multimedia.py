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

Key(name="play", action="mpc toggle")
Key(name="stop", action="mpc stop")
Key(name="next", action="mpc next")
Key(name="previous", action="mpc prev")
Key(name="volume up", action="pulseaudio-ctl up")
Key(name="volume down", action="pulseaudio-ctl down")
Key(name="volume mute", action="pulseaudio-ctl mute")

keyboard = "apple"
if keyboard == "apple":
    Mapping(name="play", code="193")
    Mapping(name="previous", code="192")
    Mapping(name="next", code="194")

    Mapping(name="volume up", code="123")
    Mapping(name="volume down", code="122")
    Mapping(name="volume mute", code="121")

elif keyboard == "g710+":
    Mapping(name="play", code="172")
    Mapping(name="stop", code="174")
    Mapping(name="previous", code="173")
    Mapping(name="next", code="171")

for name in mappings:
    if name in keys:
        key = keys[name]
        mapping = mappings[name]
        if mapping.code:
            print "bindcode %s %s" % (mapping.code, key.action)
        elif mapping.sym:
            print "bindsym %s %s" % (mapping.sym, key.action)
