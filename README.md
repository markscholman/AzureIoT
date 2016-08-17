# AzureIoT
A module for interacting with Azure IoT hub.

This module can act as a device client interacting with Azure IoT Hub or as a cloud client listening to Azure IoT Hub 
for events from devices and send messages to devices.

See help for each function how to interact.
Just remember when sending a message from the device, you need to receive it with the Cloud Client receiver and when sending message from the Cloud you need to receive it with the Device Client

```PowerShell
#To Operate the Device Side of the IoT Hub
#region RegisterDevice
$deviceParams = @{
    iotConnString = "HostName=myIoTHib.azure-devices.net;SharedAccessKeyName=iothubowner;SharedAccessKey=HwbsdfsfsdfsdgsdgdfmbHh7w1QM2KvRE="
    deviceId = "MyTestDevice100"
}
$device = Register-IoTDevice @deviceParams

$device 
#endregion

#region Create a DeviceClient
$deviceClientParams = @{
    deviceId = $device.DeviceId
    deviceKey = $device.DevicePrimaryKey
    iotHubUri = "myIoTHub.azure-devices.net"
}
$deviceClient = Get-IoTDeviceClient @deviceClientParams 
$deviceClient
#endregion

#region send message from device
$deviceMessageParams = @{
    deviceClient = $deviceClient
    messageString = "Hello World to Cloud"
}
Send-IoTDeviceMessage @deviceMessageParams
#endregion

#region Receive message from cloud
$message = Receive-IoTCloudMessage -deviceClient $deviceClient
$message 
$message[1] 
#endregion

#To operate the Cloud site of the IoT hub:
#region Create a CloudClient
$CloudClientParams = @{
    iotConnString = "HostName=myIoTHub.azure-devices.net;SharedAccessKeyName=iothubowner;SharedAccessKey=HwbsdfsfsdfsdgsdgdfmbHh7w1QM2KvRE="
}
$cloudClient = Get-IoTCloudClient @CloudClientParams 
$cloudClient    00:01:00         Microsoft.Azure.Devices.IotHubConnection            
#endregion

#region send message from Cloud
$cloudMessageParams = @{
    deviceId = "MyTestDevice100"
    messageString = "Hello World to Device"
    cloudClient = $cloudClient
}
Send-IoTCloudMessage @cloudMessageParams
#endregion

#region Receive message from Device
$message = Receive-IoTDeviceMessage -iotConnString "HostName=myIoTHub.azure-devices.net;SharedAccessKeyName=iothubowner;SharedAccessKey=HwbsdfsfsdfsdgsdgdfmbHh7w1QM2KvRE="
#endregion
```

## Installation
#### Download from PowerShell Gallery (PowerShell v5+)
``` powershell
Install-Module -name AzureIoT
```

#### Download from GitHub repository
* Download the repository
* Unblock the zip file
* Extract the folder to a module path (e.g. $home\Documents\WindowsPowerShell\Modules)

