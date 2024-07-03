DIR="$HOME/toolchains/neutron-clang/bin/"
current_dir=$(pwd)
if [ -d "$DIR" ]; then #checking toolchain...
  echo "The toolchain (NeutronClang) is found in ${DIR}"
else
  echo "NeutronClang is not found in ${DIR}. Initializing download sequence..."
  mkdir -p "$HOME/toolchains/neutron-clang"
  cd "$HOME/toolchains/neutron-clang"
  curl -LO "https://raw.githubusercontent.com/Neutron-Toolchains/antman/main/antman"
  bash antman -S=09092023
  cd "$current_dir"
  echo "current dir is $(pwd)"
fi
echo "Toolchain is set. Starting compilation in "
for (( i=5; i>=0; i-- )); do
    echo "$i"
    sleep 1
done
export ARCH=arm64
export PATH="$HOME/toolchains/neutron-clang/bin:$PATH"
make O=out courbet_defconfig
make -j$(nproc --all) O=out CC=clang CROSS_COMPILE=aarch64-linux-gnu- CROSS_COMPILE_ARM32=arm-linux-gnueabi- AR=llvm-ar NM=llvm-nm OBJDUMP=llvm-objdump STRIP=llvm-strip
