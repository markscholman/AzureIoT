function Send-IoTCloudMessage {
  <#
      .SYNOPSIS
      Sends a message from the cloud to the Device.
      .DESCRIPTION
      See the Synopsis.
      .EXAMPLE
      Send-IoTCloudMessage -messageString "Hello world" -cloudClient $cloudClient
  #>
  [cmdletbinding()]
  param(
    $deviceId,
    $messageString,
    $cloudClient
  )
  $messagetosend = [Microsoft.Azure.Devices.Message]([Text.Encoding]::ASCII.GetBytes($messageString))
  $cloudClient.SendAsync($deviceId, $messagetosend)
}