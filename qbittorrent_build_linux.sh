#!/bin/sh

# runtime
# apt update && apt install -y libqt5network5 libqt5xml5 libqt5sql5

# libtorrent
apt update
apt install -y build-essential git libboost-tools-dev libboost-dev libboost-system-dev libssl-dev
git clone --depth 1 --recurse-submodules --branch `git ls-remote --tags --refs https://github.com/arvidn/libtorrent.git | tail --lines=1 | cut -d "/" -f 3` https://github.com/arvidn/libtorrent.git
cd libtorrent || exit
b2 install toolset=gcc cxxstd=17 variant=release crypto=openssl dht=on -j `nproc` link=shared runtime-link=shared boost-link=static --prefix=./static/
cp static/lib/libtorrent-rasterbar.so.2.0.5 ..
cd .. || exit

# qbittorrent
apt update
apt install -y pkg-config qtbase5-dev qttools5-dev zlib1g-dev
git clone --depth 1 --branch `git ls-remote --tags --refs https://github.com/qbittorrent/qBittorrent | tail --lines=1 | cut -d "/" -f 3` https://github.com/qbittorrent/qBittorrent
cd qBittorrent || exit
./configure --disable-gui --disable-qt-dbus CXXFLAGS="-std=c++17" libtorrent_CFLAGS="-I`pwd`/../libtorrent/include/" libtorrent_LIBS="-L`pwd`/../libtorrent/static/lib/ -l:libtorrent-rasterbar.so" --prefix=`pwd`/static/
make install -j `nproc`
cp static/bin/qbittorrent-nox ..
cd .. || exit

# list build files
ls libtorrent-rasterbar.so* qbittorrent-nox