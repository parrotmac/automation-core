import 'package:automationCore/core/mqtt.dart';

abstract class BaseMqttAdapter {
  String namespace; // Basically mqtt topic prefix
  void subscriptionHandler(List<String> topicParts, String eventPayload);
}
