.dot
====

All my different settings, scripts and such.

## Quick and dirty setup

Note that this will also install my .git_profile as the script is made for me to set it up on my computers.
Rather than using this script, you should copy the parts that you need/are going to use.

`prepare.sh` should (at the moment) support `dash`, `bash` and `zsh`.

    cd ~
    git clone https://github.com/404d/.dot.git
    bash .dot/.dot/prepare.sh

## Tweaking
### MacBook Pro Trackpad
<http://www.chris-reilly.org/blog/technotes/macbook-trackpad-in-ubuntu/>

### `vim` + YouCompleteMe - `SIGABRT` and workarounds
The TL;DR is that vim and MacVim links towards the wrong Python libraries in
a Homebrew setup with brewed Python, as hinted from
<https://github.com/Homebrew/homebrew/issues/33156>. This issue also mentions
that YCM compiles against system Python and not Homebrew Python because of it using CMAKE.

Looking through the Formula I found that the Formula uses `python-config` to get the libraries,
and doing a quick check and verifying that it indeed gives me the Homebrew Python libraries.
Taking a quick detour to find the path for the system Python binaries I found
`/Library/Frameworks/Python.framework/Versions/Current/bin/`. A workaround for `vim` `SIGABRT`s
is to patch the Homebrew Formula for MacVim and install that:

~~~
diff --git a/1 b/2
index 9989b0d..f22ebae 100644
--- a/1
+++ b/2
@@ -65,8 +65,8 @@ class Macvim < Formula
     if build.with? "python3"
       args << "--enable-python3interp"
     elsif build.with? "python"
-      ENV.prepend "LDFLAGS", `python-config --ldflags`.chomp
-      ENV.prepend "CFLAGS", `python-config --cflags`.chomp
+      ENV.prepend "LDFLAGS", `/Library/Frameworks/Python.framework/Versions/Current/bin/python-config --ldflags`.chomp
+      ENV.prepend "CFLAGS", `/Library/Frameworks/Python.framework/Versions/Current/bin/python-config --cflags`.chomp
       args << "--enable-pythoninterp"
     end
 
~~~

This does not however resolve the problems with MacVim crashing, but gives us a workaround for that too by launching MacVim from the terminal by using the `mvim` command.
