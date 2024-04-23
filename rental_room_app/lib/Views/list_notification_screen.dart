import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:go_router/go_router.dart';
import 'package:rental_room_app/themes/color_palete.dart';
import 'package:rental_room_app/themes/text_styles.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListNotificationScreen extends StatefulWidget {
  const ListNotificationScreen({super.key});

  @override
  State<ListNotificationScreen> createState() => _ListNotificationScreenState();
}

class _ListNotificationScreenState extends State<ListNotificationScreen> {
  int _selectedIndex = 2;
  late bool _isOwner;

  @override
  void initState() {
    super.initState();
    _getUserInfoFromSharedPreferences();
  }

  Future<void> _getUserInfoFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isOwner = prefs.getBool('isOwner') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Notification',
            style: TextStyles.title.copyWith(
              fontSize: 32,
              shadows: [
                const Shadow(
                  color: Colors.black12,
                  offset: Offset(3, 6),
                  blurRadius: 6,
                )
              ],
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text('Notification Screen'),
      ),
      bottomNavigationBar: SalomonBottomBar(
          backgroundColor: ColorPalette.backgroundColor,
          currentIndex: _selectedIndex,
          onTap: (id) {
            setState(() {
              _selectedIndex = id;
            });
            switch (id) {
              case 0:
                GoRouter.of(context).go('/home');
                break;
              case 1:
                GoRouter.of(context).go('/your_room');
                break;
              case 2:
                GoRouter.of(context).go('/notification');
                break;
              case 3:
                GoRouter.of(context).go('/setting');
                break;
              default:
                break;
            }
          },
          items: [
            SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.house,
                  color: ColorPalette.primaryColor,
                  size: 20,
                ),
                title: const Text(
                  'Home',
                  style: TextStyles.bottomBar,
                )),
            if (!_isOwner)
              SalomonBottomBarItem(
                  icon: const Icon(
                    FontAwesomeIcons.doorOpen,
                    color: ColorPalette.primaryColor,
                    size: 20,
                  ),
                  title: const Text(
                    'Your Room',
                    style: TextStyles.bottomBar,
                  )),
            if (_isOwner)
              SalomonBottomBarItem(
                  icon: const Icon(
                    FontAwesomeIcons.chartLine,
                    color: ColorPalette.primaryColor,
                    size: 20,
                  ),
                  title: const Text(
                    'Statistic',
                    style: TextStyles.bottomBar,
                  )),
            SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.bell,
                  color: ColorPalette.primaryColor,
                  size: 20,
                ),
                title: const Text(
                  'Notification',
                  style: TextStyles.bottomBar,
                )),
            SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.gear,
                  color: ColorPalette.primaryColor,
                  size: 20,
                ),
                title: const Text(
                  'Setting',
                  style: TextStyles.bottomBar,
                )),
          ]),
    );
  }
}
