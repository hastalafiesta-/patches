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

git fetch https://github.com/hastalafiesta-/android_frameworks_av.git slimsaber_kk
git cherry-pick 745a6107323b27b95d77347ee89cb9ec8067ef4d
git cherry-pick fd5dfde2375e1d559787e1816f54e83da6f536ea
git cherry-pick 7ab49fa6e622133b9bbbd8dd36e9cea3038d0b95
git cherry-pick 6413964488a3cdf12143db336a9e1fcb18e93f1f
git cherry-pick f68dbfc89f2b38dc18de4f6d67f8807a15514086
git cherry-pick 64909d5c2ed66d010354a7fa1acc356bfb6e5720

echo -e ""
echo -e ""


cd $top_build
repo="frameworks/native"
echo -e "${bldblu}  Patching $repo .."
cd $top_build/$repo
$normal
git fetch https://github.com/hastalafiesta-/android_frameworks_native.git slimsaber_kk
git cherry-pick 595bbbc448b57adc33423fc903cd1c7124219b2b

echo -e ""
echo -e ""

cd $top_build
repo="frameworks/base"
echo -e "${bldblu}  Patching $repo .."
cd $top_build/$repo
$normal
git fetch https://github.com/hastalafiesta-/frameworks_base.git kk4.4
git cherry-pick 9e92647bae9ad3bc1f181ce3480de15685165de8
git fetch https://github.com/teamp8/frameworks_base_slimkat.git kk4.4
git cherry-pick fec6e1bdfba31076112e00a9d0173ddd0195d637

echo -e ""
echo -e ""

cd $top_build
repo="art"
echo -e "${bldblu}  Patching $repo .."
cd $top_build/$repo
$normal
git fetch https://github.com/hastalafiesta-/android_art.git kk4.4
git cherry-pick 5a70dc7068e53a684154dcf7915c263529de3c42

cd $top_build
repo="system/core"
echo -e "${bldblu}  Patching $repo .."
cd $top_build/$repo
$normal
git fetch https://github.com/TeamCanjica/android_system_core.git cm-11.0
git cherry-pick 8aa242d1827875506ce3339d2df3e0fed6f89e42

echo -e ""
echo -e ""

cd $top_build
repo="hardware/libhardware_legacy"
echo -e "${bldblu}  Patching $repo .."
cd $top_build/$repo
$normal
git fetch https://github.com/TeamCanjica/android_hardware_libhardware_legacy.git cm-11.0
git cherry-pick 0a098d35815ed9e6a819c7ebff1406708a042e31

echo -e ""
echo -e ""

echo -e "PATCHING COMPLETED!"
$normal
cd $top_build
