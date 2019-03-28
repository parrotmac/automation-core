// Provides a connection to the MQTT broker. It may dispatch received messages to relevant adapters
// MqttCore attempts to be as agnostic to internal data formats as possible. Two different adapters may
// exhibit wildly different internal message formats. Routing is centered around topic structure.

import 'package:mqtt_client/mqtt_client.dart';
import 'package:uuid/uuid.dart';

typedef NamespacedSubscriptionHandler(List<String> topicParts, String eventPayload);

class MqttCore {
  MqttClient client;
  // namespace, handler
  Map<String, NamespacedSubscriptionHandler> subscriptionHandlers = {};

  // TODO(isaac) include authentication options
  MqttCore(String brokerAddress) {
    client = MqttClient(brokerAddress, new Uuid().v4());
    client.onConnected = this._onConnected;
  }

  void connect() async {
    await client.connect();
  }

  void _onConnected() {
    _attachSubscription();
    _setupListener();
  }

  void _attachSubscription() {
    // TODO: Manage subscriptions based on namespaces
    client.subscribe("#", MqttQos.exactlyOnce);
  }

  void _setupListener() {
    client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final topic = c[0].topic;

      final MqttPublishMessage receivedMessage = c[0].payload;
      final String messagePayload = MqttPublishPayload.bytesToStringAsString(receivedMessage.payload.message);

      this._handleReceivedMessage(topic, messagePayload);
    });
  }

  void _handleReceivedMessage(String topic, String payload) {
    final topicSegments = topic.split("/");
    final targetNamespace = topicSegments[0];
    if (this.subscriptionHandlers.containsKey(targetNamespace)) {
      this.subscriptionHandlers[targetNamespace](topicSegments, payload);
    } else {
      print("Received unhandled message: ${topic}: ${payload}");
    }
  }

  void addMessageHandler(String namespace, NamespacedSubscriptionHandler handler) {
    print("Setting new (possibly overwriting!) handler for namespace \"${namespace}\"");
    this.subscriptionHandlers[namespace] = handler;
  }

  void publishMessage(String topic, String message) {
    final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
    builder.addString(message);
    this.client.publishMessage(topic, MqttQos.exactlyOnce, builder.payload);
  }
  
}
