import 'package:automationCore/adapters/baseMqtt.dart';

class ServoDoorLock implements BaseMqttAdapter {
  @override
  String namespace;

  @override
  void subscriptionHandler(List<String> topicParts, String eventPayload) {
    // TODO: implement subscriptionHandler
  }
}
