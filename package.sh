#!/bin/bash

#docker run -it --rm --volume "$(pwd)/pom.xml"://usr/src/app/pom.xml maven:3-jdk-8-alpine mvn install

docker run -it --rm --name tagchowder \
        --volume "$(pwd)"/.m2:/root/.m2 \
        -v "$(pwd)":/usr/src/tagchowder \
        -w /usr/src/tagchowder maven:3.3-jdk-8 \
        mvn clean compile assembly:single 
mkdir -p dist \
&& cp core/target/tagchowder.core-jar-with-dependencies.jar dist/tagchowder.core.jar

#--volume "$(pwd)"/.m2:/root/.m2
#-u $(id -u):$(id -g)