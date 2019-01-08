# Pull from base Container
FROM tomcat:8-jre8

# Maintainer 
MAINTAINER "carroarmato0@gmail.com"

# Environment variables
ENV ADMIN_USER=tomcat
ENV ADMIN_PASSWORD=s3cret

# Copy own tomcat-users.xml
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml

# Replace entries in tomcat-users.xml with environment variables
RUN sed -i "s|{ADMIN_USER}|$ADMIN_USER|g" /usr/local/tomcat/conf/tomcat-users.xml
RUN sed -i "s|{ADMIN_PASSWORD}|$ADMIN_PASSWORD|g" /usr/local/tomcat/conf/tomcat-users.xml
