import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:rental_room_app/themes/color_palete.dart';
import 'package:rental_room_app/themes/text_styles.dart';

class AllRoom extends StatefulWidget {
  const AllRoom({super.key});
  static final String routeName = "all_room";

  @override
  State<AllRoom> createState() => _AllRoomState();
}

class _AllRoomState extends State<AllRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorPalette.primaryColor,
        // leadingWidth: kDefaultIconSize * 3,
        leading: Container(
          width: double.infinity,
          child: InkWell(
            customBorder: CircleBorder(),
            onHighlightChanged: (param) {},
            splashColor: ColorPalette.primaryColor,
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              child: Icon(FontAwesomeIcons.arrowLeft),
            ),
          ),
        ),
        title: Container(
            child: Text('ROOMS',
                style: TextStyles.slo.bold.copyWith(
                  shadows: [
                    Shadow(
                      color: Colors.black12,
                      offset: Offset(3, 6),
                      blurRadius: 6,
                    )
                  ],
                ))),
        centerTitle: true,
        toolbarHeight: kToolbarHeight * 1.5,
      ),
    );
  }
}
