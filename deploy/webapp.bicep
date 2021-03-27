param location string = resourceGroup().location

param planName string = 'app-plan-linux'
param planTier string = 'P1v2'

param webappName string = 'java-demoapp'
param webappImage string = 'ghcr.io/benc-uk/java-demoapp:latest'
param weatherKey string = ''
param ipStackKey string = ''
param releaseInfo string = 'Released on ${utcNow('f')}'

// We can't set these to empty strings Spring Boot does too much validation
// Nor can we inspect the config & disable it at runtime
param aadAppId string = 'ignored'
param aadTenantId string = 'ignored'
@secure()
param aadAppSecret string = 'ignored'

resource appServicePlan 'Microsoft.Web/serverfarms@2020-10-01' = {
  name: planName
  location: location
  kind: 'linux'
  sku: {
    name: planTier
  }
  properties: {
    reserved: true
  }
}

resource webApp 'Microsoft.Web/sites@2020-10-01' = {
  name: webappName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      appSettings:[
        {
          name: 'azure_activedirectory_clientsecret'
          value: aadAppSecret
        }
        {
          name: 'azure_activedirectory_clientid'
          value: aadAppId
        }
        {
          name: 'azure_activedirectory_tenantid'
          value: aadTenantId
        } 
        {
          name: 'RELEASE_INFO'
          value: releaseInfo
        }                        
      ]
      linuxFxVersion: 'DOCKER|${webappImage}'
    }
  }
}
