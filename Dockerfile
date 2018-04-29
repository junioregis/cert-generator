FROM openjdk:8-jdk

ARG BC_URL=http://repo1.maven.org/maven2/org/bouncycastle/bcprov-ext-jdk16/1.46/bcprov-ext-jdk16-1.46.jar

RUN mkdir /certs
RUN mkdir /scripts

WORKDIR /scripts

COPY scripts/generate.sh /scripts
RUN chmod +x /scripts/generate.sh

RUN curl $BC_URL --output bc.jar

VOLUME /certs

CMD ["/bin/bash", "generate.sh"]