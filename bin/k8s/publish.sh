#!/bin/bash

# This file is a part of Dotfiles project
#
# Copyright (C) 2019, Alexander Kurbatov <sir.alkurbatov@yandex.ru>
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

# Example usage:
# ./publish.sh

for i in virtuozzo-app-ui virtuozzo-storage-ui
do
  DST="${i}.yaml"
  cp ${i}-dev.yaml ${DST}

  sed -i '' "s|{{VERSION}}|:latest|g" ${DST} > /dev/null
  sed -i '' "s|{{REGISTRY}}||g" ${DST} > /dev/null
  sed -i '' "s|{{PULL_POLICY}}|IfNotPresent|g" ${DST} > /dev/null
done
