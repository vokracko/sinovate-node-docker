FROM ubuntu:18.04

RUN apt-get update
RUN apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -y -qq upgrade
RUN apt-get install -y software-properties-common
RUN apt-add-repository -y ppa:bitcoin/bitcoin
RUN apt-get install -y build-essential libtool autoconf libssl-dev libboost-dev libboost-chrono-dev libboost-filesystem-dev libboost-program-options-dev \
libboost-system-dev libboost-test-dev libboost-thread-dev sudo make automake git wget curl libdb4.8-dev bsdmainutils libdb4.8++-dev \
libminiupnpc-dev libgmp3-dev ufw pkg-config libevent-dev libzmq5 libdb5.3++
RUN wget -q https://github.com/SINOVATEblockchain/SIN-core/releases/download/1.0.0.1/daemon.tar.gz
RUN tar xvzf daemon.tar.gz
RUN strip sind sin-cli
ENTRYPOINT ["./sind", "-conf=/root/sin.conf", "-datadir=/root/.sin"]

