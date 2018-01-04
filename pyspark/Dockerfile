#!/usr/bin/env bash

FROM centos-ds/jupyter

USER root

# Spark dependencies
ENV APACHE_SPARK_VERSION 2.2.1
ENV HADOOP_VERSION 2.7

# Make sure system is up to date
RUN yum update -y && \
    yum install -y \
    java

# Install Spark
RUN cd /tmp && \
        wget -q http://apache.mirrors.lucidnetworks.net/spark/spark-${APACHE_SPARK_VERSION}/spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
        tar xzf spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz -C /usr/local && \
        rm spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz
RUN cd /usr/local && ln -s spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark

# Mesos dependencies and install
RUN rpm -Uvh http://repos.mesosphere.io/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm
RUN yum -y install mesos mesosphere-zookeeper

# Spark and Mesos config
ENV SPARK_HOME /usr/local/spark
ENV PYTHONPATH $SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.4-src.zip
ENV PYSPARK_PYTHON /usr/bin/python3.6
ENV PYSPARK_DRIVER_PYTHON ipython
# ENV MESOS_NATIVE_LIBRARY /usr/local/lib/libmesos.so
ENV SPARK_OPTS --driver-java-options=-Xms1024M --driver-java-options=-Xmx4096M --driver-java-options=-Dlog4j.logLevel=info



USER ds
