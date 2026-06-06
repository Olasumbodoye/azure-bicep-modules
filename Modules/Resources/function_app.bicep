param location string = resourceGroup().location
param functionAppName string = 'assignment-function'

resource servicePlan 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: '${functionAppName}-plan'
  location: location

  sku: {
    name: 'Y1'
    tier: 'Dynamic'
  }

  kind: 'functionapp'
}

resource functionApp 'Microsoft.Web/sites@2023-12-01' = {
  name: functionAppName
  location: location
  kind: 'functionapp'

  properties: {
    serverFarmId: servicePlan.id
  }
}
