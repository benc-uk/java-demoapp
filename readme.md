# Java - Demo Web Application
This is a simple Java web app built using Spring Boot and OpenJDK 11.  

It has been designed with cloud demos & containers in mind, to demonstrate capabilities such as microservice deployment, auto scaling in Azure and Application Insights monitoring


## Config - Environmental Variables
* `PORT`
* `azure_applicationinsights_instrumentationkey`
* `spring_security_oauth2_client_registration_azure_clientid`
* `spring_security_oauth2_client_registration_azure_clientsecret`
* `azure_activedirectory_tenantid`

## Running 
```
export azure_applicationinsights_instrumentationkey='my-key'
export spring_security_oauth2_client_registration_azure_clientid='my-client-id'
export spring_security_oauth2_client_registration_azure_clientsecret='my-secret'
export azure_activedirectory_tenantid='my-tenant'

./mvnw spring-boot:run
```

```
docker run --rm -it -p 8080:8080 \
-e azure_applicationinsights_instrumentationkey="my-key" \
-e spring_security_oauth2_client_registration_azure_clientid="my-client-id" \
-e spring_security_oauth2_client_registration_azure_clientsecret="my-secret" \
-e azure_activedirectory_tenantid="my-tenant" \
bencuk/java-demoapp
```
