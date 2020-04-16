#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
rm -rf ./tmp
sed -i 's/\"#src-git\"/\"src-git\"/g' ./feeds.conf.default
# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
# Change Flash to 32M
sed -i 's/0xf60000/0x1fb0000/g' target/linux/ramips/dts/mt7621_phicomm_k2p.dts
# Add AdGuard Home luci app
git clone https://github.com/rufengsuixing/luci-app-adguardhome package/lean/luci-app-adguardhome/
# Update feeds
./scripts/feeds clean
./scripts/feeds update -a
./scripts/feeds install -a
