# qbittorrent-nox-shared
- `libtorrent` shared build
- `qbittorrent-nox` shared build

## Usage
### FreeBSD
```sh
# get files
fetch https://github.com/gek64/qbittorrent-nox-shared/releases/download/v4.4.1/libtorrent_freebsd_v2.0.5.zip
fetch https://github.com/gek64/qbittorrent-nox-shared/releases/download/v4.4.1/qbittorrent_freebsd_v4.4.1.zip

# unzip
unzip libtorrent_freebsd_v2.0.5.zip
unzip qbittorrent_freebsd_v4.4.1.zip

# copy to folder
cp static/lib/libtorrent-rasterbar.so.2.0.5 /usr/local/lib/
cp static/bin/qbittorrent-nox /usr/local/bin/

# install dependencies 
pkg update && pkg install -y openssl qt5-network qt5-xml qt5-sql

# test run
chmod +x /usr/local/bin/qbittorrent-nox
/usr/local/bin/qbittorrent-nox -v
```

### Linux(for example ubuntu/debian)
```sh
# get files
wget https://github.com/gek64/qbittorrent-nox-shared/releases/download/v4.4.1/libtorrent_linux_v2.0.5.zip
wget https://github.com/gek64/qbittorrent-nox-shared/releases/download/v4.4.1/qbittorrent_linux_v4.4.1.zip

# unzip
unzip libtorrent_linux_v2.0.5.zip
unzip qbittorrent_linux_v4.4.1.zip

# copy to folder
## ubuntu
cp static/lib/libtorrent-rasterbar.so.2.0.5 /lib/
## debian
cp static/lib/libtorrent-rasterbar.so.2.0.5 /usr/lib/
## copy bin
cp static/bin/qbittorrent-nox /usr/local/bin/

# install dependencies 
apt update && apt install -y libqt5network5 libqt5xml5 libqt5sql5

# test run
chmod +x /usr/local/bin/qbittorrent-nox
/usr/local/bin/qbittorrent-nox -v
```

## Compile
### How to compile if prebuilt binaries can not run
### FreeBSD
```sh
fetch https://github.com/gek64/qbittorrent-nox-shared/raw/main/qbittorrent_build_freebsd.sh
chmod +x qbittorrent_build_freebsd.sh
./qbittorrent_build_freebsd.sh
ls qbittorrent*.zip libtorrent*.zip
```

### Linux(for example ubuntu/debian)
```sh
wget https://github.com/gek64/qbittorrent-nox-shared/raw/main/qbittorrent_build_linux.sh
chmod +x qbittorrent_build_linux.sh
./qbittorrent_build_linux.sh
ls qbittorrent*.zip libtorrent*.zip
```


## QA


## License
- **GNU Lesser General Public License v2.1**
- See `LICENSE` for details
