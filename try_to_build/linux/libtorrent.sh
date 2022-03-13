#!/bin/sh

install_boost() {
  wget https://boostorg.jfrog.io/artifactory/main/release/1.78.0/source/boost_1_78_0.zip
  unzip boost_1_78_0.zip
}

install_libtorrent() {
  libtorrent="https://github.com/arvidn/libtorrent"
  git clone --depth 1 --recurse-submodules $libtorrent
  cd libtorrent || exit
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
}
