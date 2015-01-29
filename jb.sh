#!/bin/bash

echo -e '\0033\0143'

# Specify colors for shell
txtbld=$(tput bold)             # Bold
bldgrn=${txtbld}$(tput setaf 2) # Bold green
bldblu=${txtbld}$(tput setaf 4) # Bold blue
bldcya=${txtbld}$(tput setaf 6) # Bold cyan
normal='tput sgr0'

# Initialize
top_patches="$(cd `dirname $0`; pwd)"
top_build="$(dirname $top_patches)"

cd $top_build
repo="frameworks/av"
echo -e "${bldblu}  Patching $repo .."
cd $top_build/$repo
$normal

  git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_av refs/changes/21/46421/3
  git cherry-pick FETCH_HEAD
cd $top_build

echo -e ""
echo -e ""


cd $top_build
repo="frameworks/native"
echo -e "${bldblu}  Patching $repo .."
cd $top_build/$repo
$normal

git fetch http://github.com/TeamCanjica/android_frameworks_native.git cm-10.1
git cherry-pick c3fb1a48fd3813c52427279813ab16591d1bff6e
git cherry-pick 8026fb81c5b7e41dae9b45f79e4a65ae03dacb32

echo -e ""
echo -e ""

cd $top_build
repo="system/core"
echo -e "${bldblu}  Patching $repo .."
cd $top_build/$repo
$normal

git fetch http://review.cyanogenmod.org/CyanogenMod/android_system_core refs/changes/32/45032/3
  git cherry-pick FETCH_HEAD
cd $top_build

echo -e ""
echo -e ""

cd $top_build
repo="hardware/libhardware_legacy"
echo -e "${bldblu}  Patching $repo .."
cd $top_build/$repo
$normal

git fetch http://github.com/TeamCanjica/android_hardware_libhardware_legacy.git cm-10.1
git cherry-pick -m 1 ecc98ae7c31713492e6bc6252cc44ecf60acc180
echo -e ""
echo -e ""

#cd $top_build
#repo="packages/apps/Phone"
#echo -e "${bldblu}  Patching $repo .."
#cd $top_build/$repo
#$normal

#git fetch http://github.com/TeamCanjica/android_packages_apps_Phone.git cm-10.1
#git cherry-pick 16ba8ac99ed497d5363b43f5c78ed42045704d00
echo -e ""
echo -e ""

echo -e "PATCHING COMPLETED!"
$normal
cd $top_build
