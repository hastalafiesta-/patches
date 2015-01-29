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

git fetch https://github.com/hastalafiesta-/android_frameworks_av.git L5
git cherry-pick 1f9da9659752403b4c90cfbe43994259b8bb660a

echo -e ""
echo -e ""

cd $top_build
repo="frameworks/native"
echo -e "${bldblu}  Patching $repo .."
cd $top_build/$repo
$normal
git fetch https://github.com/hastalafiesta-/frameworks_native.git L5
git cherry-pick 8097aa161d28e4f316f7233649795822c6889b1c

echo -e ""
echo -e ""

cd $top_build
repo="system/core"
echo -e "${bldblu}  Patching $repo .."
cd $top_build/$repo
$normal
git fetch https://github.com/hastalafiesta-/system_core.git L5
git cherry-pick f28a1676c3ec5c5fca79cedbfe1b19ccbf618deb
git cherry-pick bb884988891e4a3101ae896c68750b3bc12d83d7

echo -e ""
echo -e ""

echo -e "PATCHING COMPLETED!"
$normal
cd $top_build
