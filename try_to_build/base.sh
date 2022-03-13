apt install -y build-essential curl pkg-config automake libtool git openssl perl python3 python3-dev python3-numpy
apt install -y libticonv-dev libghc-iconv-dev

git config --global http.proxy http://192.168.1.2:1081
git config --global https.proxy http://192.168.1.2:1081
export http_proxy=http://192.168.1.2:1081
export https_proxy=http://192.168.1.2:1081


setenv http_proxy http://192.168.1.2:1081
setenv https_proxy http://192.168.1.2:1081