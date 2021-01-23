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
# Just initial gdb configuration.

# Remember history over restarts
set history save
set history filename ~/.gdb_history

handle SIG35 nostop
handle SIG41 nostop
handle SIGPIPE nostop

# Pretty printers
# For qt4 module please check
# https://quickgit.kde.org/?p=kdevelop.git&a=tree&hb=eecf0acbb152ce659412cc5d1a99e652b0159bfb&h=01d12d7d85f93e3149cb210c59c64c4922d951c0&f=debuggers%2Fgdb%2Fprinters
python

import sys
sys.path.insert(0, '/home/alkurbatov/bin/debug')

from qt4 import register_qt4_printers
register_qt4_printers (None)

end

set print pretty 1

# Always print whole strings
set print elements 0

# Specify type of arguments for which the backtrace command
# will display values.
# Set 'all' to print everything (e.g. structures and std::vectors).
# Set 'scalar' to print scalar values (including pointers and C strings).
set print frame-arguments scalar

