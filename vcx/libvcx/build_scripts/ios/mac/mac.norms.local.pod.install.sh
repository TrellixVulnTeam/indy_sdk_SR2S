#!/bin/bash

source ./shared.functions.sh

START_DIR=$PWD
VCX_SDK=$START_DIR/../../../../..
VCX_SDK=$(abspath "$VCX_SDK")
WORK_DIR=$VCX_SDK/.macosbuild
WORK_DIR=$(abspath "$WORK_DIR")

COMBINED_LIB="libvcxall"
COCOAPOD_BUILD_FOLDER=/Users/norm/forge/work/code/evernym/sdk-evernym/vcx/wrappers/ios/vcx/tmp
PODSERVER_DOCROOT=/Users/norm/forge/work/code/evernym/podserver/public
CONNECTME_IOS=/Users/norm/forge/work/code/evernym/ConnectMe/ios
COCOAPOD_SPEC=/Users/norm/.cocoapods/repos/evernym-1/Specs/vcx/0.0.30/vcx.podspec

cd ${COCOAPOD_BUILD_FOLDER}
COCOAPOD=$(ls *.zip)
if [ -f "${COCOAPOD}" ]; then
    rm ${PODSERVER_DOCROOT}/*.zip
    mv "${COCOAPOD}" ${PODSERVER_DOCROOT}
    sed -i .bak "s/vcx\.${COMBINED_LIB}_[0-9]*\.[0-9]*_universal\.zip/${COCOAPOD}/" ${COCOAPOD_SPEC}
fi

#COCOAPOD=kdkdkdkd
#sed -i .bak "s/vcx\.${COMBINED_LIB}_[0-9]*\.[0-9]*_universal\.zip/${COCOAPOD}/" /Users/norm/.cocoapods/repos/evernym-1/Specs/vcx/0.0.30/vcx.podspec
#cat /Users/norm/.cocoapods/repos/evernym-1/Specs/vcx/0.0.30/vcx.podspec
#cp /Users/norm/.cocoapods/repos/evernym-1/Specs/vcx/0.0.30/vcx.podspec.bak /Users/norm/.cocoapods/repos/evernym-1/Specs/vcx/0.0.30/vcx.podspec

cd ${CONNECTME_IOS}
pod install
