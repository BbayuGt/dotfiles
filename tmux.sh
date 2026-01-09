#!/usr/bin/env zsh

# ensure we can find tmux (especially on macOS/Homebrew)
export PATH=$PATH:/usr/local/bin:/opt/homebrew/bin

# 1. Check for an unattached session (status '0')
#    We use 'command tmux' to bypass any potential aliases
session=$(command tmux list-sessions -F "#{session_attached} #{session_name}" 2>/dev/null | grep '^0 ' | head -n 1 | cut -d ' ' -f 2-)

# 2. Attach if found, else create new
if [ -n "$session" ]; then
    exec command tmux attach-session -t "$session"
else
    exec command tmux new-session
fi
