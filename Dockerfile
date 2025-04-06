FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV KOTLIN_VERSION=1.9.22

RUN apt-get update && apt-get install -y \
    openjdk-8-jdk \
    curl \
    unzip

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

RUN curl -LO https://github.com/JetBrains/kotlin/releases/download/v${KOTLIN_VERSION}/kotlin-compiler-${KOTLIN_VERSION}.zip \
    && unzip kotlin-compiler-${KOTLIN_VERSION}.zip -d /opt/kotlin \
    && ln -s /opt/kotlin/kotlinc/bin/kotlinc /usr/bin/kotlinc \
    && ln -s /opt/kotlin/kotlinc/bin/kotlin /usr/bin/kotlin \
    && rm kotlin-compiler-${KOTLIN_VERSION}.zip

RUN java -version && kotlinc -version

CMD ["/bin/bash"]

