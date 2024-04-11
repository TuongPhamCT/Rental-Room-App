import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:rental_room_app/config/asset_helper.dart';
import 'package:rental_room_app/themes/color_palete.dart';
import 'package:rental_room_app/themes/text_styles.dart';
import 'package:rental_room_app/widgets/filter_container_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String? searchValue;
  bool isVisibleFilter = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorPalette.primaryColor,
        title: Text('SETTING',
            style: TextStyles.slo.bold.copyWith(
              shadows: [
                const Shadow(
                  color: Colors.black12,
                  offset: Offset(3, 6),
                  blurRadius: 6,
                )
              ],
            )),
        centerTitle: true,
        toolbarHeight: kToolbarHeight * 1.5,
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const Gap(15),
            Container(
              alignment: Alignment.center,
              child: Container(
                height: 132,
                width: 132,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(AssetHelper.avatar),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Gap(10),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Nguyen Nguoi Thue',
                style: TextStyles.title,
              ),
            ),
            const Gap(5),
            Container(
              alignment: Alignment.center,
              child: Text(
                'nguoithue@gmail.com',
                style: TextStyles.descriptionRoom.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            const Gap(50),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Container(
                    width: 50,
                    alignment: Alignment.center,
                    child: Icon(
                      FontAwesomeIcons.user,
                      color: ColorPalette.primaryColor,
                      size: 20,
                    ),
                  ),
                  Text(
                    'Edit Profile',
                    style: TextStyles.descriptionRoom.copyWith(
                      color: ColorPalette.primaryColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Gap(20),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Container(
                    width: 50,
                    alignment: Alignment.center,
                    child: Icon(
                      FontAwesomeIcons.language,
                      color: ColorPalette.primaryColor,
                      size: 20,
                    ),
                  ),
                  Text(
                    'Change Language',
                    style: TextStyles.descriptionRoom.copyWith(
                      color: ColorPalette.primaryColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Gap(20),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Container(
                    width: 50,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.add_alert_rounded,
                      color: ColorPalette.primaryColor,
                      size: 25,
                    ),
                  ),
                  Text(
                    'Notification Setting',
                    style: TextStyles.descriptionRoom.copyWith(
                      color: ColorPalette.primaryColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Gap(20),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Container(
                    width: 50,
                    alignment: Alignment.center,
                    child: Icon(
                      FontAwesomeIcons.solidCircleQuestion,
                      color: ColorPalette.primaryColor,
                      size: 20,
                    ),
                  ),
                  Text(
                    'Help Center',
                    style: TextStyles.descriptionRoom.copyWith(
                      color: ColorPalette.primaryColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Gap(20),
          ],
        ),
      ),
    );
  }
}
