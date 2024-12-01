#!/bin/bash

MINECRAFT_VERSION=1.19.2
MODLOADER_VERSION=43.3.5
FORGE_FILE=forge-${MINECRAFT_VERSION}-${MODLOADER_VERSION}-installer.jar

downloadServer() {
    echo "Downloading minecraft forge..."
    echo "Minecraft Version: ${MINECRAFT_VERSION}"
    echo "Forge Version: ${MODLOADER_VERSION}"
    wget "https://files.minecraftforge.net/maven/net/minecraftforge/forge/${MINECRAFT_VERSION}-${MODLOADER_VERSION}/${FORGE_FILE}"
}

installServer() {
    java -jar ${FORGE_FILE} -installServer
}

acceptEULA() {
    echo "Accepting EULA..."
    if [ ! -s "/minecraft/eula.txt" ]; then
        echo "eula=true" >> eula.txt
    fi
}

startServer() {
    ./run.sh
}

main() {
    if [ -d "/minecraft/world" ]; then
        startServer
    else
        downloadServer
        installServer
        acceptEULA
        startServer
    fi
}

main