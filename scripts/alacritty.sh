#!/bin/bash
 
install(){
    git clone https://github.com/alacritty/alacritty.git
    cd alacritty

    cargo build --release
    cp target/release/alacritty ~/.bin

    desktopEntry
}

update(){
    sudo rm /usr/local/bin/alacritty 
    sudo rm /usr/share/pixmaps/Alacritty.svg 
    sudo rm /usr/share/applications/Alacritty.desktop 
    sudo update-desktop-database

    cd ~/alacritty
    git pull
    cargo build --release

    cp target/release/alacritty ~/.bin

    desktopEntry
}

desktopEntry(){
    sudo cp target/release/alacritty /usr/local/bin
    sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
    sudo desktop-file-install extra/linux/Alacritty.desktop
    sudo update-desktop-database
}

case "$1" in
    install)
        install
        ;;
    update)
        update
        ;;
    *)
        echo "Usage: $0 {install|update}"
        exit 1
        ;;
esac