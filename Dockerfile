FROM  ubuntu:14.04

MAINTAINER wangfw@asiainfo.com

ENV GOLANG_VERSION=1.6 GOLANG_OS=linux GOLANG_ARCH=amd64
ENV GOROOT=/home/go GOPATH=/home/workspace
ENV PATH=$GOROOT/bin:$GOPATH/bin:$PATH

WORKDIR /home
VOLUME /package
ADD go1.6.2.linux-amd64.tar.gz /home/go1.6.2.linux-amd64.tar.gz
RUN \
  apt-get update && \
  apt-get install -y wget vim git  gcc && \

  tar -xzf go$GOLANG_VERSION.$GOLANG_OS-$GOLANG_ARCH.tar.gz && \
  mkdir -p workspace/src && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* go$GOLANG_VERSION.$GOLANG_OS-$GOLANG_ARCH.tar.gz

# Build Open-Falcon Components
COPY openfalcon-build.sh /home/build.sh
CMD ["/home/build.sh"]
