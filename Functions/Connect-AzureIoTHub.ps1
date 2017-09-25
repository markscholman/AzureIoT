function Connect-AzureIoTHub {
    <#
        .SYNOPSIS
        Connect device to IoT Hub.
        .DESCRIPTION
        See the Synopsis.
        .EXAMPLE
        Connect-AzureIoTHub -iotConnString "HostName=myiothub.azure-devices.net;SharedAccessKeyName=iothubowner;SharedAccessKey=HwbPu8ZhK8sdfdsfgdsgdfsfdgM2KvRE=" -deviceId "MyFirstDevice"
    #>
    [cmdletbinding()]
    param(
      $iotConnString,
      $deviceId
    )
    $paramSet = @{
      iotConnString = $iotConnString
      deviceId  = $deviceId
    }

    $device = Get-IoTDeviceKey @paramSet
    if ($device.deviceId -eq $null) {
      $device = Register-IoTDevice @paramSet
    }
    return $device 
}
