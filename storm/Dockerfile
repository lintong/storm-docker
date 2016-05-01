FROM ubuntu:xenial

MAINTAINER lintong

RUN apt-get update 
RUN apt-get install -y software-properties-common wget supervisor openjdk-8-jdk openssh-server
RUN wget -q -O - http://mirrors.sonic.net/apache/storm/apache-storm-1.0.0/apache-storm-1.0.0.tar.gz | tar -xzf - -C /opt
RUN mkdir /var/run/sshd

ENV STORM_HOME /opt/apache-storm-1.0.0
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

RUN groupadd storm; useradd --gid storm --home-dir /home/storm --create-home --shell /bin/bash storm; chown -R storm:storm $STORM_HOME; mkdir /var/log/storm ; chown -R storm:storm /var/log/storm
RUN ln -s $STORM_HOME/bin/storm /usr/bin/storm

ADD storm.yaml $STORM_HOME/conf/storm.yaml
ADD cluster.xml $STORM_HOME/logback/cluster.xml
ADD config-supervisord.sh /usr/bin/config-supervisord.sh
ADD start-supervisor.sh /usr/bin/start-supervisor.sh 

RUN echo [supervisord] | tee -a /etc/supervisor/supervisord.conf ; echo nodaemon=true | tee -a /etc/supervisor/supervisord.conf
