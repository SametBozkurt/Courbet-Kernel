export ARCH=arm64
export PATH="$HOME/toolchains/neutron-clang/bin:$PATH"
make O=out courbet_defconfig
make -j$(nproc --all) O=out CC=clang CROSS_COMPILE=aarch64-linux-gnu- CROSS_COMPILE_ARM32=arm-linux-gnueabi- AR=llvm-ar NM=llvm-nm OBJDUMP=llvm-objdump STRIP=llvm-strip
