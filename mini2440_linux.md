Running Linux on mini2440
=========================
1. Build Linux Kernel
export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabi-
cp config_mini2440_t35 .config
make uImage
