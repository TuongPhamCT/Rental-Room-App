import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:go_router/go_router.dart';
import 'package:rental_room_app/Views/home_screen.dart';
import 'package:rental_room_app/themes/color_palete.dart';
import 'package:rental_room_app/themes/text_styles.dart';
import 'package:rental_room_app/widgets/border_container.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YourRoomScreen extends StatefulWidget {
  const YourRoomScreen({super.key});
  static const String routeName = "detail_room";

  @override
  State<YourRoomScreen> createState() => _YourRoomScreenState();
}

class _YourRoomScreenState extends State<YourRoomScreen> {
  int _selectedIndex = 1;

  bool _isOwner = false;

  @override
  void initState() {
    super.initState();
    _loadInfor();
  }

  // Phương thức để load thông tin từ SharedPreferences
  Future<void> _loadInfor() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      _isOwner = _prefs.getBool('isOwner') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorPalette.backgroundColor,
        title: Text('YOUR ROOM',
            style: TextStyles.slo.bold.copyWith(
              color: ColorPalette.primaryColor,
              shadows: [
                const Shadow(
                  color: Colors.black12,
                  offset: Offset(3, 3),
                  blurRadius: 6,
                )
              ],
            )),
        centerTitle: true,
        toolbarHeight: kToolbarHeight * 1.5,
      ),
      body: const Center(
        child: BorderContainer(
            child: Text('You need to rental a room for use this function!!!')),
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
              GoRouter.of(context).go('/notification_list');
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
        ],
      ),
    );
  }
}
