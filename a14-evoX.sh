#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/Evolution-XYZ/manifest -b udc --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Gtajisan/local_manifests -b evoX-14 .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# build
/opt/crave/resync.sh 
echo "============="
echo "Sync success"
echo "============="

cd packages/apps/Dialer
git fetch github --unshallow
git fetch https://github.com/ProjectBlaze/packages_apps_Dialer.git 14
git cherry-pick f0052a5
cd ../../..

# Export
export BUILD_USERNAME=FARHAN
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh 
echo "====== Envsetup Done ======="

# Lunch
lunch lunch lineage_Mi439-user || lunch lineage_Mi439_4_19-user
echo "============="

# Make cleaninstall
make installclean
echo "============="

# Build rom
m evolution