
mkdir -p build
echo "available presets: "
cmake --list-presets
cmake --preset="x64-debug" -S .
cmake --build build/x64-debug --target tests_namespace_classname

cd build/x64-debug/bin && ./tests_namespace_classname
