#!/bin/bash

# replace credentials in settings.xml file from env vars
sed -i \
    -e "s/anypoint_username/$ANYPOINT_USERNAME/g" \
    -e "s/anypoint_password/$ANYPOINT_PASSWORD/g" \
    /tmp/settings.xml

# replace organization id in pom.xml from env var
sed -i \
    -e "s/organization_id/$ORGANIZATION_ID/g" \
    -e "s/asset_version/$ASSET_VERSION/g" \
    /tmp/pom.xml

# publish to exchange
mvn deploy:deploy-file \
    -s /tmp/settings.xml \
    -DrepositoryId="exchange" \
    -Durl="https://$MAVEN_FACADE_HOST/api/v1/organizations/$ORGANIZATION_ID/maven" \
    -Dclassifier="mule-plugin" \
    -DpomFile="/tmp/pom.xml" \
    -Dfile="/tmp/mule-http-connector-1.5.4-mule-plugin.jar" 
