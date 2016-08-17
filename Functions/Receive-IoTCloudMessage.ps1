function Receive-IoTCloudMessage {
  <#
      .SYNOPSIS
      Receives a message from the cloud to the device.
      .DESCRIPTION
      See the Synopsis.
      .EXAMPLE
      $message = Receive-IoTCloudMessage -deviceClient $deviceClient
      $message
  #>
  [cmdletbinding()]
  param(
    $deviceClient
  )    
  while ($true) {
    $asyncOperation = $deviceClient.ReceiveAsync()
    $message = $asyncOperation.Result
    if ($message) {
      try {
        $text = [System.Text.Encoding]::ASCII.GetString($message.GetBytes())
        $deviceClient.CompleteAsync($message)
        return $text
      } catch {
        $deviceClient.AbandonAsync($message)
      }
    } else {
      Start-Sleep -Seconds 5
    }
  }
}
