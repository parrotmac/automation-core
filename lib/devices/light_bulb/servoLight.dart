
import 'package:automationCore/adapters/servoLightSwitch.dart';
import 'package:automationCore/types/lights.dart';

class ServoLight implements BinaryLight {
  ServoLightCommAdapter commAdapter;
  ServoLight(String identifier, ServoLightCommAdapter commAdapter) {
    this.identifier = identifier;
    this.commAdapter = commAdapter;
  }
  
  @override
  String identifier;

  @override
  LightState state;

  @override
  bool isOn() {
    // TODO(isaac): Because servo-based lights can't read actual value,
    // returning null to isOn() threatens to make sense. However, it's probable
    // that null will be falsy, meaning this will always answer "no"
    return null;
  }

  @override
  void setStateOff() {
    // TODO: implement setStateOff
  }

  @override
  void setStateOn() {
    // TODO: implement setStateOn
  }

  @override
  void toggle() {
    // TODO: implement toggle
  }

}
