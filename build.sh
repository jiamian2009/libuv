mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=$2  -DCMAKE_INSTALL_PREFIX=install ../libuv
make && make install