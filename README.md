## Version
### libtorrent
- `v2.0.5`
### qbittorrent-nox
- `v4.4.1`

## Install
```sh
# get files
fetch https://github.com/gek64/qbittorrent-nox-freebsd/releases/download/v4.4.1/libtorrent-rasterbar.so.2.0.5
fetch https://github.com/gek64/qbittorrent-nox-freebsd/releases/download/v4.4.1/qbittorrent-nox

# copy to folder
cp libtorrent-rasterbar.so.2.0.5 /usr/local/lib/
cp qbittorrent-nox /usr/local/bin/

# install dependencies 
pkg update && pkg install -y openssl qt5-network qt5-xml qt5-sql

# test run
chmod +x /usr/local/bin/qbittorrent-nox
/usr/local/bin/qbittorrent-nox -v
```

## Compile
### How to compile if prebuilt binaries can not run
#### FreeBSD
```sh
fetch https://github.com/gek64/qbittorrent-nox-shared/raw/main/qbittorrent_build_freebsd.sh
chmod +x qbittorrent_build_freebsd.sh
./qbittorrent_build_freebsd.sh
```
#### Linux
```sh
fetch https://github.com/gek64/qbittorrent-nox-shared/raw/main/qbittorrent_build_linux.sh
chmod +x qbittorrent_build_linux.sh
./qbittorrent_build_linux.sh
```

## System Requirements
### FressBSD Prebuilt Binaries
- x64 Architecture CPU
- freebsd 13 and above

### Compile
- Linux or FreeBSD system
- RAM > 2GB
- Disk > 10GB


## License
- **GNU Lesser General Public License v2.1**
- See `LICENSE` for details
