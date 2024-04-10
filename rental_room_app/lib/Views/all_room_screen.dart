import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:rental_room_app/Views/bottom_bar.dart';
import 'package:rental_room_app/config/asset_helper.dart';
import 'package:rental_room_app/themes/color_palete.dart';
import 'package:rental_room_app/themes/text_styles.dart';
import 'package:rental_room_app/widgets/filter_container_widget.dart';

class AllRoom extends StatefulWidget {
  const AllRoom({super.key});
  static const String routeName = "all_room";

  @override
  State<AllRoom> createState() => _AllRoomState();
}

class _AllRoomState extends State<AllRoom> {
  String? searchValue;
  bool isVisibleFilter = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorPalette.primaryColor,
        // leadingWidth: kDefaultIconSize * 3,
        leading: SizedBox(
          width: double.infinity,
          child: InkWell(
            customBorder: const CircleBorder(),
            onHighlightChanged: (param) {},
            splashColor: ColorPalette.primaryColor,
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(FontAwesomeIcons.arrowLeft),
          ),
        ),
        title: Text('ROOMS',
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
        padding: EdgeInsets.all(20),
        color: ColorPalette.backgroundColor,
        child: Column(
          children: [
            Gap(36),
            Container(
              child: SizedBox(
                height: 42,
                width: double.infinity,
                child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchValue = value;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorPalette.primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorPalette.primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.only(top: 4),
                      prefixIcon: InkWell(
                        customBorder: CircleBorder(),
                        onTap: () {},
                        child: Icon(
                          FontAwesomeIcons.magnifyingGlass,
                          size: 16,
                          color: ColorPalette.greenText,
                        ),
                      ),
                      suffixIcon: InkWell(
                        customBorder: CircleBorder(),
                        onTap: () {
                          setState(() {
                            isVisibleFilter = !isVisibleFilter;
                          });
                        },
                        child: Icon(
                          FontAwesomeIcons.barsProgress,
                          size: 16,
                          color: ColorPalette.primaryColor,
                        ),
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: ColorPalette.grayText,
                      ),
                    )),
              ),
            ),
            Gap(20),
            Container(
              alignment: Alignment.centerLeft,
              child: Visibility(
                visible: isVisibleFilter,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.filter,
                          color: ColorPalette.greenText,
                          size: 15,
                        ),
                        Gap(10),
                        Text(
                          'Filter',
                          style: TextStyles.titleHeading.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                    Gap(10),
                    Row(
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      //bottomNavigationBar: BottomBar(),
    );
  }
}
