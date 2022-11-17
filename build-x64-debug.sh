
rm -rf build
mkdir -p build
echo "available presets: "
cmake --list-presets
cmake --preset="x64-debug" -S .
cmake --build build/x64-debug

