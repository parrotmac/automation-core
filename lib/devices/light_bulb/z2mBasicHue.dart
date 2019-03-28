
import 'package:automationCore/adapters/z2m.dart';
import 'package:automationCore/types/lights.dart';

class Z2mBasicHue implements DimmingFadeLight {
  Zigbee2MqttAdapter zigbee2mqttAdapter;
  Z2mBasicHue(String identifier, Zigbee2MqttAdapter z2mAdapter) {
    this.zigbee2mqttAdapter = z2mAdapter;
  }

  @override
  int brightnessPercent;

  @override
  String identifier;

  @override
  LightState state;

  @override
  int getBrightness() {
    // TODO: implement getBrightness
    return null;
  }

  @override
  bool isOn() {
    return this.state == LightState.On;
  }

  @override
  void setBrightness(int percent) {
    // TODO: implement setBrightness
  }

  @override
  void setBrightnessWithFade(int percent, int fadeMilliseconds) {
    // TODO: implement setBrightnessWithFade
  }

  @override
  void setStateOff() {
    // TODO: Do real JSON
    this.zigbee2mqttAdapter.SendDeviceSet(this.identifier, '{"state": "OFF"}');
  }

  @override
  void setStateOn() {
    // TODO: Do real JSON
    this.zigbee2mqttAdapter.SendDeviceSet(this.identifier, '{"state": "ON"}');
  }

  @override
  void toggle() {
    if(isOn()) {
      setStateOff();
    } else {
      setStateOn();
    }
  }

}
