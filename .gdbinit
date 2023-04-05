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
# gdb configuration.

# Remember history over restarts.
set history save
set history filename ~/.gdb_history

handle SIG35 nostop
handle SIG41 nostop
handle SIGPIPE nostop

# Don't try to download debuginfo. We will do it manually.
set debuginfod enabled off

set print pretty 1

# Always print whole strings
set print elements 0

# Specify type of arguments for which the backtrace command
# will display values.
# Set 'all' to print everything (e.g. structures and std::vectors).
# Set 'scalar' to print scalar values (including pointers and C strings).
set print frame-arguments scalar
