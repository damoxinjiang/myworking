wget -c https://sourcery.mentor.com/public/gnu_toolchain/arm-none-eabi/arm-2012.09-63-arm-none-eabi-i686-pc-linux-gnu.tar.bz2
tar jxvf arm-2012.09-63-arm-none-eabi-i686-pc-linux-gnu.tar.bz2

wget -c https://sourcery.mentor.com/public/gnu_toolchain/mips-sde-elf/mips-2012.09-98-mips-sde-elf-i686-pc-linux-gnu.tar.bz2
tar jxvf mips-2012.09-98-mips-sde-elf-i686-pc-linux-gnu.tar.bz2

echo "export PATH=`pwd`/arm-2012.09/bin:`pwd`/mips-2012.09/bin" > env.sh
echo "export RTT_ROOT=`pwd`/.." > env.sh
