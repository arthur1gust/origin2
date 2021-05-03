FROM ubuntu:latest

RUN apt-get update
RUN apt-get -y install default-jdk
RUN apt-get -y install maven
RUN apt-get -y install git
RUN apt-get -y install curl

RUN mkdir -p /usr/local/tomcat/

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
CMD /usr/local/tomcat/bin/catalina.sh run
