import 'package:automationCore/adapters/baseMqtt.dart';

class ServoLightCommAdapter implements BaseMqttAdapter {
  @override
  String namespace;

  @override
  void subscriptionHandler(List<String> topicParts, String eventPayload) {
    // TODO: implement subscriptionHandler
  }
}
