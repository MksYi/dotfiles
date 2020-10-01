# Directory info.
local current_dir='${PWD/#$HOME/~} '

# User info
local user="%(!.%{$terminfo[bold]$fg[red]%}.%{$terminfo[bold]$fg[red]%})%n%{$reset_color%}"

# Host info
typeset -A host_repr
host_repr=('dieter-ws-a7n8x-arch' "%{$fg_bold[green]%}ws" 'dieter-p4sci-arch' "%{$fg_bold[blue]%}p4")
local host="@${host_repr[$HOST]:-$HOST}%{$reset_color%}"

# ret status
local ret_status="(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

# Git short sha
local git_sha='$(git_prompt_short_sha)'
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{$fg_bold[red]%}("
ZSH_THEME_GIT_PROMPT_SHA_AFTER=")%{$reset_color%}%{$fg_bold[white]%}]%{$reset_color%} "

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[white]%}[%{$reset_color%}%{$fg_bold[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_BRANCH=" %{$fg[magenta]%}\ue0a0"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}\u2718"


# Prompt format: \n # DIRECTORY [GIT_BRANCH STATE GIT_SHA] [TIME] \n ➜
PROMPT="
${user}${host} \
%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${git_info}\
${git_sha}\

%${ret_status}%{$reset_color%}"

RPROMPT="%{$fg[white]%}[%*]"
