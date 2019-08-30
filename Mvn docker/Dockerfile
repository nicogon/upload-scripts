FROM maven:3.6-jdk-8-alpine

COPY resources/settings.xml /tmp/
COPY resources/mule-http-connector-1.5.4-mule-plugin.jar /tmp/
COPY resources/pom.xml /tmp/

# prefetch and package dependencies as part of the image
RUN mvn -B -f /tmp/pom.xml -s /tmp/settings.xml dependency:go-offline

COPY resources/publish.sh /tmp/

CMD ["/bin/bash", "/tmp/publish.sh"]
