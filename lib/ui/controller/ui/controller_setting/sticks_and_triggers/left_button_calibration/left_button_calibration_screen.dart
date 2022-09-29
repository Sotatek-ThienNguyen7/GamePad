import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_pad/resources/colors.dart';
import 'package:game_pad/resources/global.dart';
import 'package:game_pad/resources/icons.dart';
import 'package:game_pad/ui/controller/ui/controller_widget.dart';
import 'package:game_pad/ui/controller/widgets/item_controller.dart';
import 'package:game_pad/widgets/button_cancel.dart';
import 'package:game_pad/widgets/common_dialog.dart';
import 'package:percent_indicator/percent_indicator.dart';

enum LeftStick { no, topEnd, bottomEnd, leftEnd, rightEnd, circular }

class LeftButtonCalibrationScreen extends StatefulWidget {
  const LeftButtonCalibrationScreen({Key? key}) : super(key: key);

  @override
  State<LeftButtonCalibrationScreen> createState() =>
      _LeftButtonCalibrationScreenState();
}

class _LeftButtonCalibrationScreenState
    extends State<LeftButtonCalibrationScreen> {
  final TextStyle _textStyle = const TextStyle(
      color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700);
  late LeftStick _leftStick;
  ValueNotifier<double>? percent = ValueNotifier(0.1);
  ValueNotifier<double>? percentTrigger = ValueNotifier(0.1);
  Map arguments = {};

  @override
  void initState() {
    _leftStick = LeftStick.no;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    arguments = (ModalRoute.of(context)!.settings.arguments ??{}) as Map;
    return ControllerWidget(
        actionRights: const ButtonCancel(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            itemController(
              leadingWidget: const SizedBox(),
              title: 'Left Button Calibration',
              subTitle: 'Follow the on screen indications.',
              showTrailing: false,
              titleStyle: _textStyle,
              subTitleStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            if(arguments['leftStick'] != null)
            _childStick(),
            if(arguments['leftTrigger'] != null)
              _childTrigger(),
            const Spacer(
              flex: 2,
            ),
          ],
        ));
  }


  Widget _childStick()  {
    switch (_leftStick) {
      case LeftStick.topEnd:
        return _item(
            width: 280,
            percent: 187 / 280,
            icon: SvgPicture.asset( AppIcons.leftStick),
            title: 'Move Left Stick to the top end.',
            onTap: () {
              _leftStick = LeftStick.bottomEnd;
              setState(() {});
            });
      case LeftStick.bottomEnd:
        return _item(
            width: 280,
            percent: 20 / 280,
            icon: SvgPicture.asset(AppIcons.leftStick),
            title: 'Move Left Stick to the bottom end.',
            rotate: 180,
            onTap: () {
              _leftStick = LeftStick.leftEnd;
              setState(() {});
            });
      case LeftStick.leftEnd:
        return _item(
            width: 280,
            percent: 119 / 280,
            rotate: 270,
            icon: SvgPicture.asset(AppIcons.leftStick),
            title: 'Move Left Stick to the left end. ',
            onTap: () {
              _leftStick = LeftStick.rightEnd;
              setState(() {});
            });
      case LeftStick.rightEnd:
        return _item(
            width: 280,
            percent: 255 / 280,
            rotate: 90,
            icon: SvgPicture.asset(AppIcons.leftStick),
            title: 'Move Left Stick to the right end. ',
            onTap: () {
              _leftStick = LeftStick.circular;
              setState(() {});
            });
      case LeftStick.circular:
        return ValueListenableBuilder(
            valueListenable: percent!,
            builder: (BuildContext context, double value, Widget? child) {
              return _item(
                  width: 280,
                  percent: value,
                  title:
                  'Move Left Stick with circular movement, following the ridge of the button.',
                  icon: SvgPicture.asset(AppIcons.reloadStick),
                  onTap: () async{
                    if(percent?.value ==  1.0){
                      await CommonShowDialog.showDialogCommon(
                        context,
                        titleText: 'Calibration completed',
                        contentText: 'Save this values for calibration?',
                        cancelButtonText: 'CLOSE',
                        confirmButtonText: 'SAVE',
                        onCancel: (){
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        onConfirm: (){
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        leading: SvgPicture.asset(AppIcons.noLs),
                      );
                    }
                    else{
                      percent = ValueNotifier(1.0);
                    }
                    setState(() {
                    });
                  });
            }
        );
      default:
        return _item(
            width: 280,
            percent: 20 / 280,
            title: 'Please don’t press the Left Trigger.',
            icon: SvgPicture.asset(AppIcons.noLs),
            onTap: () {
              _leftStick = LeftStick.topEnd;
              setState(() {});
            });
    }
  }
  Widget _childTrigger() {
    return ValueListenableBuilder(
        valueListenable: percentTrigger!,
      builder: (BuildContext context, double value, Widget? child) {
        return _item(
            width: 280,
            percent: value ,
            icon: SvgPicture.asset(value == 0.1 ?AppIcons.pullAndRelease:AppIcons.pushLeftTrigger ),
            title: value == 0.1 ?'Please don’t press the Left Trigger.':'Push the Left Trigger to the end. ',
            onTap: () async{
              if(value == 0.1){
                percentTrigger = ValueNotifier(0.35);
              }
              else if(value == 0.35){
                percentTrigger = ValueNotifier(1);
              }
              else if(value == 1){
                await CommonShowDialog.showDialogCommon(
                  context,
                  titleText: 'Calibration completed',
                  contentText: 'Save this values for calibration?',
                  cancelButtonText: 'CLOSE',
                  confirmButtonText: 'SAVE',
                  onCancel: (){
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  onConfirm: (){
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  leading: SvgPicture.asset(AppIcons.pullAndRelease),
                );
              }
              setState(() {});
            });
      }
    );
  }

  Widget _item({
    required String title,
    required double percent,
    required double width,
    required Widget icon,
    int animationDuration = 500,
    double lineHeight = 6,
    double rotate = 0,
    Function()? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: _textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 32,
        ),
        InkWell(
          onTap: onTap,
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(rotate / 360),
            child: icon,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        LinearPercentIndicator(
          alignment: MainAxisAlignment.center,
          width: width,
          barRadius: const Radius.circular(10),
          // linearGradientBackgroundColor: LinearGradient(
          //             begin: Alignment.bottomCenter,
          //             end: Alignment.topCenter,
          //             colors: <Color>[
          //               AppColor.black1,
          //               AppColor.black1.withOpacity(0.55),
          //             ],
          //           ),
          backgroundColor: AppColor.black1,
          animation: true,
          lineHeight: lineHeight,
          animationDuration: animationDuration,
          percent: percent,
          animateFromLastPercent: true,
          progressColor: AppColor.greenLight,
        ),
      ],
    );
  }
}