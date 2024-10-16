#! /bin/bash

echo "+-----------------+"
echo "+ INSTALL FLUTTER +"
echo "+-----------------+"

VERSION=""

wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${VERSION}-stable.tar.xz

sudo tar -C /usr/local -xf flutter_linux_*-stable.tar.xz
export PATH="$PATH:/usr/local/flutter/bin"
flutter sdk-path
flutter precache
flutter doctor