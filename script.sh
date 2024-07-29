#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init --depth=1 -u https://github.com/DroidX-UI/manifest.git -b 14_v3 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/ infiniteluck777/local_manifests_clo -b Matrixx-14 .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# build
/opt/crave/resync.sh 
echo "============="
echo "Sync success"
echo "============="

# Export
export BUILD_USERNAME=infiniteluck777
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch lunch droidx_Mi439_19-ap2a-userdebug 
make installclean
mka bacon
