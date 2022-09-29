import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_pad/resources/colors.dart';
import 'package:game_pad/resources/icons.dart';

import '../../../../../../router/route_name.dart';
import '../../../../../../router/router.dart';

class ButtonLayoutLeft extends StatefulWidget {
  const ButtonLayoutLeft({Key? key}) : super(key: key);

  @override
  State<ButtonLayoutLeft> createState() => _ButtonLayoutLeftState();
}

class _ButtonLayoutLeftState extends State<ButtonLayoutLeft> {
  final List<String> log = <String>[];
  final TextStyle _textStyle = const TextStyle(
      color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700);
  bool selected = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        selected = !selected;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        AnimatedAlign(
          alignment: selected ? Alignment.bottomRight : Alignment.center,
          curve: Curves.linear,
          duration: const Duration(milliseconds: 300),
          child: SizedBox(
            child: Image.asset(
              AppIcons.buttonLayoutLeft,
              fit: BoxFit.contain,
            ),
          ),
        ),
        AnimatedAlign(
          alignment: selected ? Alignment.centerLeft : Alignment.center,
          curve: Curves.linear,
          duration: const Duration(milliseconds: 300),
          child: Container(

            height: 188,
            width: 150,
            margin: Platform.isIOS
                ? EdgeInsets.only(left: selected?128:0)
                : EdgeInsets.only(left: selected?80:0),
            child: SingleChildScrollView(
                child: DataTable(
                  headingRowHeight: 0,
                  sortColumnIndex: 0,
                  columnSpacing: 0,
                  horizontalMargin: 0,
                  showCheckboxColumn: false,
                  sortAscending: false,
                  onSelectAll: (bool? value) {
                    log.add('select-all: $value');
                  },
                  columns: <DataColumn>[
                    const DataColumn(
                      label: Text(''),
                      tooltip: '',
                    ),
                    const DataColumn(
                      label: Text(''),
                      tooltip: '',
                    ),
                    const DataColumn(
                      label: Text(''),
                      tooltip: '',
                    ),
                    DataColumn(
                      label: const Text(''),
                      tooltip: '',
                      numeric: true,
                      onSort: (int columnIndex, bool ascending) {
                        log.add('column-sort: $columnIndex $ascending');
                      },
                    ),
                  ],
                  rows: [
                    _dataRow(
                        icon: SvgPicture.asset(AppIcons.myGame), value: 'My Games'),
                    _dataRow(icon: SvgPicture.asset(AppIcons.menu), value: 'Menu'),
                  ],
                )),
          ),
        ),
        Container(
          width: double.infinity,
        ),
      ],
    );
  }

  DataRow _dataRow({Widget? icon, String? label, String? value}) {
    return DataRow(
      // key: Key(item['name']),
      onSelectChanged: (bool? selected) {},
      cells: <DataCell>[
        DataCell(
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 60,
            ),
            child: icon ??
                Text(
                  label ?? '',
                  style: _textStyle,
                ),
          ),
        ),
        DataCell(
          ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 40,
              ),
              child: SvgPicture.asset(AppIcons.rightWhite)),
        ),
        DataCell(
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 150,
            ),
            child: Text(
              value ?? '',
              style: _textStyle.copyWith(color: AppColor.greenLight),
            ),
          ),
          onTap: () {
            Routes.instance.navigateTo(routeName: RouteNames.choseButton);
          },
        ),
        DataCell(
          ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 40,
              ),
              child: SvgPicture.asset(AppIcons.right)),
        ),
      ],
    );
  }
}
