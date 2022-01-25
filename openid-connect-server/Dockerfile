FROM alpine/git as clone
WORKDIR /server
RUN git clone --progress https://github.com/mitreid-connect/OpenID-Connect-Java-Spring-Server.git

FROM maven:alpine as build
WORKDIR /server
COPY --from=clone /server/OpenID-Connect-Java-Spring-Server /server

# Adds proper redirect_uri for NiFi and NiFi Registry
COPY clients.sql openid-connect-server-webapp/src/main/resources/db/hsql

RUN mvn -Dmaven.javadoc.skip=true -DskipTests clean install && \
mkdir /server/war && mv openid-connect-server-webapp/target/openid-connect-server-webapp.war /server/war

FROM jetty:9-jre8
COPY --from=build /server /server

RUN cp /server/war/*.war /var/lib/jetty/webapps
