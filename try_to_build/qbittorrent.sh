# LINUX
# 基础工具
apt install -y pkg-config
# QT
apt install -y qtbase5-dev qttools5-dev
# 依赖库
apt install -y zlib1g-dev
## 预编译libtorrent库
apt install -y libtorrent-rasterbar-dev
# 源码
## git ls-remote --tags --refs https://github.com/qbittorrent/qBittorrent | tail --lines=1 | cut -d "/" -f 3
## git clone --depth 1 --branch $tag_name https://github.com/qbittorrent/qBittorrent
git clone --depth 1 --branch `git ls-remote --tags --refs https://github.com/qbittorrent/qBittorrent | tail --lines=1 | cut -d "/" -f 3` https://github.com/qbittorrent/qBittorrent

# 编译
cd qBittorrent
## 动态编译
./configure --disable-gui --disable-qt-dbus CXXFLAGS="-std=c++17" QT_QMAKE="/usr/local/Qt-6.4.0/bin/" libtorrent_CFLAGS="-I/usr/local/include" libtorrent_LIBS="-L/usr/local/lib -ldl -l:libtorrent-rasterbar.a"
## 静态编译
./configure --disable-gui --disable-qt-dbus CXXFLAGS="-std=c++17" LDFLAGS="-static" QT_QMAKE="/usr/local/Qt-6.4.0/bin/" --prefix="`pwd`/static/"
make install -j `nproc`
## 打包
zip -r qbittorrent_linux.zip static




./configure CXXFLAGS="-std=c++17" \
            --disable-gui --disable-qt-dbus  \
            --with-boost="/root/boost_1_78_0/" \
            QT_QMAKE="/usr/local/Qt-6.4.0/bin/" \
            libtorrent_CFLAGS="-I/usr/local/include" libtorrent_LIBS="-L/usr/local/lib -l:libtorrent-rasterbar.a" \
            CPPFLAGS="-static" CXXFLAGS="-static" CFLAGS="-static" LDFLAGS="-static"

make -j `nproc`
make install







# FREEBSD
# 基础工具
pkg install -y pkgconf
# QT
pkg install -y qt5-core qt5-buildtools qt5-qmake qt5-network qt5-linguisttools qt5-sql
# 依赖库
pkg install -y openssl
## 预编译libtorrent库
pkg install -y libtorrent-rasterbar
# 源码
## git ls-remote --tags --refs https://github.com/qbittorrent/qBittorrent | tail --lines=1 | cut -d "/" -f 3
## git clone --depth 1 --branch $tag_name https://github.com/qbittorrent/qBittorrent
git clone --depth 1 --branch `git ls-remote --tags --refs https://github.com/qbittorrent/qBittorrent | tail --lines=1 | cut -d "/" -f 3` https://github.com/qbittorrent/qBittorrent

# 编译
cd qBittorrent
## 需要导入libtorrent的include文件夹,-I代表导入后面跟随需要导入头文件的路径 libtorrent_CFLAGS="-I../libtorrent/include/"
## 需要链接libtorrent的编译后存放的.so或者.a文件的文件夹,-L代表链接后面跟随需要链接到的库路径,-l:代表指定需要链接到的某个库文件 libtorrent_LIBS="-L../libtorrent/static/lib/ -l:libtorrent-rasterbar.so"
./configure --disable-gui --disable-qt-dbus CXXFLAGS="-std=c++17" libtorrent_CFLAGS="-I`pwd`/../libtorrent/include/" libtorrent_LIBS="-L`pwd`/../libtorrent/static/lib/ -l:libtorrent-rasterbar.so" --prefix=`pwd`/static/
## 静态编译
./configure --disable-gui --disable-qt-dbus CXXFLAGS="-std=c++17" libtorrent_CFLAGS="-I`pwd`/../libtorrent/include/" libtorrent_LIBS="-static -L`pwd`/../libtorrent/static/lib/ -l:libtorrent-rasterbar.a" QT_QMAKE="/usr/local/Qt-6.3.0/bin/"

make install -j `sysctl -n hw.ncpu`
## 打包
zip -r qbittorrent_freebsd.zip static

# 运行环境
pkg install -y openssl qt5-network qt5-xml qt5-sql
## 如果libtorrent-rasterbar没有硬链接boost-libs
pkg install -y boost-libs


./configure --disable-gui --disable-qt-dbus \
  QT_QMAKE="/usr/local/Qt-6.4.0/bin/" \
  libtorrent_CFLAGS="-I/usr/local/include" libtorrent_LIBS="-L/usr/local/lib" \
  openssl_CFLAGS=="-I/usr/local/include" openssl_LIBS="-L/usr/local/lib"