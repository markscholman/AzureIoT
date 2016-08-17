function Get-IoTDeviceClient {
  <#
      .SYNOPSIS
      Create a connection object to interact with IoT Hub.
      .DESCRIPTION
      See the Synopsis.
      .EXAMPLE
      $deviceClient = Get-IoTDeviceClient -iotHubUri myiothub.azure-devices.net -deviceId SampleDevice -deviceKey klsdjkjfdsfh8weifjkhauwhfre=
  #>
  [cmdletbinding()]
  param(
    $iotHubUri,
    $deviceId,
    $deviceKey
  )
  $deviceAuthToken = New-Object Microsoft.Azure.Devices.Client.DeviceAuthenticationWithRegistrySymmetricKey($deviceId, $deviceKey)
  $deviceClient = [Microsoft.Azure.Devices.Client.DeviceClient]::Create($iotHubUri, $deviceAuthToken)
  return $deviceClient
}