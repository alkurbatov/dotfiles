# This file is a part of Dotfiles project
#
# Copyright (C) 2018, Alexander Kurbatov <sir.alkurbatov@yandex.ru>
#
# Dotfiles is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Dotfiles is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

# Purprose:
# zsh configuration.

# Collect terminal colors to use later (e.g. in PROMPT)
autoload -U colors && colors

# Allow to enter inside directory just using its name
setopt autocd

# Completition by Tab
autoload -Uz compinit
compinit

# When completing from the middle of the word,
# move the cursor to the end of the word
setopt always_to_end

# Spelling correction for commands
setopt correct

# Spelling correction for arguments
setopt correctall

# Don't beep on errors
setopt No_Beep

# History parameters
# It is recommended to keep SAVEHIST == HISTSIZE
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zhistory

# Each line is added to the history as it is executed
setopt INC_APPEND_HISTORY

# Removes copies of lines still in the history list
setopt HIST_IGNORE_ALL_DUPS

# Drop empty strings from history
setopt HIST_REDUCE_BLANKS

# Remove no needed spaces (e.g. trailing)
setopt HIST_IGNORE_SPACE

# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init()
    {
        echoti smkx
    }

    function zle-line-finish()
    {
        echoti rmkx
    }

    zle -N zle-line-init
    zle -N zle-line-finish
fi

# Search in the commands history using arrow keys
if [[ "${terminfo[kcuu1]}" != "" ]]; then
    autoload -U up-line-or-beginning-search
    zle -N up-line-or-beginning-search
    bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi

if [[ "${terminfo[kcud1]}" != "" ]]; then
    autoload -U down-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# allow ctrl-a to move to the beginning of a line
bindkey '^a' beginning-of-line

# allow ctrl-e to move to the end of a line
bindkey '^e' end-of-line

# Mark ssh connection in cmdline prompt
if [ -n "${SSH_CLIENT}" ]; then
    text="ssh"
fi

# Enable prompt update on directory change
setopt prompt_subst

# Print current git branch
git-prompt()
{
    git rev-parse --git-dir > /dev/null 2>&1
    if (( $? )) then
        return
    fi

    echo -n "(`git rev-parse --abbrev-ref HEAD 2>/dev/null`)"

    [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && echo -n "*"
}

# Format prompt
PROMPT='%{$fg[blue]%}%2d%{$reset_color%} %{$fg[red]%}$(git-prompt)%{$reset_color%} $text> '
RPROMPT='%{$fg[blue]%}[%{$fg[green]%}%n%{$fg[blue]%}@%{$fg[green]%}%m%{$fg[blue]%}]%{$reset_color%}'

# Expand PATH
typeset -U path

path=(/opt/local/bin)
path+=(/opt/local/sbin)
path+=(/usr/local/bin)
path+=(/usr/local/sbin)
path+=(/usr/bin)
path+=(/bin)
path+=(/usr/sbin)
path+=(/sbin)
path+=($GOPATH/bin)

# Well-known directories
cdpath=(~/work)
cdpath+=(~/work/src/git.sw.ru/alkurbatov)
cdpath+=(~/work/src/github.com/alkurbatov)

# Colored man pages
man()
{
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;36m") \
    LESS_TERMCAP_md=$(printf "\e[1;36m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# Load aliases
. ~/.zsh_aliases

# Enable autosuggestions
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Have fun
fortune

