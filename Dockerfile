
FROM centos:centos6
  
#Install WGET
RUN yum install -y wget

 #Install tar
RUN yum install -y tar

 # Download JDK
RUN cd /opt;wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jdk-8u161-linux-x64.rpm && yum localinstall -y jdk-8u161-linux-x64.rpm

#RUN cd /usr/bin/java rm ~/jdk-8u161-linux-x64.rpm

RUN alternatives --install /usr/bin/java java /opt/jdk1.8/bin/java 2

 # Download Apache Tomcat 7
RUN cd /tmp;wget http://www-us.apache.org/dist/tomcat/tomcat-7/v7.0.84/bin/apache-tomcat-7.0.84.tar.gz

 # untar and move to proper location
RUN cd /tmp;tar xvf apache-tomcat-7.0.84.tar.gz

RUN cd /tmp;mv apache-tomcat-7.0.84 /opt/tomcat7

RUN chmod -R 755 /opt/tomcat7

ENV JAVA_HOME /usr/java/jdk1.8.0_161/

#changing tomcat port from 8080 to 80(optional)
RUN sed -i 's/Connector port="8080"/Connector port="80"/g' /opt/tomcat7/conf/server.xml

EXPOSE 80

CMD /opt/tomcat7/bin/catalina.sh run
