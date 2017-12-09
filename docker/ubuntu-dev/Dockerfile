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
# Create Ubuntu Linux dev environment.

FROM ubuntu:latest

WORKDIR /root/work

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install ack-grep autoconf automake cmake curl g++ gcc git libboost-dev libboost-log-dev libboost-system-dev libboost-thread-dev libtool mc pkg-config vim wget
RUN apt-get -y autoremove

# Create LSB standard directories to install newly built libraries.
RUN mkdir -p /opt/local/include /opt/local/lib
