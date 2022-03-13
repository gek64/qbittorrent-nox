#!/bin/sh

export INSTALL_PATH="/usr/local"

tar -xf glibc-2.35.tar.gz
mkdir -p glibc_build && cd glibc_build || exit
../glibc-2.35/configure --enable-static-nss --disable-nscd
make -j "$(nproc)"
make install
cd ..

unzip zlib-ng-2.0.6.zip
cd zlib-ng-2.0.6 || exit
./configure --static --zlib-compat
make -j "$(nproc)"
make install
cd ..

unzip openssl-OpenSSL_1_1_1m.zip
cd openssl-OpenSSL_1_1_1m || exit
./Configure threads no-shared no-dso no-comp \
  CXXFLAGS="-std=c++17" \
  linux-generic64
make -j "$(nproc)"
make install_sw
cd ..

unzip boost_1_76_0.zip
cd boost_1_76_0 || exit
./bootstrap.sh
./b2 install toolset=gcc -j "$(sysctl -n hw.ncpu)" variant=release threading=multi link=static runtime-link=static
cd ..

unzip qt_v6.2.3.zip
cd qt5 || exit
./configure -opensource -confirm-license -c++std c++17 \
  -nomake examples -nomake tests \
  -no-opengl -no-dbus -no-widgets -no-gui \
  -static -openssl-linked
make install -j "$(nproc)"
cd ..

unzip libtorrent-rasterbar-2.0.5.zip
cd libtorrent-rasterbar-2.0.5 || exit
cmake -S . -B build-libtorrent \
  -D CMAKE_PREFIX_PATH="../boost_1_76_0" \
  -D CMAKE_BUILD_TYPE=release \
  -D CMAKE_CXX_STANDARD=17 \
  -D CMAKE_CXX_FLAGS="-static" \
  -D BUILD_SHARED_LIBS=off \
  -D static_runtime=on
cmake --build build-libtorrent -j "$(nproc)"
cmake --install build-libtorrent
cd ..

unzip qBittorrent-release-4.4.1.zip
cd qBittorrent-release-4.4.1 || exit
./configure --disable-gui --disable-qt-dbus \
  --with-boost="/root/boost_1_76_0/" \
  QT_QMAKE="/usr/local/Qt-6.2.3/bin/" \
  libtorrent_CFLAGS="-I/usr/local/include" libtorrent_LIBS="-L/usr/local/lib -ldl -l:libtorrent-rasterbar.a" \
  CXXFLAGS="-std=c++17" LDFLAGS="-static -l:libboost_system.a"
make -j "$(nproc)"
make install

#CXXFLAGS="-std=c++17" CPPFLAGS="-I/root/builder/include" LDFLAGS="-Wl,--no-as-needed -L/root/builder/lib -lpthread -pthread"
#export PATH="/root/builder/bin:$HOME/bin${PATH:+:${PATH}}"
#export LD_LIBRARY_PATH="-L/root/builder/lib"
#export PKG_CONFIG_PATH="-L/root/builder/lib/pkgconfig"


./configure --disable-gui --disable-qt-dbus \
  libtorrent_LIBS="-l:libtorrent-rasterbar.a" \
  LDFLAGS="-static -l:libboost_system.a" \
  CXXFLAGS="-std=c++17" CPPFLAGS="-I/root/qbt-build/include" LDFLAGS="-L/root/qbt-build/lib"
