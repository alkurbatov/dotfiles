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

PROMPT="[%{$fg[green]%}%n%{$reset_color%}@%{$fg[yellow]%}%m %{$fg[green]%}%1~ %{$reset_color%}$text] %#"

# Allow to enter inside directory just using its name.
setopt autocd

# Well-known directories.
cdpath=(~/projects)
cdpath+=(~/projects/vz)
cdpath+=(~/sandbox)

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
alias kver='uname -r'
alias urxvt-reload='xrdb -load ~/.Xresources'

# Aliases for work.
alias sign="/usr/sbin/vzlicsign ../z-Build/Debug64/prl_disp_service"
alias svn-log="svn log | less"
alias mutt="HOME=/home/builder/.mutt mutt"

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
autoload zkbd
function zkbd_file() {
	[[ -f ~/.zkbd/${TERM}-${VENDOR}-${OSTYPE} ]] && printf '%s' ~/".zkbd/${TERM}-${VENDOR}-${OSTYPE}" && return 0
	[[ -f ~/.zkbd/${TERM}-${DISPLAY}          ]] && printf '%s' ~/".zkbd/${TERM}-${DISPLAY}"          && return 0
	return 1
}

[[ ! -d ~/.zkbd ]] && mkdir ~/.zkbd
keyfile=$(zkbd_file)
ret=$?

if [[ ${ret} -ne 0 ]]; then
	zkbd
	keyfile=$(zkbd_file)
	ret=$?
fi

if [[ ${ret} -eq 0 ]] ; then
	source "${keyfile}"
else
	printf 'Failed to setup keys using zkbd.\n'
fi
unfunction zkbd_file; unset keyfile ret

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# Have fun :)
fortune

