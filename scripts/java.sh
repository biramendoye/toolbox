#!/bin/bash

DOWNLOAD_URL="https://download.bell-sw.com/java/21.0.4+9/bellsoft-jdk21.0.4+9-linux-amd64-full.tar.gz"
INSTALL_DIR="$HOME/.bin"
VERSION="21.0.4"
JDK_DIR="jdk-${VERSION}"

echo "+-------------------------------------------------+"
echo "+ INSTALL JAVA BellSoft Liberica JDK ${VERSION} LTS"
echo "+-------------------------------------------------+"

mkdir -p "$INSTALL_DIR"
wget -O "${INSTALL_DIR}/bellsoft-jdk.tar.gz" "$DOWNLOAD_URL"

cd "$INSTALL_DIR" || exit 1 

# Decompress the tar.gz file
tar -xzf "bellsoft-jdk.tar.gz"

# Remove the tar.gz file after extraction
rm -f "*.tar.gz"

echo "export JAVA_HOME=${INSTALL_DIR}/${JDK_DIR}-full" >> ~/.bashrc
echo "export PATH=${INSTALL_DIR}/${JDK_DIR}-full/bin:${PATH}" >> ~/.bashrc
echo "✅ JAVA"-