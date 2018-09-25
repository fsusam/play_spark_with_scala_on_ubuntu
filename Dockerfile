FROM ubuntu:16.04
LABEL MAINTAINER Fethi Susam <fsusam@gmail.com>

ENV JAVA_HOME	/usr/lib/jvm/java-8-oracle
ENV SPARK_HOME	/opt/spark-2.3.1-bin-hadoop2.7
ENV SCALA_HOME	/opt/scala-2.11.8
ENV PATH $SCALA_HOME/bin:$SPARK_HOME/bin:$PATH

RUN apt-get update && \
    apt-get upgrade -y && \
	apt-get --purge remove openjdk* && \
    apt-get install -y software-properties-common && \
	apt-get install -y nano && \
    add-apt-repository ppa:webupd8team/java -y && \
    apt-get update && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java8-installer && \
    apt-get clean

WORKDIR /opt

RUN wget -nv http://ftp.heanet.ie/mirrors/www.apache.org/dist/spark/spark-2.3.1/spark-2.3.1-bin-hadoop2.7.tgz && \
	tar -xvf spark-2.3.1-bin-hadoop2.7.tgz && \
	wget -nv https://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.tgz && \
    tar -xvf scala-2.11.8.tgz

	