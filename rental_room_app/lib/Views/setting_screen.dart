import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:rental_room_app/Presenter/auth_service.dart';
import 'package:rental_room_app/config/asset_helper.dart';
import 'package:rental_room_app/themes/color_palete.dart';
import 'package:rental_room_app/themes/text_styles.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String? searchValue;
  bool isVisibleFilter = false;
  final AuthService _authService = AuthService();
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
              child: const Text(
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
                    child: const Icon(
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
            const Gap(20),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Container(
                    width: 50,
                    alignment: Alignment.center,
                    child: const Icon(
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
            const Gap(20),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Container(
                    width: 50,
                    alignment: Alignment.center,
                    child: const Icon(
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
            const Gap(20),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Container(
                    width: 50,
                    alignment: Alignment.center,
                    child: const Icon(
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
            const Gap(20),
            GestureDetector(
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirm'),
                      content: const Text('Are you sure you want to sign out?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyles.descriptionRoom.copyWith(
                              color: ColorPalette.grayText,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            try {
                              await _authService.signOut();
                              GoRouter.of(context).go('/log_in');
                            } catch (e) {
                              print("Đăng xuất thất bại: $e");
                            }
                          },
                          child: Text(
                            'Confirm',
                            style: TextStyles.descriptionRoom.copyWith(
                              color: ColorPalette.primaryColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Row(
                children: [
                  Container(
                    width: 50,
                    alignment: Alignment.center,
                    child: const Icon(
                      FontAwesomeIcons.signOut,
                      color: ColorPalette.primaryColor,
                      size: 20,
                    ),
                  ),
                  Text(
                    'Sign Out',
                    style: TextStyles.descriptionRoom.copyWith(
                      color: ColorPalette.primaryColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
