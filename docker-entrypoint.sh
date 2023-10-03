#!/bin/bash
# remove lock on virtual screen
rm -f /tmp/.X1-lock
# remove locks on chrome profiles (allows chrome to start without user input)
rm -f /app/src/profiles/*/SingletonLock
# remove google tmp files (prevents auto logout hopefully)
rm -rf /tmp/.com.google.Chrome.*
export DISPLAY=:1
Xvfb $DISPLAY -screen 0 1280x1024x16 &
x11vnc -display $DISPLAY -bg -forever -nopw -quiet -listen any -xkb -passwd $PASSWORD &
python ./src/main.py --nomenu --nowait --docker
