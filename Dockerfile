FROM maven:latest AS MAVEN
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn package
 
FROM tomcat:9.0-jre8-alpine
COPY --from=MAVEN /tmp/target/ghanem-app-1.2.war $CATALINA_HOME/webapps/ghanem-app-1.2.war
HEALTHCHECK --interval=1m --timeout=3s CMD wget --quiet --tries=1 --spider http://localhost:8080/wizard/ || exit 1
