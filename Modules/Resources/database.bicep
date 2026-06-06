param location string = resourceGroup().location

var sqlServerName = 'sql${uniqueString(resourceGroup().id)}'

param databaseName string = 'assignmentdb'
param adminLogin string = 'sqladmin'

@secure()
param adminPassword string

resource sqlServer 'Microsoft.Sql/servers@2023-08-01-preview' = {
  name: sqlServerName
  location: location

  properties: {
    administratorLogin: adminLogin
    administratorLoginPassword: adminPassword
  }
}

resource database 'Microsoft.Sql/servers/databases@2023-08-01-preview' = {
  parent: sqlServer
  name: databaseName
  location: location

  sku: {
    name: 'Basic'
    tier: 'Basic'
  }
}
