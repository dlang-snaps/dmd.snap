FROM ubuntu:xenial

RUN DEBIAN_FRONTEND=noninteractive && \
 apt-get update -y && \
 apt-get upgrade -y && \
 apt-get install -y locales && \
 locale-gen en_US.UTF-8

ENV container docker
ENV PATH "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
ENV LANG="en_US.UTF-8"
ENV LANGUAGE="en_US:en"
ENV LC_ALL="en_US.UTF-8"

RUN mkdir /workdir
RUN mkdir /artifacts
COPY ./ /workdir/

RUN DEBIAN_FRONTEND=noninteractive && \
 apt-get install -y unzip xz-utils fuse snapd snap-confine squashfuse sudo && \
 apt-get clean && \
 dpkg-divert --local --rename --add /sbin/udevadm && \
 ln -s /bin/true /sbin/udevadm

RUN systemctl enable snapd
VOLUME ["/sys/fs/cgroup"]
STOPSIGNAL SIGRTMIN+3

CMD ["/sbin/init"]
