import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_pad/resources/colors.dart';
import 'package:game_pad/resources/icons.dart';

class ButtonLayoutRight extends StatefulWidget {
  const ButtonLayoutRight({Key? key}) : super(key: key);

  @override
  State<ButtonLayoutRight> createState() => _ButtonLayoutRightState();
}

class _ButtonLayoutRightState extends State<ButtonLayoutRight> {
  final _list = [
    {'name': 'A', 'value': 'A'},
    {'name': 'B', 'value': 'B'},
    {'name': 'X', 'value': 'X'},
    {'name': 'Y', 'value': 'Y'},
    {'name': 'G', 'value': 'Open App'},
  ];
  final List<String> log = <String>[];
  final TextStyle _textStyle = const TextStyle(
      color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700);
  bool selected = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          selected = !selected;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedAlign(
          alignment: selected ? Alignment.bottomLeft : Alignment.center,
          curve: Curves.linear,
          duration: const Duration(milliseconds: 300),
          child: SizedBox(
              // alignment: Alignment.bottomLeft,
              // width: 445,
              // height: 303,
              child: Image.asset(
            AppIcons.buttonLayoutRight,
            fit: BoxFit.contain,
          )),
        ),
        AnimatedAlign(
          alignment: selected ? Alignment.topRight : Alignment.center,
          curve: Curves.linear,
          duration: const Duration(milliseconds: 300),
          child: Container(
            margin: const EdgeInsets.only(right: 24),
            height: 188,
            width: 262,
            child: MediaQuery(
              data: MediaQuery.of(context).removePadding(removeRight: true),
              child: RawScrollbar(
                thumbColor: AppColor.violet,
                thumbVisibility: true,
                radius: const Radius.circular(4),
                child: SingleChildScrollView(
                    padding: const EdgeInsets.only(right: 16),
                    child: DataTable(
                      headingRowHeight: 0,
                      sortColumnIndex: 0,
                      horizontalMargin: 0,
                      columnSpacing: 0,
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
                      rows: _list.map<DataRow>((dynamic item) {
                        return DataRow(
                          // key: Key(item['name']),
                          onSelectChanged: (bool? selected) {
                            log.add('row-selected: ${item['name']}');
                          },
                          cells: <DataCell>[
                            DataCell(ConstrainedBox(
                                constraints: const BoxConstraints(minWidth: 60),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: item['name'] == 'G'
                                      ? SvgPicture.asset(
                                          AppIcons.logoOpenApp)
                                      : Text(
                                          item['name'] ?? '',
                                          style: _textStyle,
                                        ),
                                ))),
                            DataCell(
                              ConstrainedBox(
                                  constraints: const BoxConstraints(maxWidth: 20),
                                  child: SvgPicture.asset(AppIcons.rightWhite)),
                            ),
                            DataCell(
                              ConstrainedBox(
                                constraints: const BoxConstraints(minWidth: 60),
                                child: Text(
                                  '${item['value']}',
                                  style: _textStyle.copyWith(
                                      color: AppColor.greenLight),
                                ),
                              ),
                              onTap: () {
                                log.add('cell-tap: ${item['value']}');
                              },
                            ),
                            DataCell(
                              ConstrainedBox(
                                  constraints: const BoxConstraints(maxWidth: 20),
                                  child: SvgPicture.asset(AppIcons.right)),
                            ),
                          ],
                        );
                      }).toList(),
                    )),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: double.infinity,
        ),
      ],
    );
  }
}
