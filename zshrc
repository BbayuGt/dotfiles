# OMZ Config
export ZSH="$HOME/.oh-my-zsh"
ZSH_DISABLE_COMPFIX="true"
ZSH_THEME="cloud"

# OMZ Settings
zstyle ':omz:update' mode background
plugins=(git tmux zsh-interactive-cd zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Base PATH additions
export PATH="/usr/lib/qt6/bin/:$PATH"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# Nodejs (fnm)
export PATH="/run/user/1000/fnm_multishells/32973_1790646252785/bin":$PATH
export FNM_MULTISHELL_PATH="/run/user/1000/fnm_multishells/32973_1790646252785"
export FNM_VERSION_FILE_STRATEGY="local"
export FNM_DIR="/home/bbayugt/.local/share/fnm"
export FNM_LOGLEVEL="info"
export FNM_NODE_DIST_MIRROR="https://nodejs.org/dist"
export FNM_COREPACK_ENABLED="false"
export FNM_RESOLVE_ENGINES="true"
export FNM_ARCH="x64"
rehash

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# ==============================================================================
# Keybindings & Aliases
# ==============================================================================
bindkey '^H' backward-kill-word

# System & Utilities
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias yare="yay -Rns"
alias drop="dragon-drop -x"
alias vencord='sh -c "$(curl -sS https://vencord.dev/install.sh)"'
alias open='xdg-open'

# GPU Performance
alias highperf='echo high | sudo tee /sys/class/drm/card1/device/power_dpm_force_performance_level'
alias autoperf='echo auto | sudo tee /sys/class/drm/card1/device/power_dpm_force_performance_level'

# RBW Unlock Wrappers
alias ssh="rbw unlock && ssh"
alias scp="rbw unlock && scp"
alias sftp="rbw unlock && sftp"

#Panic
function panic() {
    hyprctl repl 'Panic = not Panic' &>/dev/null && hyprctl repl '"Panic mode is now "..(Panic and "on" or "off")'
}

# Startup
function print_welcome_sign() {
    cachefile="$HOME/.cache/qotd.json"
    
    # Touch file if it doesn't exist to prevent jq errors on first run
    [[ ! -f "$cachefile" ]] && echo '[{"q":"Welcome!","a":"System","date":"1970-01-01"}]' > "$cachefile"
    
    cachedata=$(cat "$cachefile" | jq ".[]")
    cachedate=$(echo "$cachedata" | jq -r ".date")
    currentdate=$(TZ=CST date +%F)

    if [ "$cachedate" != "$currentdate" ]; then
        (curl https://zenquotes.io/api/today -o "$cachefile" --silent > /dev/null 2>&1 &)
        cachedata=$(cat "$cachefile" | jq ".[]")
    fi

    quote=$(echo "$cachedata" | jq -r ".q")
    author=$(echo "$cachedata" | jq -r ".a")

    bold=$(tput bold)
    normal=$(tput sgr0)
    cols=$COLUMNS

    shorttext=$(cat << EOF
 __    __     _                              
/ / /\ \ \___| | ___ ___  _ __ ___   ___     
\ \/  \/ / _ \ |/ __/ _ \| '_ \` _ \ / _ \    
 \  /\  /  __/ | (_| (_) | | | | | |  __/  _ 
  \/  \/ \___|_|\___\___/|_| |_| |_|\___| (_)

$bold> $quote $normal
- $author
EOF
)

longtext=$(cat << EOF
 __    __     _                              
/ / /\ \ \___| | ___ ___  _ __ ___   ___     
\ \/  \/ / _ \ |/ __/ _ \| '_ \` _ \ / _ \      $bold> $quote$normal
 \  /\  /  __/ | (_| (_) | | | | | |  __/  _    - $author
  \/  \/ \___|_|\___\___/|_| |_| |_|\___| (_)
EOF
)
    textwidth=$(echo "$longtext" | wc -L)

    if [ "$textwidth" -gt "$cols" ]; then
        echo "$shorttext" | lolcat -p 10
    else
        echo "$longtext" | lolcat -p 10
    fi
    add-zsh-hook -d precmd print_welcome_sign
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd print_welcome_sign
