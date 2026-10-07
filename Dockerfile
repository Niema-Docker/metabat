# Minimal Docker image for Minimap2 using Alpine base
FROM alpine:latest

# install Minimap2
RUN apk update && \
    apk add --no-cache autoconf bash boost-dev bzip2-dev cmake gcc g++ make musl-dev xz-dev zlib-dev && \
    wget -qO- "https://github.com/samtools/htslib/releases/download/1.24/htslib-1.24.tar.bz2" | tar -xj && \
    cd htslib-* && \
    ./configure && \
    make && \
    make install && \
    cd .. && \
    wget -qO- "https://bitbucket.org/berkeleylab/metabat/get/v2.18.tar.gz" | tar -zx && \
    cd *metabat* && \
    mkdir build && \
    cd build && \
    cmake ..
    make && \
    make install && \
    cd ../.. && \
    rm -rf htslib-* *metabat*
