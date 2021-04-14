# (cat ~/.cache/wal/sequences &)

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
path+=('/Users/shreychoudhary/color-scripts/color-scripts')
path+=('/Users/shreychoudhary/bklk-master')
export PATH
export EDITOR=nvim
export HISTCONTROL=ignoreboth
# Path to your oh-my-zsh installation.
export ZSH="/Users/shreychoudhary/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME=powerlevel10k/powerlevel10k

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
 HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting osx last-working-dir copyfile zsh-vim-mode zsh-z sudo yabai-zsh-completions)
#extract web-search

source $ZSH/oh-my-zsh.sh

DISABLE_UPDATE_PROMPT=true

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zcon="nvim ~/.zshrc"
alias omzcon="nvim ~/.oh-my-zsh"
alias ycon="nvim ~/.yabairc"
alias scon="nvim ~/.skhdrc"
alias pcon="nvim ~/.p10k.zsh"
alias ncon="nvim ~/.config/neofetch/config.conf"
alias r='exec zsh'
alias l='lsd --group-dirs first -AF'
alias ll='lsd --group-dirs first -A --long'
alias u='update_packages&'
alias yr='launchctl kickstart -k "gui/${UID}/homebrew.mxcl.yabai" && sudo yabai --load-sa'
alias v='nvim'
alias c='clear'
alias wttr='curl wttr.in'
alias neofetch='neofetch --ascii'
alias grep='grep --color=auto'
alias ..='cd ..'
alias mv='mv -i'
alias rm='rm -i'
alias mkdir='mkdir -pv'
alias node1='ssh node1'
alias node2='ssh node2'
alias node3='ssh node3'
alias node4='ssh node4'
alias shutdown-cluster='ssh node1 "sudo shutdown"; ssh node2 "sudo shutdown"; ssh node3 "sudo shutdown"; ssh node4 "sudo shutdown";'
alias reboot-cluster='ssh node1 "sudo reboot"; ssh node2 "sudo reboot"; ssh node3 "sudo reboot"; ssh node4 "sudo reboot";'
alias cluster='tmuxinator start cluster'
alias new-cluster='tmux kill-server && tmuxinator start cluster'
alias dp='displayplacer "id:E7761DAE-4EF7-7864-8FCA-BDC24450055D res:1920x1080 hz:60 color_depth:8 scaling:on origin:(0,0) degree:0" "id:F0CEEAA5-1207-C5E2-7D55-245FA844CEA1 res:1080x1920 hz:60 color_depth:8 scaling:on origin:(1920,-423) degree:270"'
alias rebb='open -gj "swiftbar://refreshPlugin?name=Package"'

# . "~/.cache/wal/colors.sh"

function pywal {
    # generate color scheme from current wallpaper
    current_wallpaper="$(osascript -e 'tell app "finder" to get posix path of (get desktop picture as alias)')"
    wal -i $current_wallpaper -n
}

function update_packages() {
    brew update && brew upgrade && brew upgrade --cask; 
    #npm update;
    #yarn upgrade;
    #apm update && apm upgrade;
    #mas upgrade;
    gem update;
    pip3 list --outdated --format=freeze | grep -v "^\-e" | cut -d = -f 1  | xargs -n1 pip3 install -U;
    open -gj "swiftbar://refreshPlugin?name=Package" 2>/dev/null
    terminal-notifier -message "Packages Updated"
}

chpwd() l

function powerline_precmd() {
    #PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi


autoload -U bashcompinit
    bashcompinit

# source $(dirname $(gem which colorls))/tab_complete.sh

source <(antibody init)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Created by `userpath` on 2019-12-18 00:21:33
export PATH="$PATH:/Users/shreychoudhary/.local/bin"

# Created by `userpath` on 2020-01-01 13:06:56
export PATH="$PATH:/Users/shreychoudhary/.local/bin"
export HOMEBREW_GITHUB_API_TOKEN=3d9d08382360ee0c8e29c19f0d87018d396d514f
export PATH="/usr/local/opt/sphinx-doc/bin:$PATH"
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

export PATH=$PATH:~/.scripts

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

clear
# neofetch

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
