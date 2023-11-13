#!/bin/bash
ROOTDIR=$(pwd)
echo $ROOTDIR
if [ ! -e "$ROOTDIR/build" ]; then
    echo "Please run from root / no build dir"
    exit 1
fi

OPENWRT_BRANCH=$1
RELTAG=$2

mkdir -p ./artifact/
mv build/openwrt/bin/targets/rockchip/armv8/*sysupgrade.img* ./artifact/
cd ./artifact/
ls -Ahl
mv openwrt-rockchip-armv8-friendlyarm_nanopi-r4s-ext4-sysupgrade.img.gz OpenWrt-AO-NanoPiR4S-$OPENWRT_BRANCH-$RELTAG-ext4.img.gz
mv openwrt-rockchip-armv8-friendlyarm_nanopi-r4s-squashfs-sysupgrade.img.gz OpenWrt-AO-NanoPiR4S-$OPENWRT_BRANCH-$RELTAG-squashfs.img.gz
gzip -d *.gz && exit 0
gzip --best *.img
ls -Ahl

