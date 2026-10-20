#!/bin/sh

mechvibes &

# Wait for the Mechvibes window
for i in $(seq 1 50); do
    WIN=$(xdotool search --class 'mechvibes.Mechvibes' 2>/dev/null | head -n1)

    if [ -n "$WIN" ]; then
        # Make the window effectively invisible
        xprop -id "$WIN" \
            -f _NET_WM_WINDOW_OPACITY 32c \
            -set _NET_WM_WINDOW_OPACITY 0

        break
    fi

    sleep 0.1
done
