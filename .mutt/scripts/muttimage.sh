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
# Show images inside terminal

#!/bin/bash

#### Determine size of Terminal
height=`stty  size | awk 'BEGIN {FS = " "} {print $1;}'`
width=`stty  size | awk 'BEGIN {FS = " "} {print $2;}'`

### Display Image / offset with mutt bar
echo -e "2;3;\n0;1;210;20;$((width*7));$((height*21));0;0;0;0;$1\n4;\n3;" |  /usr/libexec/w3m/w3mimgdisplay &

