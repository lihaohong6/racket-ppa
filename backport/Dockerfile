FROM ubuntu:devel

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y ubuntu-dev-tools bash git wget curl gpg vim
COPY backport.sh /root/backport.sh
