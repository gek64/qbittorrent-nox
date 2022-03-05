# qbittorrent-nox-shared
- `libtorrent` shared build
- `qbittorrent-nox` shared build

## Usage
### Linux(for example ubuntu/debian)
```sh
# get files
wget https://github.com/gek64/qbittorrent-nox-shared/releases/download/v4.4.1/libtorrent_linux.zip
wget https://github.com/gek64/qbittorrent-nox-shared/releases/download/v4.4.1/qbittorrent_linux.zip

# unzip
unzip libtorrent_linux.zip
unzip qbittorrent_linux.zip

# copy to folder
cp static/lib/libtorrent-rasterbar.so.2.0.5 /usr/lib/
cp static/bin/qbittorrent-nox /usr/local/bin/

# install dependencies 
apt update && apt install -y libqt5network5 libqt5xml5 libqt5sql5

# test run
chmod +x /usr/local/bin/qbittorrent-nox
/usr/local/bin/qbittorrent-nox -v
```

### FreeBSD
```sh
# get files
fetch https://github.com/gek64/qbittorrent-nox-shared/releases/download/v4.4.1/libtorrent_freebsd.zip
fetch https://github.com/gek64/qbittorrent-nox-shared/releases/download/v4.4.1/qbittorrent_freebsd.zip

# unzip
unzip libtorrent_freebsd.zip
unzip qbittorrent_freebsd.zip

# copy to folder
cp static/lib/libtorrent-rasterbar.so.2.0.5 /usr/local/lib/
cp static/bin/qbittorrent-nox /usr/local/bin/

# install dependencies 
pkg update && pkg install -y openssl qt5-network qt5-xml qt5-sql

# test run
chmod +x /usr/local/bin/qbittorrent-nox
/usr/local/bin/qbittorrent-nox -v
```

## Compile
### How to compile if prebuilt binaries can not run
### Linux(for example ubuntu/debian)
```sh
wget https://github.com/gek64/qbittorrent-nox-shared/raw/main/qbittorrent_build_linux.sh
chmod +x qbittorrent_build_linux.sh
./qbittorrent_build_linux.sh
ls qbittorrent*.zip libtorrent*.zip
```
### FreeBSD
```sh
fetch https://github.com/gek64/qbittorrent-nox-shared/raw/main/qbittorrent_build_freebsd.sh
chmod +x qbittorrent_build_freebsd.sh
./qbittorrent_build_freebsd.sh
ls qbittorrent*.zip libtorrent*.zip
```


## QA


## License
- **GNU Lesser General Public License v2.1**
- See `LICENSE` for details
