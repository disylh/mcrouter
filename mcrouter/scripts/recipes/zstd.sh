#!/usr/bin/env bash
# Copyright (c) Facebook, Inc. and its affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

source common.sh

if [ ! -d "$PKG_DIR/zstd" ]; then
  cd "$PKG_DIR" || die "cd fail"
  git clone https://github.com/facebook/zstd

  cd "$PKG_DIR/zstd" || die "cd fail"

  # Checkout zstd-1.3.7 release
  git checkout 21cd8a9d95a321f1fe256dc837e388bbc168fdbf
  cmake -DCMAKE_INSTALL_PREFIX="$INSTALL_DIR" build/cmake/
  make $MAKE_ARGS && make install $MAKE_ARGS
fi
