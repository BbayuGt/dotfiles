#!/usr/bin/env zsh

# 1. Count total unattached sessions
unattached_count=$(command tmux list-sessions -F "#{session_attached}" 2>/dev/null | grep -c '^0' || true)

# 2. Get the name of the first unattached session (if any)
session=$(command tmux list-sessions -F "#{session_attached} #{session_name}" 2>/dev/null | awk '/^0 /{print $2; exit}')

# 3. Attach if found, else create new
if [ -n "$session" ]; then
    # If this is the LAST unattached session available, spawn a new "warm" 
    # session in the background to be ready for the NEXT terminal you open.
    if [ "$unattached_count" -eq 1 ]; then
        command tmux new-session -d &>/dev/null &!
    fi
    
    # Attach to the ready session
    exec command tmux attach-session -t "$session"
else
    # No unattached sessions exist at all (e.g., first terminal after a fresh boot).
    # Spawn a "warm" session in the background for the next time...
    command tmux new-session -d &>/dev/null &!
    
    # ...and create a new active session for right now.
    exec command tmux new-session
fi
