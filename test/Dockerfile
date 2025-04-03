ARG VERSION="latest"

FROM ubuntu:${VERSION}

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:lihaohong/racket
RUN apt-get update
RUN apt-get install -y racket nasm bash git build-essential
COPY run-test.sh /root/test.sh
