# This file is a part of Dotfiles project
#
# Copyright (C) 2013-2021, Alexander Kurbatov <sir.alkurbatov@yandex.ru>
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
# Set global environment variables for zsh.

# Set up locale (requred by some tools)
export LANG=ru_RU.UTF-8
export LC_CTYPE=ru_RU.UTF-8

# Github parameters
export GITHUB_USER=alkurbatov

# Go stuff
export GOPATH=$HOME/work

# Preferred editor for local and remote sessions
export EDITOR="emacs -nw"
export VISUAL=emacs
export SVN_EDITOR="emacs -nw"

if [[ "$OSTYPE" = darwin* ]]; then
    # X11 display for forwarding
    export DISPLAY=:0
fi

if [[ "$OSTYPE" = linux* ]]; then
    export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")

    # Tell GPG which tty it should use
    export GPG_TTY=$(tty)
fi

# Suppress annoying 'use docker scan' suggestion
export DOCKER_SCAN_SUGGEST=false
