FROM ubuntu:devel

RUN apt-get update && apt-get upgrade
RUN apt-get install -y ubuntu-dev-tools bash git wget curl gpg
COPY backport.sh /root/backport.sh
COPY pub.asc /root/pub.asc
COPY priv.asc /root/priv.asc
