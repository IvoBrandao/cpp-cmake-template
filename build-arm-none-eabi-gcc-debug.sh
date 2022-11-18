
mkdir -p build
echo "available presets: "
cmake --list-presets
cmake --preset="arm-none-eabi-gcc-debug" -S .
cmake --build build/arm-none-eabi-gcc-debug -S .


