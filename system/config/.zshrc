# This file is a part of Scripts project
#
# Copyright (C) 2013, Alexander Kurbatov <sir.alkurbatov@yandex.ru>
#
# Scripts is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Scripts is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

# Purprose:
# zsh configuration.

# Enable colors support.
autoload -U colors && colors

# Set up command prompt for basic user.
if [ -n "$SSH_CLIENT" ]; then text="ssh-session"
fi

PROMPT="[%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[cyan]%}%1~ %{$reset_color%}$text] %#"

# Allow to enter inside directory just using its name.
setopt autocd

# Well-known directories.
cdpath=(~/projects)
cdpath+=(~/projects/vz)

# Completition by Tab.
autoload -Uz compinit
compinit

# History parameters.
HISTSIZE=2000
SAVEHIST=10000
HISTFILE=~/.zhistory

# Each line is added to the history as it is executed.
setopt INC_APPEND_HISTORY

# Share history among other shells.
setopt SHARE_HISTORY

# Removes copies of lines still in the history list.
setopt HIST_IGNORE_ALL_DUPS

# Drop empty strings from history.
setopt HIST_REDUCE_BLANKS

# Remove no needed spaces (like trailing).
setopt HIST_IGNORE_SPACE

# Basic OS aliases.
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls --color=auto'
alias lh='ls -lhS --color=auto'
alias grep="grep --color=always"
alias df='df -h'
alias du='du -h'

# Aliases for work.
alias sign="/usr/sbin/vzlicsign ../z-Build/Debug64/prl_disp_service"
alias svn-log="svn log | more"

# Do win-like behaviour.
alias ipconfig='ifconfig'
alias cls='clear'

# Set up environment.
export EDITOR=vim
export SVN_EDITOR=vim
export QTDIR=/usr/local/lib/qt-shared-4.8.0-amd64

# Expand PATH.
typeset -U path

path=(${QTDIR}/bin)

path+=(/usr/local/bin)
path+=(/usr/local/sbin)
path+=(/usr/bin)
path+=(/usr/sbin)
path+=(/bin)
path+=(/sbin)
path+=(~/bin)

path+=(/opt/ccollab-cmdline)
path+=(/opt/skype-4.2.0.11)

# Terminal keys setup.
bindkey "^[[A" up-line-or-search     # 'Up Arrow'
bindkey "^[[B" down-line-or-search   # 'Down' Arrow
bindkey "^[OH" beginning-of-line     # 'Home'
bindkey "^[OF" end-of-line           # 'End'
bindkey "^[[3~" backward-delete-char # 'Delete'

# Have fun :)
fortune

