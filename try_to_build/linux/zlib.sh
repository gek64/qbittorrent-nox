#!/bin/sh

install_zlib() {
  zlib="https://github.com/madler/zlib"
  git clone --depth 1 --branch "$(git ls-remote --tags --refs $zlib | tail --lines=1 | cut -d "/" -f 3)" $zlib
  cd "zlib" || exit 1
  ./configure --static
  make -j "$(nproc)"
  make install
  cd ..
}

install_zlib_ng() {
  zlib_ng="https://github.com/zlib-ng/zlib-ng"
  git clone --depth 1 --branch "$(git ls-remote --tags --refs $zlib_ng | tail --lines=1 | cut -d "/" -f 3)" $zlib_ng
  cd "zlib-ng" || exit 1
  ./configure --static --zlib-compat
  make -j "$(nproc)"
  make install
  cd ..
}



