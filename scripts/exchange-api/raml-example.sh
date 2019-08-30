# Uploads a REST-API RAML


RAND=$(openssl rand -hex 4)

ORG_ID=85085ae6-0267-47ad-ae1f-872de4ff0b6b
GROUP_ID=85085ae6-0267-47ad-ae1f-872de4ff0b6b
ASSET_ID=fligth-api-$RAND
VERSION=1.2.5

TOKEN="bearer **********"

curl -X POST \
  https://stgx.anypoint.mulesoft.com/exchange/api/v1/assets \
  -H "Authorization: $TOKEN" \
  -H 'cache-control: no-cache' \
  -H 'content-type: multipart/form-data' \
  -F organizationId=$ORG_ID \
  -F groupId=$GROUP_ID \
  -F assetId=$ASSET_ID \
  -F version=$VERSION \
  -F main=flights-api.raml \
  -F apiVersion=v1 \
  -F classifier=raml \
  -F asset=@flights.zip \
  -F name=fligthApi \
  -F description=sum