alias yare="yay -Rns"
alias drop="dragon-drop -x"

# qt6 path
export PATH="/usr/lib/qt6/bin/:$PATH"

# Power Save Mode: Disable SMT (Threads 6-11) and cap TDP to 10W
powersave() {
    echo "Entering Power Save Mode..."
    # Disable logical threads 6 through 11
    for i in {6..11}; do
        echo 0 | sudo tee /sys/devices/system/cpu/cpu$i/online > /dev/null
    done
    # Set RyzenAdj limits (10W = 10000)
    # --stapm-limit is the sustained power limit
    sudo ryzenadj --stapm-limit=15000 --fast-limit=15000 --slow-limit=15000
    echo "Cores 6-11 disabled. TDP capped at 10W."
}

# Power Reset: Enable all cores and reset TDP to defaults
powerrst() {
    echo "Resetting Power Profile..."
    # Re-enable all threads
    for i in {0..11}; do
        echo 1 | sudo tee /sys/devices/system/cpu/cpu$i/online > /dev/null
    done
    # Reset RyzenAdj (6600H stock is typically 45W, adjust if you prefer different)
    sudo ryzenadj --stapm-limit=28000 --fast-limit=28000 --slow-limit=28000
    echo "All cores enabled. TDP reset to 45W."
}

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

bindkey '^H' backward-kill-word

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export BROWSER=brave

# Path to your Oh My Zsh installation.
ZSH_DISABLE_COMPFIX="true"
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="cloud"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode background      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux zsh-interactive-cd zsh-autosuggestions)
# ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR='nvim'
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# nodejs
export PATH="/run/user/1000/fnm_multishells/59866_1784996669817/bin":$PATH
export FNM_MULTISHELL_PATH="/run/user/1000/fnm_multishells/59866_1784996669817"
export FNM_VERSION_FILE_STRATEGY="local"
export FNM_DIR="/home/bbayugt/.local/share/fnm"
export FNM_LOGLEVEL="info"
export FNM_NODE_DIST_MIRROR="https://nodejs.org/dist"
export FNM_COREPACK_ENABLED="false"
export FNM_RESOLVE_ENGINES="true"
export FNM_ARCH="x64"
rehash

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vencord='sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"'
alias highperf='echo high | sudo tee /sys/class/drm/card1/device/power_dpm_force_performance_level'
alias autoperf='echo auto | sudo tee /sys/class/drm/card1/device/power_dpm_force_performance_level'
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# bun completions
[ -s "/home/bbayugt/.bun/_bun" ] && source "/home/bbayugt/.bun/_bun"
export LIBVIRT_DEFAULT_URI="qemu:///system"

function print_welcome_sign() {
    # Check cache first
    cachefile=".cache/qotd.json"
    cachedata=$(cat $cachefile | jq ".[]")

    cachedate=$(echo $cachedata | jq ".date")

    currentdate=$(date +%F)

    if [ "$cachedate" != "\"$currentdate\"" ]; then
	    curl https://zenquotes.io/api/today -o ".cache/qotd.json" --silent
	    cachedata=$(cat $cachefile | jq ".[]")
    fi # Cache miss


    quote=$(echo $cachedata | jq ".q")
    author=$(echo $cachedata | jq ".a")

    bold=$(tput bold)
    normal=$(tput sgr0)

    cols=$COLUMNS

    shorttext=$(cat << EOF
 __    __     _                              
/ / /\\ \\ \\___| | ___ ___  _ __ ___   ___     
\\ \\/  \\/ / _ \\ |/ __/ _ \\| '_ \` _ \\ / _ \\    
 \\  /\\  /  __/ | (_| (_) | | | | | |  __/  _ 
  \\/  \\/ \\___|_|\\___\\___/|_| |_| |_|\\___| (_)
					     
$bold> $quote $normal
- $author
EOF
)

    longtext=$(cat << EOF
 __    __     _                              
/ / /\\ \\ \\___| | ___ ___  _ __ ___   ___     
\\ \\/  \\/ / _ \\ |/ __/ _ \\| '_ \` _ \\ / _ \\    	$bold> $quote $normal
 \\  /\\  /  __/ | (_| (_) | | | | | |  __/  _ 	- $author
  \\/  \\/ \\___|_|\\___\\___/|_| |_| |_|\\___| (_)
					     
EOF
)
    # Get the longest line of the text (width)
    textwidth=$(echo "$longtext" | wc -L)

    # Display the long text if it fits
    if [ $textwidth -gt $cols ]; then
	    echo "$shorttext" | lolcat -p 10
    else
	    echo "$longtext" | lolcat -p 10
    fi
    add-zsh-hook -d precmd print_welcome_sign
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd print_welcome_sign
