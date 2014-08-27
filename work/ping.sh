# This file is a part of Scripts project
#
# Copyright (C) 2013, Alexander Kurbatov <sir.alkurbatov@yandex.ru>
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
# Ping target host for an infinity amount of time but break when
# the ping hangs more than 10 seconds.
# Could be usable for some cases when network is unreachable on target host.

#!/bin/bash

while [ 1 ]; do
    date

    BEGIN=`date +"%s"`

    ping -c 5 kermit.qa.sw.ru

    END=`date +"%s"`

    DIFF=`expr $END - $BEGIN`
    if [ $DIFF -ge 10 ]; then
        echo "STUCK, downtime = $DIFF"
        break
    fi

    sleep 1
    echo
done

