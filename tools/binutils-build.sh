#!/bin/bash

source $REPO_HOME/tools/share.sh

set -e
set -x

export RISCV=$INSTALL_DIR

mkdir -p $INSTALL_DIR

# ------ Binutils ----------------------------------------------------------

cd   $DIR_BINUTILS_BUILD

make -j$(nproc)
make install

