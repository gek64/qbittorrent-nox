#!/bin/sh

# runtime 
# pkg update && pkg install -y openssl qt5-network qt5-sql qt5-xml

# libtorrent
pkg update
pkg install -y git zip boost_build boost-all
git clone --depth 1 --recurse-submodules --branch `git ls-remote --tags --refs https://github.com/arvidn/libtorrent.git | tail --lines=1 | cut -d "/" -f 3` https://github.com/arvidn/libtorrent.git
cd libtorrent || exit
b2 install toolset=clang cxxstd=17 variant=release crypto=openssl dht=on -j `sysctl -n hw.ncpu` cxxflags="-I/usr/local/include/" linkflags="-L/usr/local/lib/" link=shared runtime-link=shared boost-link=static --prefix=./static/
zip -r ../libtorrent_freebsd.zip static
cd .. || exit

# qbittorrent
pkg update
pkg install -y pkgconf qt5-core qt5-buildtools qt5-qmake qt5-network qt5-linguisttools qt5-sql openssl
git clone --depth 1 --branch `git ls-remote --tags --refs https://github.com/qbittorrent/qBittorrent | tail --lines=1 | cut -d "/" -f 3` https://github.com/qbittorrent/qBittorrent
cd qBittorrent || exit
./configure --disable-gui --disable-qt-dbus CXXFLAGS="-std=c++17" libtorrent_CFLAGS="-I`pwd`/../libtorrent/include/" libtorrent_LIBS="-L`pwd`/../libtorrent/static/lib/ -l:libtorrent-rasterbar.so" --prefix=`pwd`/static/
make install -j `sysctl -n hw.ncpu`
zip -r ../qbittorrent_freebsd.zip static
