function Get-IoTDeviceKey {
  <#
      .SYNOPSIS
      Get the device key for the device.
      .DESCRIPTION
      See the Synopsis.
      .EXAMPLE
      Get-IoTDeviceKey -iotConnString "HostName=myiothub.azure-devices.net;SharedAccessKeyName=iothubowner;SharedAccessKey=HwbPu8ZhK8sdfdsfgdsgdfsfdgM2KvRE=" -deviceId "MyFirstDevice"
  #>
  [cmdletbinding()]
  param(
    $iotConnString,
    $deviceId
  )
    
  $registryManager = [Microsoft.Azure.Devices.RegistryManager]::CreateFromConnectionString($iotConnString)
  $device = $registryManager.GetDeviceAsync($deviceId)
  $device = $device.Result
  $returndevice = New-Object -TypeName psobject -Property @{
    DeviceId = $device.Id
    DevicePrimaryKey = $device.Authentication.SymmetricKey.PrimaryKey
    DeviceSecondaryKey = $device.Authentication.SymmetricKey.SecondaryKey
  }
  return $returndevice
}