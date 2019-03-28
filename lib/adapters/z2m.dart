// zigbee2mqtt adapter

import 'package:automationCore/adapters/baseMqtt.dart';
import 'package:automationCore/core/mqtt.dart';

class Zigbee2MqttAdapter implements BaseMqttAdapter {
  @override
  String namespace = "zigbee2mqtt";
  MqttCore mqttCore;

  Zigbee2MqttAdapter(MqttCore mqttCore) {
    this.mqttCore = mqttCore;
    mqttCore.addMessageHandler("zigbee2mqtt", this.subscriptionHandler);
  }

  @override
  subscriptionHandler(List<String> topicParts, String eventPayload) {
    print("zigbee2mqtt message (from device ${topicParts[1]}) ${eventPayload}");
  }

  void SendDeviceSet(String deviceIdentifier, String body) {
    final destinationTopic = "${this.namespace}/${deviceIdentifier}/set";
    this.mqttCore.publishMessage(destinationTopic, body);
  }

}
