# Java - Demo Web Application
This is a simple Java web app built using Spring Boot and OpenJDK 11.  

The app has been designed with cloud native demos & containers in mind, in order to provide a real working application for deployment, something more than "hello-world" but with the minimum of pre-reqs. It is not intended as a complete example of a fully functioning architecture or complex software design.

Typical uses would be deployment to Kubernetes, demos of Docker, CI/CD (build pipelines are provided), deployment to cloud (Azure) monitoring, auto-scaling

The app has several basic pages accessed from the top navigation menu, some of which are only lit up when certain configuration variables are set (see 'Optional Features' below):

Features:
- The **'Info'** page displays some system basic information (OS, platform, CPUs, IP address etc) and should detect if the app is running as a container or not. 
 - The **'Tools'** page is useful in demos, and has options such a forcing CPU load (for autoscale demos), and error pages for use with App Insights
 - The **'mBeans'** page is a basic Java mBeans explorer, letting you inspect mBeans registered with the JVM and the properties they are exposing
- Azure AD integration for user auth and sign-in (optional, see config below)
- Azure App Insights for monitoring (optional, see config below)

## Config - Environmental Variables
* `PORT`
* `azure_applicationinsights_instrumentationkey`
* `spring_security_oauth2_client_registration_azure_clientid`
* `spring_security_oauth2_client_registration_azure_clientsecret`
* `azure_activedirectory_tenantid`

NOTE. The Azure AD application must be registered with a reply/redirect URL which ends with `/login/oauth2/code/azure`, and implicit grant enabled

## Running with Maven
Basic:
```
./mvnw spring-boot:run
```

With configuration:
```
export azure_applicationinsights_instrumentationkey='my-key'
export spring_security_oauth2_client_registration_azure_clientid='my-client-id'
export spring_security_oauth2_client_registration_azure_clientsecret='my-secret'
export azure_activedirectory_tenantid='my-tenant'

./mvnw spring-boot:run
```

## Running with Docker
Basic:
```
docker run --rm -it -p 8080:8080 bencuk/java-demoapp
```

With configuration:
```
docker run --rm -it -p 8080:8080 \
-e azure_applicationinsights_instrumentationkey="my-key" \
-e spring_security_oauth2_client_registration_azure_clientid="my-client-id" \
-e spring_security_oauth2_client_registration_azure_clientsecret="my-secret" \
-e azure_activedirectory_tenantid="my-tenant" \
bencuk/java-demoapp
```

# Updates
* Dec 2019 - First version 