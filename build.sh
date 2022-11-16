
rm -rf build
mkdir build
cd build
/usr/local/bin/cmake --build . --preset  ../ -G "Unix Makefiles"
make
cd ../../
