import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:rental_room_app/config/asset_helper.dart';
import 'package:rental_room_app/themes/color_palete.dart';
import 'package:rental_room_app/themes/text_styles.dart';
import 'package:rental_room_app/widgets/filter_container_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "home_screen";

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
            const Gap(30),
            SizedBox(
              width: size.width,
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).go('/home/edit_profile');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
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
                    const Gap(15),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
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
            ),
            const Gap(20),
            GestureDetector(
              onTap: () {
                setState(() {
                  isVisiable = !isVisiable;
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    FontAwesomeIcons.filter,
                    color: ColorPalette.greenText,
                    size: 15,
                  ),
                  const Gap(10),
                  Text(
                    'Filter',
                    style: TextStyles.titleHeading.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ),
            const Gap(10),
            Container(
              alignment: Alignment.centerLeft,
              child: Visibility(
                visible: isVisiable,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilterContainerWidget(
                      name: 'Area',
                      icon1: const Icon(
                        FontAwesomeIcons.arrowUp,
                        color: ColorPalette.primaryColor,
                        size: 10,
                      ),
                      icon2: const Icon(
                        FontAwesomeIcons.arrowDown,
                        color: ColorPalette.primaryColor,
                        size: 10,
                      ),
                      onTapIconDown: () {},
                      onTapIconUp: () {},
                    ),
                    FilterContainerWidget(
                      name: 'Distance',
                      icon1: const Icon(
                        FontAwesomeIcons.arrowUp,
                        color: ColorPalette.primaryColor,
                        size: 10,
                      ),
                      icon2: const Icon(
                        FontAwesomeIcons.arrowDown,
                        color: ColorPalette.primaryColor,
                        size: 10,
                      ),
                      onTapIconDown: () {},
                    ),
                    FilterContainerWidget(
                      name: 'Price',
                      icon1: const Icon(
                        FontAwesomeIcons.arrowUp,
                        color: ColorPalette.primaryColor,
                        size: 10,
                      ),
                      icon2: const Icon(
                        FontAwesomeIcons.arrowDown,
                        color: ColorPalette.primaryColor,
                        size: 10,
                      ),
                      onTapIconDown: () {},
                    ),
                    FilterContainerWidget(
                      name: 'Rate',
                      icon1: const Icon(
                        FontAwesomeIcons.arrowUp,
                        color: ColorPalette.primaryColor,
                        size: 10,
                      ),
                      icon2: const Icon(
                        FontAwesomeIcons.arrowDown,
                        color: ColorPalette.primaryColor,
                        size: 10,
                      ),
                      onTapIconDown: () {},
                    ),
                    FilterContainerWidget(
                      name: 'Kind',
                      icon1: const Icon(
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
            const Gap(20),
            Container(
              alignment: Alignment.centerLeft,
              child: Visibility(
                visible: isTenant,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Suggestion For You',
                          style: TextStyles.titleHeading,
                        ),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).go('/home/all_room');
                          },
                          child: const Row(
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
                    const Gap(10),
                    Container(),
                  ],
                ),
              ),
            ),
            const Gap(20),
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Room Available',
                        style: TextStyles.titleHeading,
                      ),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).go('/home/report');
                        },
                        child: const Row(
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
                  const Gap(10),
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
