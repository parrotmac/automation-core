
import 'package:automationCore/adapters/z2m.dart';
import 'package:automationCore/types/device.dart';

class Z2mHueDimmerSwitch extends Device {
  Zigbee2MqttAdapter mqttAdapter;
  Z2mHueDimmerSwitch(String identifier, Zigbee2MqttAdapter mqttAdapter) : super(identifier) {
    this.mqttAdapter = mqttAdapter;
    // TODO: Setup binding
  }

  void messageReceived(String messageBody) {
    print(messageBody);
  }
}
