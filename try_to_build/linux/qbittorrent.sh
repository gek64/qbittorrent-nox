#!/bin/sh

install_qBittorrent() {
  qBittorrent="https://github.com/qbittorrent/qBittorrent"
  git clone --depth 1 --branch "$(git ls-remote --tags --refs $qBittorrent | tail --lines=1 | cut -d "/" -f 3)" $qBittorrent
  cd qBittorrent || exit
  ./configure --disable-gui --disable-qt-dbus  \
              --with-boost="/root/boost_1_76_0/" \
              QT_QMAKE="/usr/local/Qt-6.2.3/bin/" \
              libtorrent_CFLAGS="-I/usr/local/include" libtorrent_LIBS="-L/usr/local/lib -ldl -l:libtorrent-rasterbar.a" \
              CFLAGS="-static" CPPFLAGS="-static" CXXFLAGS="-std=c++17"  LDFLAGS="--static -static -l:libboost_system.a"
  make -j "$(nproc)"
  make install
  cd ..
}



 LDFLAGS="--static -static $LDFLAGS -l:libboost_system.a" openssl_CFLAGS="-I$include_dir" openssl_LIBS="-L$lib_dir -l:libcrypto.a -l:libssl.a" libtorrent_CFLAGS="-I$include_dir" libtorrent_LIBS="-L$lib_dir -ldl -l:libtorrent.a" zlib_CFLAGS="-I$include_dir" zlib_LIBS="-L$lib_dir -l:libz.a" QT_QMAKE="$install_dir/bin"

CXXFLAGS="-std=c++14" CPPFLAGS="-I/usr/local/include/" LDFLAGS="-Wl,--no-as-needed -L/usr/local/lib/ -lpthread -pthread"