param location string = resourceGroup().location

@secure()
param adminPassword string

module networking './Resources/virtual_network.bicep' = {
  name: 'networkDeployment'

  params: {
    location: location
  }
}

module virtualMachine './Resources/virtual_machine.bicep' = {
  name: 'vmDeployment'

  params: {
    location: location
    subnetId: networking.outputs.subnetId
    adminPassword: adminPassword
  }
}

module storage './Resources/storage_account.bicep' = {
  name: 'storageDeployment'

  params: {
    location: location
  }
}

module database './Resources/database.bicep' = {
  name: 'databaseDeployment'

  params: {
    location: location
    adminPassword: adminPassword
  }
}

module functionApp './Resources/function_app.bicep' = {
  name: 'functionDeployment'

  params: {
    location: location
  }
}
