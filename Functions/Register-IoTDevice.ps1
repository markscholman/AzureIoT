function Register-IoTDevice {
  <#
      .SYNOPSIS
      Registers an device to IoT Hub.
      .DESCRIPTION
      See the Synopsis.
      .EXAMPLE
      Register-IoTDevice -iotConnString "HostName=myiothub.azure-devices.net;SharedAccessKeyName=iothubowner;SharedAccessKey=HwbPu8ZhK8sdfdsfgdsgdfsfdgM2KvRE=" -deviceId "MyFirstDevice"
  #>
  [cmdletbinding()]
  param(
    $iotConnString,
    $deviceId
  )
    
  $registryManager = [Microsoft.Azure.Devices.RegistryManager]::CreateFromConnectionString($iotConnString)

  $newdevice = New-Object -TypeName Microsoft.Azure.Devices.Device -ArgumentList $deviceId
  $device = $registryManager.AddDeviceAsync($newdevice)
  $device.Exception
  $device = $device.Result
  $returndevice = New-Object -TypeName psobject -Property @{
    DeviceId = $device.Id
    DevicePrimaryKey = $device.Authentication.SymmetricKey.PrimaryKey
    DeviceSecondaryKey = $device.Authentication.SymmetricKey.SecondaryKey
  }
  return $returndevice
}