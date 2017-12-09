#!/usr/bin/python
#
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
# Calculate websocket server key.


from base64 import b64encode
from hashlib import sha1
import sys

sha1f = sha1()
sha1f.update(sys.argv[1] + "258EAFA5-E914-47DA-95CA-C5AB0DC85B11")
print b64encode(sha1f.digest())

