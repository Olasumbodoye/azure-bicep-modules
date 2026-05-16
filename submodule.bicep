param location string = resourceGroup().location

module networking './Modules/virtual_network.bicep' = {
  name: 'networkDeployment'

  params: {
    location: location
  }
}

module virtualMachine './Modules/virtual_machine.bicep' = {
  name: 'vmDeployment'

  params: {
    location: location
    subnetId: networking.outputs.subnetId
    adminPassword: 'Password1234!'
  }
}
