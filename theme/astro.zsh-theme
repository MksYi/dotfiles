# Directory info.
local current_dir='${PWD/#$HOME/~} '

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
%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${git_info}\
${git_sha}\

%${ret_status}%{$reset_color%}"

RPROMPT="%{$fg[white]%}[%*]"