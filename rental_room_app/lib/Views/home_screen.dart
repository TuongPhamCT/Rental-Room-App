import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:rental_room_app/Views/all_room_screen.dart';
import 'package:rental_room_app/Views/bottom_bar.dart';
import 'package:rental_room_app/config/asset_helper.dart';
import 'package:rental_room_app/config/image_helper.dart';
import 'package:rental_room_app/themes/color_palete.dart';
import 'package:rental_room_app/themes/text_styles.dart';
import 'package:rental_room_app/widgets/filter_container_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static final String routeName = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isVisiable = false;
  bool isTenant = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        color: ColorPalette.backgroundColor,
        child: Column(
          children: [
            Gap(30),
            Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text('WELCOME',
                          style: TextStyle(
                              fontSize: 10, color: ColorPalette.grayText)),
                      Text(
                        'Nguyễn Văn A',
                        style: TextStyle(
                            fontSize: 16, color: ColorPalette.primaryColor),
                      ),
                    ],
                  ),
                  Gap(15),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(AssetHelper.avatar),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Gap(20),
            GestureDetector(
              onTap: () {
                setState(() {
                  isVisiable = !isVisiable;
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.filter,
                    color: ColorPalette.primaryColor,
                    size: 15,
                  ),
                  Gap(10),
                  Text(
                    'Filter',
                    style: TextStyle(
                        fontSize: 12, color: ColorPalette.primaryColor),
                  ),
                ],
              ),
            ),
            Gap(10),
            Container(
              alignment: Alignment.centerLeft,
              child: Visibility(
                visible: isVisiable,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilterContainerWidget(
                      name: 'Area',
                      icon1: Icon(
                        FontAwesomeIcons.arrowUp,
                        color: ColorPalette.primaryColor,
                        size: 10,
                      ),
                      icon2: Icon(
                        FontAwesomeIcons.arrowDown,
                        color: ColorPalette.primaryColor,
                        size: 10,
                      ),
                      onTapIconDown: () {},
                      onTapIconUp: () {},
                    ),
                    FilterContainerWidget(
                      name: 'Distance',
                      icon1: Icon(
                        FontAwesomeIcons.arrowUp,
                        color: ColorPalette.primaryColor,
                        size: 10,
                      ),
                      icon2: Icon(
                        FontAwesomeIcons.arrowDown,
                        color: ColorPalette.primaryColor,
                        size: 10,
                      ),
                      onTapIconDown: () {},
                    ),
                    FilterContainerWidget(
                      name: 'Price',
                      icon1: Icon(
                        FontAwesomeIcons.arrowUp,
                        color: ColorPalette.primaryColor,
                        size: 10,
                      ),
                      icon2: Icon(
                        FontAwesomeIcons.arrowDown,
                        color: ColorPalette.primaryColor,
                        size: 10,
                      ),
                      onTapIconDown: () {},
                    ),
                    FilterContainerWidget(
                      name: 'Rate',
                      icon1: Icon(
                        FontAwesomeIcons.arrowUp,
                        color: ColorPalette.primaryColor,
                        size: 10,
                      ),
                      icon2: Icon(
                        FontAwesomeIcons.arrowDown,
                        color: ColorPalette.primaryColor,
                        size: 10,
                      ),
                      onTapIconDown: () {},
                    ),
                    FilterContainerWidget(
                      name: 'Kind',
                      icon1: Icon(
                        FontAwesomeIcons.angleDown,
                        color: ColorPalette.primaryColor,
                        size: 10,
                      ),
                      onTapIconDown: () {},
                    ),
                  ],
                ),
              ),
            ),
            Gap(20),
            Container(
              alignment: Alignment.centerLeft,
              child: Visibility(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Suggestion For You',
                          style: TextStyles.titleHeading,
                        ),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).go('/all_room');
                          },
                          child: Row(
                            children: [
                              Text(
                                'See All',
                                style: TextStyles.seeAll,
                              ),
                              Gap(10),
                              Icon(
                                FontAwesomeIcons.angleRight,
                                size: 12,
                                color: ColorPalette.grayText,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Gap(10),
                    Container(),
                  ],
                ),
                visible: isTenant,
              ),
            ),
            Gap(20),
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Room Available',
                        style: TextStyles.titleHeading,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              'See All',
                              style: TextStyles.seeAll,
                            ),
                            Gap(10),
                            Icon(
                              FontAwesomeIcons.angleRight,
                              size: 12,
                              color: ColorPalette.grayText,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Gap(10),
                  Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
