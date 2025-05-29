#!/bin/bash

set -exu

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

pushd "${DIR}"
mkdir -p build
pushd build
# OpenCV must be available in the system or via OpenCV_DIR env variable
cmake -GNinja ../color_names_gen
cmake --build .
NAME=../color_names.yaml.gz
./color_names_gen "${NAME}"
ls -l "${NAME}"
popd
popd