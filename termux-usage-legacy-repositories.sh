#!/bin/bash
baseUrl="https://bzi-han.github.io/TermuxLegacy"

mainRepository="deb $baseUrl/termux-repositories-legacy/webroot/termux-packages stable main"
gameRepository="deb $baseUrl/termux-repositories-legacy/webroot/game-packages-21 games stable"
scienceRepository="deb $baseUrl/termux-repositories-legacy/webroot/science-packages-21 science stable"

# rootRepository=""

# x11Repository=""
# unstableRepository=""

echo "[=] Checking permission..."
if [ -z ${EUID+x} ]; then
    EUID=$(id -u)
fi
if [ ! -z ${PREFIX+x} ]; then
    if [[ $EUID -eq 0 ]]; then
        echo "[-] Do not run this script as the root user."
        exit
    fi
fi
echo "[=] User" $(whoami)

echo "[=] Checking environment..."
if [ -z ${PREFIX+x} ]; then
    PREFIX="/data/data/com.termux/files/usr"
fi

echo "[*] Installing repositories..."
# main repository
if [ -f "$PREFIX/etc/apt/sources.list" ]; then
    mv $PREFIX/etc/apt/sources.list $PREFIX/etc/apt/sources.list.bak
fi
echo $mainRepository > $PREFIX/etc/apt/sources.list.d/termux-legacy-main.list

# game repository
if [ -f "$PREFIX/etc/apt/sources.list.d/game.list" ]; then
    mv $PREFIX/etc/apt/sources.list.d/game.list $PREFIX/etc/apt/sources.list.d/game.list.bak
fi
echo $gameRepository > $PREFIX/etc/apt/sources.list.d/termux-legacy-game.list

# science repository
if [ -f "$PREFIX/etc/apt/sources.list.d/science.list" ]; then
    mv $PREFIX/etc/apt/sources.list.d/science.list $PREFIX/etc/apt/sources.list.d/science.list.bak
fi
echo $scienceRepository > $PREFIX/etc/apt/sources.list.d/termux-legacy-science.list

if [[ $EUID -eq 0 ]]; then
    echo "[*] Changing files ownership..."
    chown 10143:10143 $PREFIX/etc/apt/sources.list.d/termux-legacy-main.list
    chown 10143:10143 $PREFIX/etc/apt/sources.list.d/termux-legacy-game.list
    chown 10143:10143 $PREFIX/etc/apt/sources.list.d/termux-legacy-science.list
    echo "[+] Change succeeded."
fi
echo "[+] Install successfully."