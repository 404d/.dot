#!/usr/bin/python
import platform
host = platform.node().lower()

keys = {}
class Key(object):
    def __init__(self, name, action, release=False):
        self.name = name
        self.action = action
        self.release = release
        keys[name] = self

mappings = {}
class Mapping(object):
    def __init__(self, name, code=None, sym=None):
        self.name = name
        self.code = code
        self.sym = sym
        mappings[name] = self

Key(name="ablaze screen", action="exec zsh $basedir/bin/i3-screenshot.zsh 0 0")
Key(name="ablaze window", action="exec zsh $basedir/bin/i3-screenshot.zsh 0 -u")
Key(name="ablaze region", release=True, action="exec zsh $basedir/bin/i3-screenshot.zsh 0 -s")
Key(name="ablaze public screen", action="exec zsh $basedir/bin/i3-screenshot.zsh -p 0")
Key(name="ablaze public window", action="exec zsh $basedir/bin/i3-screenshot.zsh -p -u")
Key(name="noop ablaze region", action="exec true")
Key(name="noop ablaze public region", action="exec true")

if host == "yukiho":
    keyboard = "g710+"
elif host == "katsumi":
    keyboard = "apple-mbp"
elif host == "maou":
    keyboard = "hp-probook"

if keyboard == "apple":
    Mapping(name="ablaze screen", code="$mod+192")
    Mapping(name="ablaze window", code="$mod+193")
    Mapping(name="ablaze public screen", code="$mod+Shift+192")
    Mapping(name="ablaze public window", code="$mod+Shift+193")

elif keyboard == "apple-mbp":
    Mapping(name="noop ablaze region", code="Shift+121")
    Mapping(name="ablaze region", code="Shift+121")
    Mapping(name="ablaze window", code="Shift+122")
    Mapping(name="ablaze screen", code="Shift+123")
    Mapping(name="noop ablaze public region", code="$mod+121")
    Mapping(name="ablaze public region", code="$mod+121")
    Mapping(name="ablaze public window", code="$mod+122")
    Mapping(name="ablaze public screen", code="$mod+123")

elif keyboard == "g710+":
    Mapping(name="noop ablaze region", code="$mod+172")
    Mapping(name="ablaze region", code="$mod+172")
    Mapping(name="ablaze window", code="$mod+174")
    Mapping(name="ablaze screen", code="$mod+173")
    Mapping(name="noop ablaze public region", code="$mod+Shift+172")
    Mapping(name="ablaze public region", code="$mod+Shift+172")
    Mapping(name="ablaze public window", code="$mod+Shift+174")
    Mapping(name="ablaze public screen", code="$mod+Shift+173")

elif keyboard == "hp-probook":
    Mapping(name="noop ablaze region", code="$mod+173")
    Mapping(name="ablaze region", code="$mod+173")
    Mapping(name="ablaze window", code="$mod+172")
    Mapping(name="ablaze screen", code="$mod+171")
    Mapping(name="noop ablaze public region", code="$mod+Shift+173")
    Mapping(name="ablaze public region", code="$mod+Shift+173")
    Mapping(name="ablaze public window", code="$mod+Shift+172")
    Mapping(name="ablaze public screen", code="$mod+Shift+171")

for name in mappings:
    if name in keys:
        key = keys[name]
        mapping = mappings[name]
        prefix = ""
        if key.release:
            prefix = " --release"
        if mapping.code:
            print("bindcode%s %s %s" % (prefix, mapping.code, key.action))
        elif mapping.sym:
            print("bindsym%s %s %s" % (prefix, mapping.sym, key.action))
