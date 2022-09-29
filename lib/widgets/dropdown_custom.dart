import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_pad/resources/colors.dart';
import 'package:game_pad/resources/icons.dart';

class DropdownCustom<T> extends StatefulWidget {
  const DropdownCustom({
    Key? key,
    this.value,
    required this.onChanged,
    required this.items,
    required this.title,
    this.haveBorder = true,
    this.haveClearButton = true,
    this.dropdownHeight = 180,
    this.dropdownWidth = 180,
    this.showUp = false,
    this.dropdownBoxHeight = 30,
    this.valueColor = Colors.blue,
    this.onTap,
    this.onClear,
  }) : super(key: key);

  final String? value;
  final Function(String?) onChanged;
  final Function()? onClear;
  final dynamic items;
  final String title;
  final bool haveBorder;
  final bool haveClearButton;
  final double dropdownHeight;
  final double dropdownWidth;
  final bool showUp;
  final double dropdownBoxHeight;
  final Color valueColor;
  final Function? onTap;

  @override
  _DropdownCustomState createState() => _DropdownCustomState();
}

class _DropdownCustomState extends State<DropdownCustom> {
  GlobalKey key = GlobalKey();

  String? value;
  final ValueNotifier<String> _valueNotifier = ValueNotifier('');

  Offset get _getPositionOfWidget {
    RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);
    return position;
  }

  @override
  void initState() {
    value = widget.value ?? '';
    if (widget.items is List) {
      _valueNotifier.value = widget.value ?? '';
    } else if (widget.items is Map) {
      if (widget.items != null && widget.value != null) {
        _valueNotifier.value = widget.items[widget.value] ?? '';
      }
    }

    super.initState();
  }

  @override
  void didUpdateWidget(covariant DropdownCustom oldWidget) {
    value = widget.value;
    if (widget.items is List) {
      _valueNotifier.value = widget.value ?? '';
    } else if (widget.items is Map) {
      if (widget.items != null && widget.value != null) {
        _valueNotifier.value = widget.items[widget.value] ?? '';
      }
    }
    // _valueNotifier.value = widget.value!;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }
        _getPositionOfWidget;
        RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
        showDialog(
          context: context,
          barrierColor: Colors.transparent,
          barrierDismissible: true,
          builder: (context) => Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Stack(
                children: [
                  Positioned(
                    top: widget.showUp
                        ? _getPositionOfWidget.dy - 275
                        : _getPositionOfWidget.dy - 5,
                    left: _getPositionOfWidget.dx - (Platform.isIOS ? 45 : 0),
                    child: Column(
                      children: [
                        !widget.showUp
                            ? GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  color: Colors.transparent,
                                  height: widget.dropdownBoxHeight + 12,
                                  width: box.size.width,
                                ),
                              )
                            : const SizedBox(),
                        Container(
                          width: box.size.width,
                          constraints: BoxConstraints(
                            maxHeight: widget.dropdownHeight,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.violet3,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: (widget.items is Map) ? _map() : _list(),
                        ),
                        widget.showUp
                            ? GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  color: Colors.transparent,
                                  height: 45,
                                  width: box.size.width,
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: Container(
        key: key,
        height: widget.dropdownBoxHeight,
        decoration: BoxDecoration(
          color: AppColor.violet4,
          borderRadius: BorderRadius.circular(6),
          border: widget.haveBorder == true
              ? Border.all(color: AppColor.black1)
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ValueListenableBuilder<String>(
            valueListenable: _valueNotifier,
            builder: (_, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Text(
                      value,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: _textStyle(context),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  SvgPicture.asset(AppIcons.bottom)
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _list() {
    return ListView.builder(
      itemBuilder: (context, index) => InkWell(
          onTap: () {
            value = widget.items[index];
            _valueNotifier.value = widget.items[index];
            widget.onChanged(value);
            setState(() {});
            Navigator.pop(context);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.items[index],
                      style: _textStyle(context)?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                  ),
                  // value == widget.items[index] ||
                  if (_valueNotifier.value == widget.items[index]) ...[
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.check,
                        color: Colors.blue,
                        size: 18.r,
                      ),
                    )
                  ]
                ],
              ),
              const Divider(),
            ],
          )),
      itemCount: widget.items != null
          ? ((widget.items is Map)
                  ? widget.items.values.toList()
                  : widget.items)
              .length
          : 0,
    );
  }

  Widget _map() {
    List<Widget> children = [];
    children.add(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              '${widget.title}:',
              style: _textStyle(context),
            ),
          ),
          Divider(
            height: 1,
            color: AppColor.violet.withOpacity(0.2),
          ),
        ],
      ),
    );
    widget.items.forEach((key, value) {
      children.add(InkWell(
          onTap: () {
            setState(() {
              value = key.toString();
              _valueNotifier.value = value;
              widget.onChanged(key.toString());
            });
            Navigator.pop(context);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        value.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: _textStyle(context)?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                    if (value == key.toString())
                      Icon(
                        Icons.check,
                        color: Colors.blue,
                        size: 18.r,
                      ),
                    SvgPicture.asset(AppIcons.right)
                  ],
                ),
              ),
              Divider(
                height: 1,
                color: AppColor.violet.withOpacity(0.2),
              ),
            ],
          )));
    });
    return RawScrollbar(
      thumbColor: AppColor.violet,
      thumbVisibility: true,
      radius: const Radius.circular(6),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }

  TextStyle? _textStyle(BuildContext context) {
    return const TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        fontSize: 12,
        color: Colors.white);
  }
}
