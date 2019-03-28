import 'package:automationCore/adapters/z2m.dart';
import 'package:automationCore/core/mqtt.dart';
import 'package:automationCore/devices/light_bulb/z2mBasicHue.dart';

class AutomationCore {
  start() {
    print("Starting automation core...");
    final mqtt = new MqttCore("mqtt.stag9.com");
    mqtt.connect();

    final zigbee2Mqtt = new Zigbee2MqttAdapter(mqtt);

    final basicHueBulbs = {
      // Bathroom lights
      new Z2mBasicHue("0x0017880103173f34", zigbee2Mqtt),
      new Z2mBasicHue("0x00178801031772a5", zigbee2Mqtt),
      new Z2mBasicHue("0x00178801034c2b40", zigbee2Mqtt),

      // Workshop lights
      new Z2mBasicHue("0x0017880104888c2c", zigbee2Mqtt),
      new Z2mBasicHue("0x0017880104888c11", zigbee2Mqtt),
      new Z2mBasicHue("0x0017880104888ab0", zigbee2Mqtt),

      // Server light
      new Z2mBasicHue("0x00178801023561cb", zigbee2Mqtt),
    };
  }
}
