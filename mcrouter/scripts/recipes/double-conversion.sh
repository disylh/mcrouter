#!/usr/bin/env bash
# Copyright (c) Facebook, Inc. and its affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

source common.sh

if [ ! -d /usr/include/double-conversion ]; then
  if [ ! -d "$PKG_DIR/double-conversion" ]; then
    cd "$PKG_DIR" || die "cd fail"
    git clone https://github.com/google/double-conversion.git
  fi
  cd "$PKG_DIR/double-conversion" || die "cd fail"

  # Workaround double-conversion CMakeLists.txt changes that
  # are incompatible with cmake-2.8
  git checkout ea970f69edacf66bd3cba2892be284b76e9599b0
  cmake . -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX="$INSTALL_DIR"
  make $MAKE_ARGS && make install $MAKE_ARGS

  export LDFLAGS="-L$INSTALL_DIR/lib -ldl $LDFLAGS"
  export CPPFLAGS="-I$INSTALL_DIR/include $CPPFLAGS"
fi
