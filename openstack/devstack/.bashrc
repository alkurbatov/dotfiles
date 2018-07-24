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
# .bashrc for the 'stack' user.

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export EDITOR=vim

export OS_IDENTITY_API_VERSION="3"
export OS_AUTH_URL="https://<Keystone IP address>/identity"
export OS_PROJECT_NAME="admin"
export OS_USERNAME="admin"
export OS_PASSWORD="<Keystone admin password>"

# Git aliases
alias gc='git commit -v'
alias gca='git commit -v --amend'
alias gcan='git commit --amend --no-edit'
alias gcad='git commit --amend --date="$(date -R)" --no-edit'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git pull'
alias glg='git log --stat'
alias gp='git push'
alias gpf='git push --force'
alias gr='git rebase -i'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gs='git status -sb'
alias gst='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show -p'

