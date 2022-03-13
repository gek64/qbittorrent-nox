#!/bin/bash

# compile
pkg install -y bash cmake pkgconf boost_build boost-all unzip perl5 automake
pkg install -y openssl qt5-core qt5-buildtools qt5-qmake qt5-network qt5-linguisttools qt5-sql
pkg install -y libtorrent-rasterbar

# runtime
pkg install -y openssl qt5-network qt5-sql qt5-xml

# zlib
unzip zlib-1.2.11.zip
cd zlib-1.2.11 || exit
./configure -std=c11 --static
make -j `sysctl -n hw.ncpu`
make install
cd ..

# openssl
unzip openssl-OpenSSL_1_1_1m.zip
cd openssl-OpenSSL_1_1_1m || exit
./Configure no-shared no-asm -std=c11 BSD-x86_64
make -j `sysctl -n hw.ncpu`
make install_sw
cd ..

# boost
unzip boost_1_76_0.zip
cd boost_1_76_0 || exit
./bootstrap.sh
./b2 install toolset=clang -j `sysctl -n hw.ncpu` variant=release threading=multi link=static runtime-link=static --prefix="${qbt_install_dir}"
cd ..

# libtorrent
unzip libtorrent-rasterbar-2.0.5.zip
cd libtorrent-rasterbar-2.0.5 || exit
b2 install toolset=clang cxxstd=17 variant=release crypto=openssl dht=on -j `sysctl -n hw.ncpu` cxxflags="-I/usr/local/include/" linkflags="-L/usr/local/lib/" link=static runtime-link=static boost-link=static
b2 install toolset=clang cxxstd=17 variant=release crypto=openssl dht=on -j `sysctl -n hw.ncpu` cxxflags="-I/usr/local/include/" linkflags="-L/usr/local/lib/" link=shared runtime-link=shared boost-link=static
cd ..

# qt
unzip qt_v6.4.0.zip
cd qt5 || exit
./configure -opensource -confirm-license \
  -release -c++std c++17 \
  -nomake examples -nomake tests \
  -no-opengl -no-dbus -no-widgets -no-gui \
  -static -static-runtime -openssl-linked
make -j `sysctl -n hw.ncpu`
make install
cd ..


# qBittorrent
unzip qBittorrent-release-4.4.1.zip
cd qBittorrent-release-4.4.1 || exit
./bootstrap.sh
./configure --disable-gui --disable-qt-dbus \
  libtorrent_CFLAGS="-I/usr/local/include" libtorrent_LIBS="-L/usr/local/lib -ldl -l:libtorrent-rasterbar.so" \
  CXXFLAGS="-std=c++17 -I/usr/local/include/" CPPFLAGS="-I/usr/local/include/" LDFLAGS="-L/usr/local/lib/"
#  CXXFLAGS="-static -std=c++17 -I/usr/local/include/" CPPFLAGS="-static -I/usr/local/include/" LDFLAGS="-static -L/usr/local/lib/"
#  QT_QMAKE="/usr/local/Qt-6.4.0/bin/" \
#  openssl_CFLAGS=="-I/usr/local/include" openssl_LIBS="-static -L/usr/local/lib -lssl -lcrypto" \
make -j `sysctl -n hw.ncpu`
make install