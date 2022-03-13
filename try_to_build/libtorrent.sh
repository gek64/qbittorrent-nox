# LINUX
# 基础工具
apt install -y build-essential git zip 7zip
# 依赖库
apt install -y libboost-tools-dev libboost-dev libboost-system-dev libssl-dev
# 源码
## git ls-remote --tags --refs https://github.com/arvidn/libtorrent.git | tail --lines=1 | cut -d "/" -f 3
## git clone --depth 1 --recurse-submodules --branch $tag_name https://github.com/arvidn/libtorrent.git 
git clone --depth 1 --recurse-submodules --branch `git ls-remote --tags --refs https://github.com/arvidn/libtorrent.git | tail --lines=1 | cut -d "/" -f 3` https://github.com/arvidn/libtorrent.git

# 编译
cd libtorrent
## 动态编译
b2 install toolset=gcc cxxstd=17 variant=release crypto=openssl dht=on -j `nproc` link=shared runtime-link=shared boost-link=static
## 静态编译
b2 install toolset=gcc cxxstd=17 variant=release crypto=openssl dht=on -j `nproc` link=static runtime-link=static boost-link=static




git clone --recurse-submodules https://github.com/arvidn/libtorrent.git

## cmake 编译
cmake -S . -B build-libtorrent \
      -D CMAKE_PREFIX_PATH="../boost_1_78_0" \
      -D CMAKE_BUILD_TYPE=release \
      -D CMAKE_CXX_STANDARD=17 \
      -D BUILD_SHARED_LIBS=off \
      -D static_runtime=on

# BUG FIXED static assertion failed: Handler buffer not large enough, please increase it
- https://github.com/arvidn/libtorrent/issues/6405
 
cmake --build build-libtorrent -j `nproc`

cmake --install build-libtorrent







# FREEBSD
# 基础工具
pkg install -y git zip
# 编译工具
pkg install -y boost_build
# 依赖库
pkg install -y boost-all
# 源码
## git ls-remote --tags --refs https://github.com/arvidn/libtorrent.git | tail --lines=1 | cut -d "/" -f 3
## git clone --depth 1 --recurse-submodules --branch $tag_name https://github.com/arvidn/libtorrent.git 
git clone --depth 1 --recurse-submodules --branch `git ls-remote --tags --refs https://github.com/arvidn/libtorrent.git | tail --lines=1 | cut -d "/" -f 3` https://github.com/arvidn/libtorrent.git

# 编译
cd libtorrent
## 动态编译(clang 需要指定cxxflags 和linkflags)
### cxxflags编译时需要包含的.h或.hpp文件存放位置,linkflags编译完成后需要链接到外部库的.so或.a文件存放位置boost-link如果静态链接则无需再安装运行库
### -I 表示include -L表示link -l:表示指定某一个库文件,这里需要包含与链接的是boost的头文件及库文件,因为上一步安装的时候已经安装进了系统的相应文件夹中
### cflags cxxflags linkflags 均存在,可以查看https://libtorrent.org/building.html
### boost-link 如静态链接,则无需再安装boost-libs
b2 install toolset=clang cxxstd=17 variant=release crypto=openssl dht=on -j `sysctl -n hw.ncpu` cxxflags="-I/usr/local/include/" linkflags="-L/usr/local/lib/" link=shared runtime-link=shared boost-link=static --prefix=./static/
## 静态编译
b2 install toolset=clang cxxstd=17 variant=release crypto=openssl dht=on -j `sysctl -n hw.ncpu` cxxflags="-I/usr/local/include/" linkflags="-L/usr/local/lib/" link=static runtime-link=static boost-link=static --prefix=./static/
