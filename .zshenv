# This file is a part of Dotfiles project
#
# Copyright (C) 2013-2023, Alexander Kurbatov <sir.alkurbatov@yandex.ru>
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
export LC_ALL=ru_RU.UTF-8

# Github parameters
export GITHUB_USER=alkurbatov

# Go stuff
export GOPATH=$HOME/work
export GOBIN=$GOPATH/bin

# Preferred editor for local and remote sessions
export EDITOR="emacs -nw"
export VISUAL=emacs
export SVN_EDITOR="emacs -nw"

if [[ "$OSTYPE" = darwin* ]]; then
    # X11 display for forwarding
    export DISPLAY=:0

    HOMEBREW_PREFIX=/usr/local
    if [[ $(/usr/bin/uname -m) == 'arm64' ]]; then
        HOMEBREW_PREFIX=/opt/homebrew
    fi

    # Forse usage of OpenSSL from Homebrew.
    # You may also need to add -DOPENSSL_ROOT_DIR=$(brew --prefix)/opt/openssl to cmake
    # to properly find the library and headers.
    export LDFLAGS="-L$HOMEBREW_PREFIX/opt/openssl/lib"
    export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/openssl/include"
    export CFLAGS="-I$(xcrun --show-sdk-path)/usr/include"
    export PKG_CONFIG_PATH="$HOMEBREW_PREFIX/opt/openssl/lib/pkgconfig"

    # Disables statistics that brew collects
    export HOMEBREW_NO_ANALYTICS=1
fi

if [[ "$OSTYPE" = linux* ]]; then
    export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
fi

# Tell GPG which tty it should use
export GPG_TTY=$(tty)

# Suppress annoying 'use docker scan' suggestion
export DOCKER_SCAN_SUGGEST=false

# Show full log during docker build
export BUILDKIT_PROGRESS=plain

# Enable true color support in terminal for proper colors in Emacs
export COLORTERM=truecolor

# Always store dependencies in local environments
export POETRY_VIRTUALENVS_IN_PROJECT=true
