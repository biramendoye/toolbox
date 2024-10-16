#!/bin/bash

MAVEN_VERSION="3.9.9"
MAVEN_URL="https://dlcdn.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz"
MAVEN_FILE="apache-maven-${MAVEN_VERSION}-bin.tar.gz"
INSTALL_DIR="$HOME/.bin/maven"

mkdir -p "$INSTALL_DIR"
wget -O "${INSTALL_DIR}/${MAVEN_FILE}" "$MAVEN_URL"
tar -xzf "${INSTALL_DIR}/${MAVEN_FILE}" -C ${INSTALL_DIR}
rm -f "${INSTALL_DIR}/${MAVEN_FILE}"

echo "export MAVEN_HOME=${INSTALL_DIR}/apache-maven-${MAVEN_VERSION}" >> ~/.bashrc
PATH="$PATH:$MAVEN_HOME/bin"
echo "✅ MAVEN INSTALLED"