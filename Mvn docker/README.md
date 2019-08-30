
# Exchange maven publish

To build the image run:
```
docker build . -t exchange-maven-publish
```

To run the test run:
```
docker run --rm -it \
  -e ANYPOINT_USERNAME=<your username> \
  -e ANYPOINT_PASSWORD=<your password> \
  -e ORGANIZATION_ID='<your organization id>' \
  -e MAVEN_FACADE_HOST='maven.anypoint.mulesoft.com' \
  -e ASSET_VERSION='1.5.4-<unique value>'
  exchange-maven-publish
```

If the command succeds (`echo $?` -> `0`) then the asset was published successfuly.

**NOTE** `MAVEN_FACADE_HOST` should be
 - For prod: maven.anypoint.mulesoft.com
 - For prod-eu: maven.eu1.anypoint.mulesoft.com

 **NOTE** `ASSET_VERSION` is needed to guarantee a unique asset version for each run. Otherwise we could get errors if the asset it not properly deleted.


**IMPORTANT NOTE** Remember to delete the asset after the test to avoid poluting the test account.