#!/bin/bash

source $REPO_HOME/tools/common.sh

set -e
set -x

# ------ Binutils ----------------------------------------------------------

cd           $DIR_SPIKE
git apply    $PATCH_SPIKE
git add      --all

