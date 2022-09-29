import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_pad/resources/colors.dart';
import 'package:game_pad/resources/icons.dart';

class ButtonLayoutBack extends StatefulWidget {
  const ButtonLayoutBack({Key? key}) : super(key: key);

  @override
  State<ButtonLayoutBack> createState() => _ButtonLayoutBackState();
}

class _ButtonLayoutBackState extends State<ButtonLayoutBack> {
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
        const SizedBox(
          width: double.infinity,
        ),
        AnimatedAlign(
          alignment: selected ? Alignment.topCenter : Alignment.bottomCenter,
          curve: Curves.linear,
          duration: const Duration(milliseconds: 300),
          child: Container(
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.bottomLeft,
              width: 378,
              height: 93,
              child: Image.asset(
                AppIcons.buttonLayoutBack,
                fit: BoxFit.contain,
              )),
        ),
        AnimatedAlign(
          alignment: selected ? Alignment.center : Alignment.bottomCenter,
          curve: Curves.linear,
          duration: const Duration(milliseconds: 300),
          child: Container(
            margin: EdgeInsets.only(top: 50),
            width: 378,
            // height: 93,
            child: Row(
              children: [
                Expanded(
                  child: DataTable(
                    horizontalMargin: 5.0,
                    columnSpacing: 5.0,
                    headingRowHeight: 0,
                    sortColumnIndex: 0,
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
                      _dataRow(label: 'RB', value: 'RB'),
                      _dataRow(label: 'RT', value: 'RT'),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: DataTable(
                    horizontalMargin: 5.0,
                    columnSpacing: 5.0,
                    headingRowHeight: 0,
                    sortColumnIndex: 0,
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
                      _dataRow(label: 'LB', value: 'LB'),
                      _dataRow(label: 'LT', value: 'LT'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }

  DataRow _dataRow({String? label, String? value}) {
    return DataRow(
      // key: Key(item['name']),
      onSelectChanged: (bool? selected) {},
      cells: <DataCell>[
        DataCell(
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 20,
            ),
            child: Text(
              label ?? '',
              style: _textStyle,
            ),
          ),
        ),
        DataCell(
          ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 20,
              ),
              child: SvgPicture.asset(AppIcons.rightWhite)),
        ),
        DataCell(
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 20,
            ),
            child: Text(
              value ?? '',
              style: _textStyle.copyWith(color: AppColor.greenLight),
            ),
          ),
          onTap: () {},
        ),
        DataCell(
          ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 20,
              ),
              child: SvgPicture.asset(AppIcons.bottom)),
        ),
      ],
    );
  }
}
