#!/bin/sh

install_qt() {
  git clone "https://github.com/qt/qt5"
  cd qt5 || exit
  perl init-repository -f --module-subset="qtbase,qttools,qtsvg,qttranslations"
  ./configure -opensource -confirm-license -c++std c++17 \
            -nomake examples -nomake tests \
            -no-opengl -no-dbus -no-widgets -no-gui \
            -static -openssl-linked
  cmake --build . --parallel
  cmake --install .
  cd ..
}


git clone --branch "5.15.2" "https://github.com/qt/qt5"