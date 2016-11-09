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

Key(name="redshift", action="exec pkill -USR1 redshift")

Key(name="play", action="exec zsh $basedir/bin/statuscenter-signal.zsh playpause")
Key(name="stop", action="exec zsh $basedir/bin/statuscenter-signal.zsh stop")
Key(name="next", action="exec zsh $basedir/bin/statuscenter-signal.zsh next")
Key(name="previous", action="exec zsh $basedir/bin/statuscenter-signal.zsh previous")
Key(name="eject", action="exec eject")
Key(name="volume up", action="exec pulseaudio-ctl up")
Key(name="volume down", action="exec pulseaudio-ctl down")
Key(name="volume mute", action="exec pulseaudio-ctl mute")
Key(name="media volume up", action="exec zsh $basedir/bin/statuscenter-signal.zsh volume + 5")
Key(name="media volume down", action="exec zsh $basedir/bin/statuscenter-signal.zsh volume - 5")

if host == "yukiho":
    keyboard = "g710+"
elif host == "maou":
    keyboard = "hp-probook"
else:
    keyboard = "apple"

Mapping(name="media volume up", code="shift+123")
Mapping(name="media volume down", code="shift+122")

Mapping(name="volume up", code="123")
Mapping(name="volume down", code="122")
Mapping(name="volume mute", code="121")
if keyboard == "apple":
    Mapping(name="play", code="193")
    Mapping(name="previous", code="192")
    Mapping(name="next", code="194")

    Mapping(name="redshift", code="212")

    Mapping(name="eject", sym="XF86Eject")

elif keyboard in ["g710+", "hp-probook"]:
    Mapping(name="play", code="172")
    Mapping(name="stop", code="174")
    Mapping(name="previous", code="173")
    Mapping(name="next", code="171")

for name in mappings:
    if name in keys:
        key = keys[name]
        mapping = mappings[name]
        if mapping.code:
            print("bindcode %s %s" % (mapping.code, key.action))
        elif mapping.sym:
            print("bindsym %s %s" % (mapping.sym, key.action))
