#!/bin/bash

rm -rf .repo/local_manifests/

# Init Rom Manifest
repo init -u https://github.com/crdroidandroid/android.git -b 14.0 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Gtajisan/local_manifests -b Crdroid .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync the repositories  
# /opt/crave/resync.sh 
/opt/crave/resynctest.sh
 echo "====== resynctest Done ======="

# Export
export BUILD_USERNAME=Uchia
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Signing
curl -O https://raw.githubusercontent.com/Gtajisan/crDroid-build-signed-script/crdroid/create-signed-env.sh
chmod +x create-signed-env.sh
./create-signed-env.sh

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# lunch
lunch lineage_Mi439_4_19-ap2a-userdebug
make installclean
mka bacon
