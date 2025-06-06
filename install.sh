#!/usr/bin/env bash
#
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

# Purpose:
# Install common configuration files to the local or remote machine.
# Regarding usage see the README.md.

set -euxo pipefail

CONFIGS=(
    .hadolint.yaml
    .tmux.conf
    .zsh_aliases
    .zsh_tools
    .zsh_vterm
    .zshenv
    .zshrc
)

if [ $# -eq 0 ]; then
    for i in "${CONFIGS[@]}"; do
        cp -rvf "${i}" ~/
    done

    cp -rvf bin ~/work/

    exit 0
fi

for i in "${CONFIGS[@]}"; do
    scp -r "${i}" $1:~/
done

scp -r bin $1:~/work/
