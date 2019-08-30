

RAND=$(openssl rand -hex 4)

ORG_ID=85085ae6-0267-47ad-ae1f-872de4ff0b6b
GROUP_ID=85085ae6-0267-47ad-ae1f-872de4ff0b6b
ASSET_ID=cat-connector-$RAND
VERSION=1.2.5


USER=******
PASS=*****

AUTH=$(echo -ne "$USER:$PASS" | base64);


curl -i -X PUT \
  https://maven.stgx.anypoint.mulesoft.com/api/v2/organizations/$ORG_ID/maven/$GROUP_ID/$ASSET_ID/$VERSION/$ASSET_ID-$VERSION.pom \
   -H "Content-Type:application/octet-stream"  \
   --data-binary @pom.xml  \
   -H "Authorization: Basic $AUTH"


CLASSIFIER=studio-plugin  #mule3 connector
#CLASSIFIER=mule-plugin  #mule4 connector (extension)
#CLASSIFIER=mule-policy  #policy
#CLASSIFIER=mule-application  #app
#CLASSIFIER=mule-application-example #example
#CLASSIFIER=mule-application-template #template


curl -i -X PUT \
  https://maven.stgx.anypoint.mulesoft.com/api/v2/organizations/$ORG_ID/maven/$GROUP_ID/$ASSET_ID/$VERSION/$ASSET_ID-$VERSION-$CLASSIFIER.jar \
   -H "Content-Type:application/octet-stream"  \
   --data-binary @file.jar  \
   -H "Authorization: Basic $AUTH"
