#!/bin/bash
echo "Starting persistent terminal..."
# Create tmux session if not exists
tmux new-session -d -s main || true
# Start ttyd attached to tmux session
ttyd -p 8080 tmux attach-session -t main
