import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rental_room_app/themes/color_palete.dart';
import 'package:rental_room_app/themes/text_styles.dart';

class FilterContainerWidget extends StatefulWidget {
  final String name;
  final Icon icon1;
  final Icon? icon2;
  final Function() onTapIconDown;
  final Function()? onTapIconUp;
  const FilterContainerWidget(
      {super.key,
      required this.name,
      required this.icon1,
      this.icon2,
      required this.onTapIconDown,
      this.onTapIconUp});

  @override
  State<FilterContainerWidget> createState() => _FilterContainerWidgetState();
}

class _FilterContainerWidgetState extends State<FilterContainerWidget> {
  @override
  Widget build(BuildContext context) {
    List<String> list = <String>['Standard', 'Loft', 'House'];
    // ignore: unused_local_variable
    String dropDownValue = list.first;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ColorPalette.grayText)),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Container(
            padding: const EdgeInsets.only(right: 2),
            child: Text(
              widget.name,
              style: TextStyles.defaultStyle.grayText.copyWith(fontSize: 12),
            ),
          ),
          GestureDetector(
            onTap: () {
              widget.onTapIconUp!();
            },
            child: widget.icon2 ??
                const SizedBox(
                  width: 12,
                ),
          ),
          GestureDetector(
              onTap: () {
                widget.onTapIconDown();
              },
              child: widget.icon1),
        ]),
      ),
    );
  }
}
