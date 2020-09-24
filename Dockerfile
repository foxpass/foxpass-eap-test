FROM ubuntu:18.04
MAINTAINER Travis Theune <travist@foxpass.com>

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y wget build-essential libssl-dev pkg-config vim libdbus-1-dev libnl-3-dev apt-utils libnl-genl-3-dev

RUN wget http://w1.fi/releases/wpa_supplicant-2.8.tar.gz && tar -xf wpa_supplicant-2.8.tar.gz

RUN cd wpa_supplicant-2.8/wpa_supplicant && \
    cp defconfig .config && \
    sed -i 's/#CONFIG_EAPOL_TEST=y/CONFIG_EAPOL_TEST=y/g' .config && \
    make eapol_test

ENTRYPOINT ["/wpa_supplicant-2.8/wpa_supplicant/eapol_test"]
