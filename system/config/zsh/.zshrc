# This file is a part of Stash project
#
# Copyright (C) 2018, Alexander Kurbatov <sir.alkurbatov@yandex.ru>
#
# Stash is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Stash is distributed in the hope that it will be useful,
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

# Mark ssh connection in cmdline prompt
if [ -n "$SSH_CLIENT" ]; then
    text="ssh"
fi

# Format prompt
PROMPT="%{$fg[blue]%}[%{$fg[green]%}%n%{$fg[blue]%}@%{$fg[green]%}%m%{$fg[blue]%}] %2d%{$reset_color%} $text> "

# Expand PATH
typeset -U path

path+=(/opt/local/bin)
path+=(/usr/local/bin)
path+=(/usr/bin)
path+=(/bin)
path+=(/opt/local/sbin)
path+=(/usr/local/sbin)
path+=(/usr/sbin)
path+=(/sbin)
path+=($GOPATH/bin)

# Well-known directories
cdpath=(~/work)
cdpath+=(~/work/src/git.sw.ru/alkurbatov)
cdpath+=(~/work/src/github.com/alkurbatov)

# Load aliases
. ~/.zsh_aliases

# Have fun
fortune

