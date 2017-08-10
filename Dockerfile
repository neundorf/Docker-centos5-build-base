FROM centos:5
MAINTAINER alexander.neundorf@sharpreflections.com

# This image extends a basic Centos 5 system by installing some packages
# needed for developmemt.

# Since Centos5 is EOL since April 2017, yum needs to check the "vault"-repositories
# (copied from https://github.com/astj/docker-centos5-vault )
COPY ./yum.repos.d/ /etc/yum.repos.d/

# install a bunch of development packages
RUN yum update -y && \
    yum install libidn libXext mc joe nano wget strace subversion sudo man man-pages -y && \
    yum install apr-devel apr-util-devel openssl-devel -y && \
    yum groupinstall "Development Tools" -y && \
    yum install libX11-devel libSM-devel libxml2-devel libjpeg-devel mesa-libGLU-devel freetype-devel -y


# install cmake
WORKDIR /opt
RUN mkdir -p /tmp/dl && \
    wget -P /tmp/dl --no-check-certificate https://cmake.org/files/v3.6/cmake-3.6.3-Linux-x86_64.tar.gz && \
    wget -P /tmp/dl --no-check-certificate https://cmake.org/files/v3.1/cmake-3.1.3-Linux-x86_64.tar.gz && \
    tar -zxvf /tmp/dl/cmake-3.6.3-Linux-x86_64.tar.gz && \
    tar -zxvf /tmp/dl/cmake-3.1.3-Linux-x86_64.tar.gz && \
    rm /tmp/dl/*
