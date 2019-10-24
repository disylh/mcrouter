#!/usr/bin/env bash
# Copyright (c) Facebook, Inc. and its affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

set -ex

[ -n "$1" ] || ( echo "Install dir missing"; exit 1 )

cd "$(dirname "$0")" || ( echo "cd fail"; exit 1 )

./get_and_build_everything_by_make.sh "Makefile_ubuntu-18.04" "$@"
