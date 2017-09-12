# This file is a part of Scripts project
#
# Copyright (C) 2017, Alexander Kurbatov <sir.alkurbatov@yandex.ru>
#
# Scripts is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Scripts is distributed in the hope that it will be useful,
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

export OS_IDENTITY_API_VERSION="3"
export OS_AUTH_URL="https://<Keystone IP address>/identity"
export OS_PROJECT_NAME="admin"
export OS_USERNAME="admin"
export OS_PASSWORD="<Keystone admin password>"

