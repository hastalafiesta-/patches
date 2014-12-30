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

git fetch https://github.com/hastalafiesta-/android_frameworks_av.git cm-11.0
git cherry-pick 1797c2d25964326f1602810753b665c6bd401c28
git cherry-pick 52d643771beffbffc53154120d08c0fba96f4045
git cherry-pick 595a791c9b7ad3b8072956a53830dc620320d4be

echo -e ""
echo -e ""

cd $top_build
repo="frameworks/native"
echo -e "${bldblu}  Patching $repo .."
cd $top_build/$repo
$normal
git fetch https://github.com/TeamCanjica/android_frameworks_native.git cm-11.0
git cherry-pick f5a8698ce9a3568cea95c03302deb068eff765bd

echo -e ""
echo -e ""

cd $top_build
repo="frameworks/base"
echo -e "${bldblu}  Patching $repo .."
cd $top_build/$repo
$normal
git fetch https://github.com/TeamCanjica/android_frameworks_base.git cm-11.0
git cherry-pick de30387b3c32c2a9cf653590c8454bd002bf0dd1

echo -e ""
echo -e ""

cd $top_build
repo="system/core"
echo -e "${bldblu}  Patching $repo .."
cd $top_build/$repo
$normal
git fetch https://github.com/TeamCanjica/android_system_core.git cm-11.0
git cherry-pick 8aa242d1827875506ce3339d2df3e0fed6f89e42
git cherry-pick 347658ad1b53234b52d32d42fba2a72878b883c5

echo -e ""
echo -e ""

cd $top_build
repo="packages/apps/Settings"
echo -e "${bldblu}  Patching $repo .."
cd $top_build/$repo
$normal
git fetch https://github.com/TeamCanjica/android_packages_apps_Settings.git cm-11.0
git cherry-pick 76ce30bca51cb4392d7fb4df97ea8eed27f03c2d

echo -e ""
echo -e ""

cd $top_build
repo="packages/services/Telephony"
echo -e "${bldblu}  Patching $repo .."
cd $top_build/$repo
$normal
git fetch https://github.com/TeamCanjica/android_packages_services_Telephony.git cm-11.0
git cherry-pick fdf281fdabe5e7517eb96f2faf159bbcc74ae4a6

cd $top_build
repo="build"
echo -e "${bldblu}  Patching $repo .."
cd $top_build/$repo
$normal
git fetch https://github.com/hastalafiesta-/android_build.git cm-11.0
git cherry-pick 03dd3587649ae6e8bd463bc2099127d8578835e7

echo -e ""
echo -e ""

cd $top_build
repo="system/vold"
echo -e "${bldblu}  Patching $repo .."
cd $top_build/$repo
$normal
git fetch https://github.com/t4n017/android_system_vold.git kitkat
git cherry-pick 61b66e643a1577c12abba880c4cf020d13cce741

echo -e "PATCHING COMPLETED!"
$normal
cd $top_build
