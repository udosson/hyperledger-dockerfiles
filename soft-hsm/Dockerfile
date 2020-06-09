FROM alpine:3.12

ENV SOFTHSM2_VERSION=2.5.0 \
    SOFTHSM2_SOURCES=/tmp/softhsm2 \
    SOFTHSM2_PRODUCTION=/prod

# install build dependencies
RUN apk add --no-cache \
        alpine-sdk \
        autoconf \
        automake \
        git \
        libtool \
        openssl-dev \
        rsync \
	    nano \ 
        opensc

# Fix permissions
RUN mkdir -p ${SOFTHSM2_SOURCES} \
 && chown -R :0 ${SOFTHSM2_SOURCES} \
 && chmod -R a+w ${SOFTHSM2_SOURCES} \
 && mkdir -p ${SOFTHSM2_PRODUCTION} \
 && chown -R :0 ${SOFTHSM2_PRODUCTION} \
 && chmod -R a+w ${SOFTHSM2_PRODUCTION} 

# build and install SoftHSM2
RUN git clone https://github.com/opendnssec/SoftHSMv2.git ${SOFTHSM2_SOURCES}
WORKDIR ${SOFTHSM2_SOURCES}

RUN git checkout ${SOFTHSM2_VERSION} -b ${SOFTHSM2_VERSION} \
    && sh autogen.sh \
    && ./configure --prefix=${SOFTHSM2_PRODUCTION} \
    && make \
    && make install

WORKDIR /root
RUN rm -fr ${SOFTHSM2_SOURCES}

