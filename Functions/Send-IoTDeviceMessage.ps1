function Send-IoTDeviceMessage {
  <#
      .SYNOPSIS
      Sends a message from the device to the IoT Hub.
      .DESCRIPTION
      See the Synopsis.
      .EXAMPLE
      Send-IoTDeviceMessage -messageString "Hello world" -deviceClient $deviceClient
  #>
  [cmdletbinding()]
  param(
    $messageString = "Foo",
    $deviceClient
  )
  $messagetosend = [Microsoft.Azure.Devices.Client.Message]([Text.Encoding]::ASCII.GetBytes($messageString))
  $deviceClient.SendEventAsync($messagetosend)
}