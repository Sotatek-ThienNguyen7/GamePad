import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_pad/resources/icons.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:game_pad/widgets/common_dialog.dart';

class BatteryDefault extends StatefulWidget {
  const BatteryDefault({Key? key}) : super(key: key);

  @override
  State<BatteryDefault> createState() => _BatteryDefaultState();
}

class _BatteryDefaultState extends State<BatteryDefault> {
  final Battery _battery = Battery();
  BatteryState? _batteryState;
  StreamSubscription<BatteryState>? _batteryStateSubscription;
  int _batteryLevel = 100;
  late Timer timer;
  bool? _isInPowerSaveMode;

  @override
  void initState() {
    super.initState();
    getBatteryState();
    checkBatterSaveMode();
    Timer.periodic(const Duration(seconds: 5), (timer) {
      getBatteryLevel();
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (_batteryStateSubscription != null) {
      _batteryStateSubscription!.cancel();
    }
  }

  void getBatteryState() {
    _batteryStateSubscription =
        _battery.onBatteryStateChanged.listen((BatteryState state) {
      if (mounted) {
        setState(() {
          _batteryState = state;
        });
      }
    });
  }

  getBatteryLevel() async {
    // var level = await _battery.batteryLevel;
    if (mounted) {
      setState(() {
        _batteryLevel = 100; //level;
      });
    }
  }

  Future<void> checkBatterSaveMode() async {
    final isInPowerSaveMode = await _battery.isInBatterySaveMode;
    if (mounted) {
      setState(() {
        _isInPowerSaveMode = isInPowerSaveMode;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CommonShowDialog.showDialogCommon(
          context,
          leading: SvgPicture.asset(AppIcons.icFullBattery),
          titleText: 'Controller is fully charged',
          contentText:
              'Your controller has now enough battery power. You can unplug your controller.',
          cancelButtonText: 'CLOSE',
          showConfirm: false,
          confirmButtonText: '',
        );
      },
      child: Row(
        children: [
          Text(
            '$_batteryLevel%',
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            width: 4,
          ),
          SvgPicture.asset(_imageBattery(_batteryState, _batteryLevel)),
        ],
      ),
    );
  }

  String _imageBattery(BatteryState? batteryState, int? batteryLevel) {
    switch (batteryState) {
      case BatteryState.full:
        return AppIcons.fullBattery;
      case BatteryState.charging:
        return AppIcons.charge;
      case BatteryState.discharging:
        // TODO: Handle this case.
        break;
      case BatteryState.unknown:
        // TODO: Handle this case.
        break;
      default:
    }
    if (_batteryLevel < 10) {
      return AppIcons.lowBattery;
    } else {
      return AppIcons.fullBattery;
    }
  }
}
