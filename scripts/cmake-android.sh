#!/bin/bash

set -e

BUILD_TYPE=${BUILD_TYPE:-Release}
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mkdir -p $DIR/../bin-android
cd $DIR/../bin-android
cmake .. -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -DANDROID_NATIVE_API_LEVEL=17 -DANDROID_TOOLCHAIN_NAME=arm-linux-androideabi-4.9 -DCMAKE_TOOLCHAIN_FILE=$DIR/../cmake/toolchains/android.toolchain.cmake
make $*
make android-build

STATE=$(${ANDROID_SDK}/platform-tools/adb get-state)
if [ "$STATE" == "device" ]; then
	make android-install android-start
fi
