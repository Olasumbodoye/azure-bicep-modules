param location string = resourceGroup().location

var storageAccountName = toLower('st${uniqueString(resourceGroup().id)}')

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageAccountName
  location: location

  sku: {
    name: 'Standard_LRS'
  }

  kind: 'StorageV2'
}

output storageAccountName string = storageAccount.name
output storageAccountId string = storageAccount.id
