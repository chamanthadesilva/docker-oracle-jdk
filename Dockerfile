# DECRIPTION:    Oracle Java jdk-8u112

FROM ubuntu:16.04
MAINTAINER chamantha de silva

# Install wget
RUN apt-get update && \
    apt-get install -y wget

# Install Oracle JDK 8u112
RUN cd /opt && \
    wget --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"  http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jdk-8u112-linux-x64.tar.gz && \
    tar -xzvf jdk-8u112-linux-x64.tar.gz && mv jdk1.8.0_112 java && \
    rm jdk-8u112-linux-x64.tar.gz

# Creating the symlink 
RUN ln -s /opt/java /usr/local/java

# Define JAVA_HOME variable
ENV JAVA_HOME /usr/local/java

# Add /srv/java and jdk on PATH variable
ENV PATH ${PATH}:${JAVA_HOME}/bin
