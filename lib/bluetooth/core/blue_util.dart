import 'package:app_settings/app_settings.dart';

class BluetoothUtil {

  BluetoothUtil._();
  static final instance = BluetoothUtil._();

  void openBluetooth() {
    AppSettings.openBluetoothSettings();
  }

}