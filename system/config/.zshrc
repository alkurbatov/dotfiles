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

PROMPT="%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[cyan]%}%1~ %{$reset_color%}$text %#"

# Allow to enter inside directory just using its name.
setopt autocd

# Well-known directories.
cdpath=(~/projects)
cdpath+=(~/projects/vz)

# Completition by Tab.
autoload -Uz compinit
compinit

# History parameters.
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zhistory

# Append rather than overwrite history file.
setopt APPEND_HISTORY

# Each line is added to the history as it is executed.
setopt INC_APPEND_HISTORY

# Share history among other shells.
setopt SHARE_HISTORY

# Not to store a history line if it's the same as the previous one.
setopt HIST_IGNORE_DUPS

# Removes copies of lines still in the history list.
setopt HIST_IGNORE_ALL_DUPS

# Do not save duplicated lines more than once.
setopt HIST_SAVE_NO_DUPS

# Basic OS aliases.
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls --color=auto'
alias lh='ls -lhS --color=auto'
alias grep="grep --color=always"

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

# Terminal keys setup
# Got it from: https://wiki.archlinux.org/index.php/Zsh#Key_bindings

typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}

key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}

key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}

key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}

key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line

[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char

[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-search
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-search

[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char

[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-search
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-search

if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

# Have fun :)
fortune

