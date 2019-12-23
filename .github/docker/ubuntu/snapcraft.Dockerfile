FROM ubuntu:xenial

ENV container docker
ENV PATH "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"

RUN mkdir /workdir
RUN mkdir /artifacts
COPY ./ /workdir/

RUN DEBIAN_FRONTEND=noninteractive && \
 apt-get update -y && \
 apt-get upgrade -y && \
 apt-get install -y unzip xz-utils snapd squashfuse fuse sudo && \
 systemctl enable snapd.socket

STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
