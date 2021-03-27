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

# Status

![](https://img.shields.io/github/last-commit/benc-uk/java-demoapp) ![](https://img.shields.io/github/release-date/benc-uk/java-demoapp) ![](https://img.shields.io/github/v/release/benc-uk/java-demoapp) ![](https://img.shields.io/github/commit-activity/y/benc-uk/java-demoapp)

Live instances:

[![](https://img.shields.io/website?label=Hosted%3A%20Azure%20App%20Service&up_message=online&url=https%3A%2F%2Fjava-demoapp.azurewebsites.net%2F)](https://java-demoapp.azurewebsites.net/)  
[![](https://img.shields.io/website?label=Hosted%3A%20Kubernetes&up_message=online&url=https%3A%2F%2Fjava-demoapp.kube.benco.io%2F)](https://java-demoapp.kube.benco.io/)

# Building & Running Locally

### Pre-reqs

- Be using Linux, WSL or MacOS, with bash, make etc
- [Java 11+](https://adoptopenjdk.net/installation.html) - for running locally, linting, running tests etc
- [Docker](https://docs.docker.com/get-docker/) - for running as a container, or image build and push
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux) - for deployment to Azure

Clone the project to any directory where you do development work

```
git clone https://github.com/benc-uk/java-demoapp.git
```

### Makefile

A standard GNU Make file is provided to help with running and building locally.

```text
help                 💬 This help message
lint                 🔎 Lint & format, will not fix but sets exit code on error
lint-fix             📜 Lint & format, will try to fix errors and modify code
image                🔨 Build container image from Dockerfile
push                 📤 Push container image to registry
run                  🏃 Run the server locally using Python & Flask
deploy               🚀 Deploy to Azure Web App
undeploy             💀 Remove from Azure
test                 🎯 Unit tests for server and frontend
test-report          🎯 Unit tests for server and frontend (with report output)
test-api             🚦 Run integration API tests, server must be running
clean                🧹 Clean up project
```

Make file variables and default values, pass these in when calling `make`, e.g. `make image IMAGE_REPO=blah/foo`

| Makefile Variable | Default              |
| ----------------- | -------------------- |
| IMAGE_REG         | ghcr<span>.</span>io |
| IMAGE_REPO        | benc-uk/java-demoapp |
| IMAGE_TAG         | latest               |
| AZURE_RES_GROUP   | temp-demoapps        |
| AZURE_REGION      | uksouth              |
| AZURE_SITE_NAME   | java-{git-sha}       |

The application listens on port 8080 by default, but this can be set with the `PORT` environmental variable.

# Containers

Public container image is [available on GitHub Container Registry](https://github.com/users/benc-uk/packages/container/package/java-demoapp)

Run in a container with:

```bash
docker run --rm -it -p 8080:8080 ghcr.io/benc-uk/java-demoapp:latest
```

Should you want to build your own container, use `make image` and the above variables to customise the name & tag.

# Kubernetes

The app can easily be deployed to Kubernetes using Helm, see [deploy/kubernetes/readme.md](deploy/kubernetes/readme.md) for details

# Optional Features

## Application Insights

If you wish to enable Azure App Insights integration set the `azure_applicationinsights_instrumentationkey` environmental variable to the relevant workspace key

## User Sign-In - Azure Active Directory

The _'Spring Boot Starter for Azure Active Directory'_ is included in the application and the main application nav bar has a 'User' button which when configured will sign users in via Azure AD. This is optional and not required for the app to start and run.

**NOTE.** The Azure AD application must be registered with a reply/redirect URL which ends with `/login/oauth2/code/`, and have implicit grant enabled. The application must also be **granted admin consent** to several Graph APIs, this can limit which tenants the application can be registered in.

See the Azure docs for more details
https://docs.microsoft.com/en-us/azure/developer/java/spring-framework/configure-spring-boot-starter-java-app-with-azure-active-directory

If running locally you can enabled Azure AD authentication by setting the following three environmental variables, before running `make run`

```bash
export azure_activedirectory_clientid='my-client-id'
export azure_activedirectory_clientsecret='my-secret'
export azure_activedirectory_tenantid='my-tenant'
```

# GitHub Actions CI/CD

A working set of CI and CD release GitHub Actions workflows are provided `.github/workflows/`, automated builds are run in GitHub hosted runners

### [GitHub Actions](https://github.com/benc-uk/python-demoapp/actions)

[![](https://img.shields.io/github/workflow/status/benc-uk/java-demoapp/CI%20Build%20App)](https://github.com/benc-uk/java-demoapp/actions?query=workflow%3A%22CI+Build+App%22)

[![](https://img.shields.io/github/workflow/status/benc-uk/java-demoapp/CD%20Release%20-%20AKS?label=release-kubernetes)](https://github.com/benc-uk/java-demoapp/actions?query=workflow%3A%22CD+Release+-+AKS%22)

[![](https://img.shields.io/github/workflow/status/benc-uk/java-demoapp/CD%20Release%20-%20Webapp?label=release-azure)](https://github.com/benc-uk/java-demoapp/actions?query=workflow%3A%22CD+Release+-+Webapp%22)

[![](https://img.shields.io/github/last-commit/benc-uk/java-demoapp)](https://github.com/benc-uk/java-demoapp/commits/master)

# Updates

- Mar 2021 - Version bumps, unit tests
- Dec 2019 - First version
