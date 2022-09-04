#Author Korbq
#version 1.0
#
#   1) sudo docker build -t mc mc
#   2) sudo docker run -dt -p 25565:25565 --name mc mc

FROM archlinux

COPY server.jar .
COPY init-mc-server.sh init.sh

RUN echo eula=True > eula.txt
RUN echo \#!/bin/bash\n\njava -jar -Xmx2G server.jar > init.sh
RUN pacman --noconfirm -Sy jre8-openjdk jdk8-openjdk

CMD ["java", "-jar", "-Xmx2G", "server.jar"]