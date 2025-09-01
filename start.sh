#!/bin/bash
echo "Starting persistent terminal..."
# Start a tmux session named 'main' if not exists
tmux new-session -d -s main || true
# Attach ttyd to the tmux session
ttyd -p 8080 tmux attach-session -t main
