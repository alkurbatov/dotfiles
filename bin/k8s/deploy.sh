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
# To deploy the latest build:
# TARGET="virtuozzo-app-ui" ./deploy.sh
#
# To deploy specific build use 'VERSION' variable:
# TARGET="virtuozzo-app-ui" VERSION=62 ./deploy.sh

if [ -z "$TARGET" ]; then
  echo "Required variable TARGET unset"
  exit 1
fi

if [ -z "$VERSION" ]; then
  VERSION=latest
fi

TMP="${TARGET}-deploy.yaml"
cp "${TARGET}-dev.yaml" ${TMP}

sed -i '' "s|{{VERSION}}|${VERSION}|g" ${TMP} > /dev/null
sed -i '' "s|{{REGISTRY}}|10.28.29.130:5000/|g" ${TMP} > /dev/null
sed -i '' "s|{{PULL_POLICY}}|Always|g" ${TMP} > /dev/null

echo ""
echo "==Start ${TARGET}=="
kubectl apply -f ${TMP}

rm ${TMP}
