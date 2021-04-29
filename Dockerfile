# FROM tomcat:latest
FROM ubuntu:18.04

RUN apt-get update
RUN apt-get -y install default-jdk
RUN apt-get -y install maven
RUN apt-get -y install git
RUN apt-get -y install curl

# ENV CATALINA_HOME /usr/local/tomcat
# RUN mkdir -p "$CATALINA_HOME"
# RUN mkdir -p "$CATALINA_HOME"/conf/

# ENV TOMCAT_MAJOR 8
# ENV TOMCAT_VERSION 8.0.35
# ENV TOMCAT_TGZ_URL https://www.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
# RUN set -x curl -fSL "$TOMCAT_TGZ_URL" -o tomcat.tar.gz

RUN mkdir /usr/local/tomcat/
RUN cd /tmp
RUN curl https://apache-mirror.rbc.ru/pub/apache/tomcat/tomcat-9/v9.0.45/bin/apache-tomcat-9.0.45.tar.gz -o tomcat.tar.gz
RUN tar -xvf tomcat.tar.gz
RUN cp -Rv apache-tomcat-9.0.45/* /usr/local/tomcat/
WORKDIR /usr/local/tomcat/
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /usr/local/tomcat/boxfuse-sample-java-war-hello/
RUN mvn package

RUN cp ./target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]