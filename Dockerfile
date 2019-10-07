FROM debian:10

#Get curl to download our sources
#get build-essential so we can make
#Get dependencies for rgbds (byacc, flex, pkg-config, libpng-dev) which is required to build sameboy https://github.com/rednex/rgbds
#Get dependencies for SameBoy (clang, libsdl2-dev, and rgbds) https://github.com/LIJI32/SameBoy
RUN apt-get update && apt-get install -y \
    curl \
    byacc \
    flex \
    pkg-config \
    libpng-dev \
    clang \
    libsdl2-dev \
    build-essential

ARG RGBDS_VERSION="0.3.8"
ARG SAMEBOY_VERSION="0.12.2"

#Download, build, and install rgbds
RUN curl -LO https://github.com/rednex/rgbds/archive/v$RGBDS_VERSION.tar.gz && \
    tar -xvf v$RGBDS_VERSION.tar.gz && \
    cd rgbds-$RGBDS_VERSION && \
    make && \
    make install

#Download, build, and move sameboy to the /build directory so we can grab it with our build.sh
RUN curl -LO https://github.com/LIJI32/SameBoy/archive/v$SAMEBOY_VERSION.tar.gz && \
    tar -xvf v$SAMEBOY_VERSION.tar.gz && \
    cd SameBoy-$SAMEBOY_VERSION && \
    make && \
    mkdir /build && \
    tar cvfz /build/SameBoy.tar.gz /SameBoy-$SAMEBOY_VERSION/build