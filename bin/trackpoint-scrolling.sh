#!/bin/bash

# jeffg@jeffg.org
# 2015-Nov-03 (originally sometime in 2013)

# On my first-generation Thinkpad X1 Carbon, the built-in TrackPoint
# device can be referred to by its name since the name is unique among
# those seen by xinput. This means no futzing with grep and awk, yay.

# I don't remember exactly where I tracked down these things, but the gist
# is to enable vertical and horizontal scrolling with the TrackPoint "nub"
# when the middle button of the TrackPoint device is held down.

xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200

# Enables horizontal scrolling
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5

# Enables middle-button emulation via left+right
#xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Middle Button Emulation" 8 1
#xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Middle Button Timeout" 8 50
