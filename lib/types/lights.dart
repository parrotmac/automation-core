import 'package:automationCore/types/device.dart';

class LightRGBColor {
  int redPercent;
  int greenPercent;
  int bluePercent;
}

class LightTemperature {
  int warmth; // 0 to 1000 (is that right?)
}

enum LightState {
  Unknown,
  On,
  Off,
}

abstract class BinaryLight extends Device {
  LightState state;
  BinaryLight(String identifier) : super(identifier);

  void setStateOn() {
    throw "setStateOn() has not been implemented";
  }
  void setStateOff() {
    throw "setStateOff() has not been implemented";
  }

  bool isOn() {
    return this.state == LightState.On;
  }

  void toggle() {
    if(this.isOn()) {
      this.setStateOff();
    } else {
      this.setStateOn();
    }
  }
}

abstract class DimmingLight extends Device implements BinaryLight {
  int brightnessPercent; // 0 to 100
  DimmingLight(String identifier) : super(identifier);

  void setBrightness(int percent) {
    this.brightnessPercent = percent;
  }

  int getBrightness() {
    return this.brightnessPercent;
  }
}

abstract class DimmingFadeLight extends Device implements DimmingLight {
  DimmingFadeLight(String identifier) : super(identifier);

  void setBrightnessWithFade(int percent, int fadeMilliseconds);
}

abstract class DimmingFadeTemperatureLight extends Device implements DimmingFadeLight {
  DimmingFadeTemperatureLight(String identifier) : super(identifier);

  void setColorTemperature(LightTemperature colorTemp);
  LightTemperature geColorTemperature();
}

abstract class DimmingFadeRGBLight extends Device implements DimmingFadeLight {
  DimmingFadeRGBLight(String identifier) : super(identifier);

  void setRGB(LightRGBColor lightColor);
  LightRGBColor getRGB();
}

abstract class DimmingFadeRGBTemperatureLight extends Device implements DimmingFadeTemperatureLight, DimmingFadeRGBLight {
  DimmingFadeRGBTemperatureLight(String identifier) : super(identifier);
}
