
mkdir -p build
echo "available presets: "
cmake --list-presets
cmake --preset="arm-cm4fp-gcc-debug" -S .
cmake --build build/app-arm-cm4fp-debug -S .


