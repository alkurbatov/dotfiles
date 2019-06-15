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
# To delete from Virtuozzo namespace:
# TARGET="virtuozzo-app-ui" ./tierdown.sh
#
# To delete from specific namespace:
# TARGET="virtuozzo-app-ui" NAMESPACE="kube-system" ./tierdown.sh

if [ -z "$TARGET" ]; then
  echo "Required variable TARGET unset"
  exit 1
fi

if [ -z "$NAMESPACE" ]; then
  NAMESPACE=virtuozzo
fi

kubectl delete deployment ${TARGET} -n ${NAMESPACE}
kubectl delete serviceaccount ${TARGET} -n ${NAMESPACE}
kubectl delete service ${TARGET} -n ${NAMESPACE}
kubectl delete secret ${TARGET} -n ${NAMESPACE}
