FROM ubuntu:14.04
MAINTAINER James Baxter <j.w.baxter@gmail.com>

# Install wget
RUN \
  apt-get update && \
  apt-get install wget -y

# Install Java
RUN \
  wget --progress=bar --no-check-certificate -O /tmp/jdk.tar.gz --header "Cookie: oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/8u65-b17/jdk-8u65-linux-x64.tar.gz && \
  tar xvf /tmp/jdk.tar.gz && \
  rm /tmp/jdk.tar.gz && \
  mkdir -p /usr/lib/jvm/java-8-oracle && \
  mv jdk1.8.0_65/jre /usr/lib/jvm/java-8-oracle/jre && \
  rm -r jdk1.8.0_65 && \
  chown root:root -R /usr/lib/jvm/java-8-oracle/jre && \
  update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-8-oracle/jre/bin/java 1 && \
  update-alternatives --set java /usr/lib/jvm/java-8-oracle/jre/bin/java
