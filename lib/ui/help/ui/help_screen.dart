import 'dart:io' show Platform; //at the top

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/icons.dart';
import '../../controller/ui/controller_widget.dart';
import '../../controller/widgets/item_controller.dart';
import '../model/help.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final List<Help> listHelp = [
    Help(
        question: 'Which phones are compatible?',
        answer: '''Max size fit for the GSPECS One is 165mm wide and 9mm thick
List some of the largest phones (Fits iPhone 13 Pro Max and Samsung Galaxy S22 Ultra)
Remove phone cover for a better fit/experience'''),
    Help(question: 'What mobile operating systems are compatible?', answer: ''),
    Help(question: 'What is the battery life of the GSPECS One?', answer: ''),
    Help(question: 'What platforms are supported?', answer: '')
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
        color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700);

    return ControllerWidget(
      margin: EdgeInsets.only(left: Platform.isIOS?36:60, right: Platform.isIOS?36:60),
      child: Column(
        children: [
          itemController(
            leadingWidget: SvgPicture.asset(
              AppIcons.iconHelp,
              height: 32,
              width: 32,
            ),
            title: 'Help',
            showTrailing: false,
            titleStyle: textStyle,
            subTitleStyle: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w700),
          ),
          Expanded(
            child: Padding(
              padding: Platform.isIOS
                  ? const EdgeInsets.only(top: 15, left: 48)
                  : const EdgeInsets.only(top: 15, left: 32),
              child: ListView.builder(
                  itemCount: listHelp.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        listHelp[index].question!,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 14),
                      ),
                      subtitle: Text(
                        listHelp[index].answer!,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 12),
                      ),
                      trailing: SvgPicture.asset(
                        AppIcons.iconUp,
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
