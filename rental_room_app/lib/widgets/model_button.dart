import 'package:flutter/material.dart';
import 'package:rental_room_app/themes/text_styles.dart';

class ModelButton extends StatelessWidget {
  final Function() onTap;
  final String name;
  final Color color;
  final double width;
  const ModelButton(
      {super.key,
      required this.onTap,
      required this.name,
      required this.color,
      required this.width});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width,
        alignment: Alignment.center,
        child: Container(
          width: width,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            name,
            style: TextStyles.buttonName,
          ),
        ),
      ),
    );
  }
}
