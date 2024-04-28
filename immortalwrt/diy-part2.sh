#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP 默认IP由1.1修改为0.1
# sed -i 's/192.168.1.1/192.168.0.1/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.0.1/192.168.10.5/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.2.1/192.168.10.5/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.3.1/192.168.10.5/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.4.1/192.168.10.5/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.5.1/192.168.10.5/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.6.1/192.168.10.5/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.7.1/192.168.10.5/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.8.1/192.168.10.5/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.9.1/192.168.10.5/g' package/base-files/files/bin/config_generate

# 最大连接数修改为65535
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

# 修复上移下移按钮翻译
sed -i 's/<%:Up%>/<%:Move up%>/g' feeds/luci/modules/luci-compat/luasrc/view/cbi/tblsection.htm
sed -i 's/<%:Down%>/<%:Move down%>/g' feeds/luci/modules/luci-compat/luasrc/view/cbi/tblsection.htm

# 3-添加Opentomcat主题
git clone https://github.com/TraderWukong/luci-theme-opentomcat.git package/luci-theme-opentomcat

# 4-添加OpenClash插件
sed -i '$a\src-git openclash https://github.com/vernesong/OpenClash' ./feeds.conf.default

# 5-添加PassWall插件
#echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main" >> "feeds.conf.default"
#echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"

