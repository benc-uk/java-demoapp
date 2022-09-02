# Forked from https://github.com/benc-uk/java-demoapp

Adapted for the renovate talk.

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

![](https://user-images.githubusercontent.com/14982936/71443390-87cd0680-2702-11ea-857c-63d34a6e1306.png)