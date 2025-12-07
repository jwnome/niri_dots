#!/bin/bash

# Screen recording script for wf-recorder
# Toggle behavior: run once to start (with output selection), run again to stop

PIDFILE="/tmp/wf-recorder.pid"
RECORDINGS_DIR="$HOME/Videos"

# Check if already recording
if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
    # Stop recording
    kill -SIGINT "$(cat "$PIDFILE")"
    rm -f "$PIDFILE"
    notify-send "Recording Stopped"
    exit 0
fi

# Get list of outputs and let user select one
OUTPUT=$(niri msg outputs | grep '^Output' | grep -oP '\(\K[^)]+(?=\)$)' | tofi --prompt-text "Record output: ")
if [ -z "$OUTPUT" ]; then
    notify-send "Recording Cancelled"
    exit 1
fi

# Generate filename with timestamp
FILENAME="$RECORDINGS_DIR/recording-$(date +%Y%m%d-%H%M%S).mp4"

# Show notification briefly, wait for it to disappear, then start recording
notify-send "Live"
sleep 2

# Start recording with optimized settings for web uploads:
# - libx264: widely compatible H.264 codec
# - CRF 23: good quality/size balance (lower = better quality, larger file)
# - preset fast: reasonable encoding speed
# - 30fps: standard framerate
wf-recorder \
    -o "$OUTPUT" \
    -c libx264 \
    -p crf=23 \
    -p preset=fast \
    -r 30 \
    -f "$FILENAME" &

echo $! > "$PIDFILE"
