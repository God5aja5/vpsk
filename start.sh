#!/bin/bash
echo "Starting persistent terminal for Render..."

# Set terminal type for better mobile compatibility
export TERM=xterm-256color

# Configure tmux for mobile view
tmux set -g status off
tmux set -g mouse on
tmux set -g default-terminal "screen-256color"

# Create tmux session if not exists
tmux new-session -d -s main || true

# Start ttyd with custom options for mobile
ttyd -p 8080 \
    -t fontSize=20 \
    -t fontFamily="monospace" \
    -t theme=monokai \
    tmux attach-session -t main
