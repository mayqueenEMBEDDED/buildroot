#!/bin/sh
# post-build.sh for ST7B2
# 2016, Wig Cheng <onlywig@gmail.com>

BOARD_DIR="$(dirname $0)"

# copy the uEnv.txt to the output/images directory
cp board/tailyn/st7b2/uEnv.txt $BINARIES_DIR/uEnv.txt

GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

rm -rf "${GENIMAGE_TMP}"

# copy the NAT relative functions to rootfs
cp -a "${BOARD_DIR}/rootfs-additions/udhcpd_eth1.conf" "${TARGETDIR}/etc/udhcpd_eth1.conf"
cp -a "${BOARD_DIR}/rootfs-additions/eth1_nat.sh" "${TARGETDIR}/usr/bin/eth1_nat.sh"
