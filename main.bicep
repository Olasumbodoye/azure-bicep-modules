// Set deployment scope to subscription
targetScope = 'subscription'

// Parameters
param environmentName string = 'dev'
param location string = 'eastus'

@secure()
param adminPassword string

param customerName string = 'olasumbo'
param nameSeparator string = '-'

// Configure naming prefix
param CAFPrefix string = '${customerName}${nameSeparator}${environmentName}${nameSeparator}eus'

// Resource Group name
param resourceGroupName string = '${CAFPrefix}${nameSeparator}rg'

// Default tags
param tags object = {
  ModifiedBy: ''
  ModifiedDateTime: ''
  Startup: 'NA'
  Shutdown: 'NA'
  AutoScale: 'NA'
  Monitor: 'NA'
  CostCategory: 'Compute'
  Environment: environmentName
  Customer: customerName
}

// Create Resource Group
resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
  tags: tags
}

// Call submodule and deploy resources into the resource group
module submodule './Modules/submodule.bicep' = {
  scope: resourceGroup(resourceGroupName)
  name: 'submoduleDeployment'

  params: {
    location: location
    adminPassword: adminPassword
  }

  dependsOn: [
    rg
  ]
}
