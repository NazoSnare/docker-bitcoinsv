FROM ubuntu:18.04
MAINTAINER KevinEJohn <kevinejohn@gmail.com>

RUN apt-get update
RUN apt-get install -y git build-essential libzmq3-dev libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils libboost-all-dev libdb-dev libdb++-dev libminiupnpc-dev


RUN git clone https://github.com/bitcoin-sv/bitcoin-sv.git --branch v0.2.2.beta /root/bitcoin-sv
WORKDIR /root/bitcoin-sv
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install

EXPOSE 8332 8333 18332 18333 28332

CMD ["bitcoind"]
