#!/bin/sh
# post-build.sh for ST7B2
# 2016, Wig Cheng <onlywig@gmail.com>

BOARD_DIR="$(dirname $0)"

# copy the uEnv.txt to the output/images directory
cp board/tailyn/st7b2/uEnv.txt $BINARIES_DIR/uEnv.txt

GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

rm -rf "${GENIMAGE_TMP}"

genimage \
  --rootpath "${TARGET_DIR}" \
  --tmppath "${GENIMAGE_TMP}" \
  --inputpath "${BINARIES_DIR}" \
  --outputpath "${BINARIES_DIR}" \
  --config "${GENIMAGE_CFG}"

# copy the NAT relative functions to rootfs
cp ${BOARD_DIR}/rootfs-additions/udhcpd_eth1.conf ${TARGET_DIR}/etc/udhcpd_eth1.conf
cp ${BOARD_DIR}/rootfs-additions/eth1_nat.sh ${TARGET_DIR}/usr/bin/eth1_nat.sh

