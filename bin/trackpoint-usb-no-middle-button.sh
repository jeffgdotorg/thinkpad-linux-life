#!/bin/bash

# jeffg@jeffg.org
# 2015-Nov-03

# I bought a fancy USB keyboard with a built-in TrackPoint because I've
# lived long enough with a ThinkPad that I'm now one of "those people".
# I must seem very odd indeed to the Others at this point.

# The trouble is that, although middle-button + "nub" scrolling works on
# this USB keyboard, it also registers an unwanted middle-click. Disabling
# middle-button paste in the GNOME3 tweak tool helps to a degree, but it's
# still annoying in e.g. Thunderbird where middle-clicking a message in the
# inbox list opens that message in a new tab.

# Since this keyboard adds two identically-named devices, distinguishable
# only by their xinput device IDs, we have to bring in the dumb muscle of
# grep and awk in order to target the correct device. Boo.

# The correct device looks like this among the output of `xinput list`:
#
# Lenovo ThinkPad Compact USB Keyboard with TrackPoint	id=14	[slave  pointer  (2)]

DEVID=`xinput list | egrep 'Lenovo ThinkPad Compact USB Keyboard with TrackPoint.*slave.*pointer' | awk -F= '{ print $2 }' | awk '{ print $1 }'`

# Targeting the right device, we map its second (middle) button to act
# like button zero (no such button). Problem solved.

if [ ! -z $DEVID ]; then
	xinput set-button-map ${DEVID} 1 0 3
fi
