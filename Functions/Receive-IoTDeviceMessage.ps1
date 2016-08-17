function Receive-IoTDeviceMessage {
  <#
      .SYNOPSIS
      Receives a message from the device to cloud.
      .DESCRIPTION
      See the Synopsis.
      .EXAMPLE
      $message = Receive-IoTDeviceMessage -iotConnString "HostName=myIotHub.azure-devices.net;SharedAccessKeyName=iothubowner;SharedAccessKey=HwbPu8ZhKsdfgdgdsgdfg1cxmbHh7w1QM2KvRE="
  #>
  [cmdletbinding()]
  param(
    $iotConnString
  )
  $eventHubClient = [Microsoft.ServiceBus.Messaging.EventHubClient]::CreateFromConnectionString($iotConnString, "messages/events")
    
  $eventHubPartitions = $eventHubClient.GetRuntimeInformation().PartitionIds
    
  foreach ($partition in $eventHubPartitions) {
    $eventHubReceiver = $eventHubClient.GetDefaultConsumerGroup().CreateReceiver($partition, [DateTime]::UtcNow)
    while ($true) {
      $asyncOperation = $eventHubReceiver.ReceiveAsync()
      $eventData = $asyncOperation.Result
      $message = [System.Text.Encoding]::UTF8.GetString($eventData.GetBytes())
      return $message
    }
  }
}