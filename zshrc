# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
[ -z $ZSH_THEME ] && ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ll="ls -l"
alias la="ls -a"
alias l="ls -alh"
alias less="less -R"
alias grep="grep --color=auto"
alias ipy=ipython
alias vi=vim
alias disasm="objdump -D -M intel"
alias tree="tree -C"

# tmux
[ -x "`which tmux`" ] && alias tm=tmux

# 7z
alias 8z=7z
alias zl="7z l"
alias zx="7z x"

# minecraft path
if [ -d "/Users/$USER/Library/Application Support/minecraft" ]; then
    export MINECRAFT="/Users/$USER/Library/Application Support/minecraft"
fi

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew colored-man git history-substring-search rvm pip)

export HISTSIZE=10000000
export HISTFILESIZE=10000000
setopt HIST_IGNORE_SPACE CORRECT

# User configuration

prefix_path() { [ -d "$1" ] && export PATH="$1:$PATH" }
extend_path() { [ -d "$1" ] && export PATH="$PATH:$1" }

register_man_path() { [ -d "$1" ] && export MANPATH="$1:$MANPATH" }


# check and preserve $PATH
if [ -z "$_PATH" ]; then
    export _PATH="$PATH"
else
    export PATH="$_PATH"
fi

if [ `uname -s` = 'Linux' ]; then
elif [ `uname -s` = 'Darwin' ]; then
    # brew
    prefix_path "/usr/local/bin"
    prefix_path "/usr/local/sbin"

    # gnu tools
    prefix_path "/usr/local/opt/gnu-tar/libexec/gnubin"
    prefix_path "/usr/local/opt/gnu-sed/libexec/gnubin"

    register_man_path "/usr/local/opt/gnu-sed/libexec/gnuman"

    prefix_path "/usr/local/opt/coreutils/libexec/gnubin"
    register_man_path "/usr/local/opt/coreutils/libexec/gnuman"

    [ -x "`which mono`" ] && export MONO_GAC_PREFIX="/usr/local"

    alias pbp=pbpaste
    alias pbc=pbcopy
elif [ `uname -o` = 'Cygwin' ]; then
else
    echo "Oops! What's your OS?" > /dev/stderr
fi

export EDITOR=vim

export LC_ALL='zh_TW.UTF-8'

[ -r ~/.zshrc.local ] && source ~/.zshrc.local

# zsh help
if [ -f /usr/local/share/zsh/helpfiles ]; then
    unalias run-help
    autoload run-help
    HELPDIR=/usr/local/share/zsh/helpfiles
fi

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

[ -r ~/.zshrc.local.after ] && source ~/.zshrc.local.after
