FROM ubuntu:latest

LABEL description="Minecraft Forge (Version 1.19.2)"

RUN apt-get update
RUN apt-get install ca-certificates curl wget nano vim sudo openjdk-17-jdk -y

VOLUME ["/minecraft", "/minecraft/mods", "/minecraft/kubejs", "/minecraft/config", "/minecraft/defaultconfigs", "/minecraft/scripts", "/minecraft/modernfix"]

RUN mkdir /scripts
COPY entrypoint.sh /scripts/entrypoint.sh
RUN chmod +x /scripts/entrypoint.sh

WORKDIR /minecraft

ENTRYPOINT ["/scripts/entrypoint.sh"]