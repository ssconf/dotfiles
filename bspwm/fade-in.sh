#!/bin/sh

sleep 0.05

# Get complete X11 desktop size
WIDTH=$(xwininfo -root | awk '/Width:/ {print $2}')
HEIGHT=$(xwininfo -root | awk '/Height:/ {print $2}')

# Create black overlay
xterm \
    -name bspwm-fade \
    -geometry "${WIDTH}x${HEIGHT}+0+0" \
    -bg black \
    -fg black \
    -fullscreen \
    -e sh -c 'sleep 5' &

sleep 0.2

WIN=$(xdotool search --name bspwm-fade | head -n1)

[ -z "$WIN" ] && exit 1

xdotool windowraise "$WIN"

# 1-second cinematic ease-out
# 60 frames × ~0.0167 seconds = ~1 second

# 0.5-second cinematic ease-out
# 30 frames × ~0.0167 seconds ≈ 0.5 seconds
for i in $(seq 0 15); do

    t=$(awk "BEGIN {print $i / 15}")

    # Cubic ease-out
    eased=$(awk "BEGIN {print 1 - (1-$t)^3}")

    # Remaining black opacity
    opacity=$(awk "BEGIN {print 1 - $eased}")

    VALUE=$(awk "BEGIN {printf \"%.0f\", $opacity * 4294967295}")

    xprop -id "$WIN" \
        -f _NET_WM_WINDOW_OPACITY 32c \
        -set _NET_WM_WINDOW_OPACITY "$VALUE"

    sleep 0.0167
done


# Remove overlay
xdotool windowkill "$WIN" 2>/dev/null
