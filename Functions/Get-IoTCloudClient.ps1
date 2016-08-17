function Get-IoTCloudClient {
  <#
      .SYNOPSIS
      Create a connection object to interact with IoT Hub.
      .DESCRIPTION
      See the Synopsis.
      .EXAMPLE
      $cloudClient = Get-IoTCloudClient - "HostName=myiothub.azure-devices.net;SharedAccessKeyName=iothubowner;SharedAccessKey=jkgyfjhhuytghji876tghj7w1QM2KvRE="
  #>
  [cmdletbinding()]
  param(
    $iotConnString
  )
  $cloudClient = [Microsoft.Azure.Devices.ServiceClient]::CreateFromConnectionString($iotConnString)
  return $cloudClient
}