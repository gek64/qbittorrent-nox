#!/bin/bash

# compile
pkg install -y bash cmake pkgconf boost_build boost-all unzip perl5 automake
pkg install -y openssl qt5-core qt5-buildtools qt5-qmake qt5-network qt5-linguisttools qt5-sql
pkg install -y libtorrent-rasterbar

# runtime
pkg install -y openssl qt5-network qt5-sql qt5-xml

# zlib
git clone --depth 1 --recurse-submodules --branch `git ls-remote --tags --refs https://github.com/madler/zlib.git | tail --lines=1 | cut -d "/" -f 3` https://github.com/madler/zlib.git
cd zlib || exit
./configure -std=c11 --static
make -j `sysctl -n hw.ncpu`
make install
cd ..

# openssl
git clone --depth 1 --recurse-submodules --branch "openssl-3.1" https://github.com/openssl/openssl.git
cd openssl || exit
./Configure no-shared no-asm -std=c11 BSD-x86_64
make -j `sysctl -n hw.ncpu`
# install_sw相比于install,不安装文档,只安装库文件和头文件
make install_sw
cd ..

# boost
git clone --depth 1 --recurse-submodules --branch `git ls-remote --tags --refs https://github.com/boostorg/boost.git | tail --lines=1 | cut -d "/" -f 3` https://github.com/boostorg/boost.git
cd boost || exit
./bootstrap.sh
ln -s `pwd`/b2 /usr/local/bin/b2
./b2 install toolset=clang -j `sysctl -n hw.ncpu` variant=release threading=multi link=static runtime-link=static
cd ..

# libtorrent
git clone --depth 1 --recurse-submodules --branch `git ls-remote --tags --refs https://github.com/arvidn/libtorrent.git | tail --lines=1 | cut -d "/" -f 3` https://github.com/arvidn/libtorrent.git
cd libtorrent || exit
b2 install toolset=clang cxxstd=17 variant=release crypto=openssl dht=on -j `sysctl -n hw.ncpu` cxxflags="-I/usr/local/include/" linkflags="-L/usr/local/lib/" link=static runtime-link=static boost-link=static --prefix=./static/
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