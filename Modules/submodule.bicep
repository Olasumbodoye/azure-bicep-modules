param location string = resourceGroup().location

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
    adminPassword: 'Password1234!'
  }
}
