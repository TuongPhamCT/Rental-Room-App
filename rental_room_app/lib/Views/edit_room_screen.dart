import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:rental_room_app/themes/color_palete.dart';
import 'package:rental_room_app/themes/text_styles.dart';
import 'package:rental_room_app/widgets/border_container.dart';
import 'package:rental_room_app/widgets/filter_container_widget.dart';
import 'package:rental_room_app/widgets/model_button.dart';

class EditRoomScreen extends StatefulWidget {
  const EditRoomScreen({super.key});

  @override
  State<EditRoomScreen> createState() => _EditRoomScreenState();
}

class _EditRoomScreenState extends State<EditRoomScreen> {
  String? searchValue;
  bool isVisibleFilter = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            child: const Icon(
              FontAwesomeIcons.arrowLeft,
              color: ColorPalette.backgroundColor,
              shadows: [
                Shadow(
                    color: Colors.black12, offset: Offset(3, 6), blurRadius: 6)
              ],
            ),
          ),
        ),
        title: Text('EDIT ROOM',
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(10),
              Text(
                'Room Information',
                style: TextStyles.detailTitle,
              ),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Room ID:',
                    style: TextStyles.roomProps,
                  ),
                  Container(
                    width: size.width - 140,
                    height: 35,
                    child: TextField(
                      cursorColor: Colors.black,
                      style: TextStyles.roomPropsContent,
                      scrollPadding: EdgeInsets.all(0),
                      maxLines: null,
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorPalette.detailBorder,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorPalette.primaryColor,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(
                          left: 5,
                          right: 5,
                          top: 0,
                          bottom: 13,
                        ),
                        hintText: 'Example: P001',
                        hintStyle: TextStyles.descriptionRoom.copyWith(
                            color: ColorPalette.rankText.withOpacity(0.5)),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Kind:',
                    style: TextStyles.roomProps,
                  ),
                  Container(
                    width: size.width - 140,
                    height: 35,
                    child: TextField(
                      cursorColor: Colors.black,
                      style: TextStyles.roomPropsContent,
                      scrollPadding: EdgeInsets.all(0),
                      maxLines: null,
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorPalette.detailBorder,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorPalette.primaryColor,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(
                          left: 5,
                          right: 5,
                          top: 0,
                          bottom: 13,
                        ),
                        hintText: 'Example: Standard',
                        hintStyle: TextStyles.descriptionRoom.copyWith(
                            color: ColorPalette.rankText.withOpacity(0.5)),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Area:',
                    style: TextStyles.roomProps,
                  ),
                  Container(
                    width: size.width - 140,
                    height: 35,
                    child: TextField(
                      cursorColor: Colors.black,
                      style: TextStyles.roomPropsContent,
                      scrollPadding: EdgeInsets.all(0),
                      maxLines: null,
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorPalette.detailBorder,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorPalette.primaryColor,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(
                          left: 5,
                          right: 5,
                          top: 0,
                          bottom: 13,
                        ),
                        hintText: 'Example: 60',
                        hintStyle: TextStyles.descriptionRoom.copyWith(
                            color: ColorPalette.rankText.withOpacity(0.5)),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Location:',
                    style: TextStyles.roomProps,
                  ),
                  Container(
                    width: size.width - 140,
                    height: 35,
                    child: TextField(
                      cursorColor: Colors.black,
                      style: TextStyles.roomPropsContent,
                      scrollPadding: EdgeInsets.all(0),
                      maxLines: null,
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorPalette.detailBorder,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorPalette.primaryColor,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(
                          left: 5,
                          right: 5,
                          top: 0,
                          bottom: 13,
                        ),
                        hintText:
                            'Example: 43 Tan Lap, Dong Hoa, Di An, Binh Duong',
                        hintStyle: TextStyles.descriptionRoom.copyWith(
                            color: ColorPalette.rankText.withOpacity(0.5)),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(5),
              Container(
                alignment: Alignment.centerLeft,
                height: 35,
                child: Text(
                  'Description:',
                  style: TextStyles.roomProps,
                ),
              ),
              TextField(
                cursorColor: Colors.black,
                style: TextStyles.roomPropsContent,
                scrollPadding: EdgeInsets.all(0),
                maxLines: null,
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                textAlign: TextAlign.justify,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorPalette.detailBorder,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorPalette.primaryColor,
                    ),
                  ),
                  contentPadding: const EdgeInsets.only(
                    left: 5,
                    right: 5,
                    top: 0,
                    bottom: 13,
                  ),
                  hintText: 'Example: A beautiful room with full furniture',
                  hintStyle: TextStyles.descriptionRoom
                      .copyWith(color: ColorPalette.rankText.withOpacity(0.5)),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 35,
                child: Text(
                  'Pictures:',
                  style: TextStyles.roomProps,
                ),
              ),
              Column(
                  //them anh do cho day
                  ),
              Container(
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  width: 250,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: ColorPalette.detailBorder.withOpacity(0.1),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Text('Upload Here'),
                ),
              ),
              Gap(30),
              Text(
                'Price',
                style: TextStyles.detailTitle,
              ),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 35,
                        width: null,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Room:',
                          style: TextStyles.roomProps,
                        ),
                      ),
                      Gap(5),
                      Container(
                        height: 35,
                        width: null,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Water:',
                          style: TextStyles.roomProps,
                        ),
                      ),
                      Gap(5),
                      Container(
                        height: 35,
                        width: null,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Electric:',
                          style: TextStyles.roomProps,
                        ),
                      ),
                      Gap(5),
                      Container(
                        height: 35,
                        width: null,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Other:',
                          style: TextStyles.roomProps,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: size.width - 200,
                        height: 35,
                        child: TextField(
                          cursorColor: Colors.black,
                          style: TextStyles.roomPropsContent,
                          scrollPadding: EdgeInsets.all(0),
                          maxLines: null,
                          onTapOutside: (event) {
                            FocusScope.of(context).unfocus();
                          },
                          textAlign: TextAlign.justify,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorPalette.detailBorder,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorPalette.primaryColor,
                              ),
                            ),
                            contentPadding: const EdgeInsets.only(
                              left: 5,
                              right: 5,
                              top: 0,
                              bottom: 13,
                            ),
                          ),
                        ),
                      ),
                      Gap(5),
                      Container(
                        width: size.width - 200,
                        height: 35,
                        child: TextField(
                          cursorColor: Colors.black,
                          style: TextStyles.roomPropsContent,
                          scrollPadding: EdgeInsets.all(0),
                          maxLines: null,
                          onTapOutside: (event) {
                            FocusScope.of(context).unfocus();
                          },
                          textAlign: TextAlign.justify,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorPalette.detailBorder,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorPalette.primaryColor,
                              ),
                            ),
                            contentPadding: const EdgeInsets.only(
                              left: 5,
                              right: 5,
                              top: 0,
                              bottom: 13,
                            ),
                          ),
                        ),
                      ),
                      Gap(5),
                      Container(
                        width: size.width - 200,
                        height: 35,
                        child: TextField(
                          cursorColor: Colors.black,
                          style: TextStyles.roomPropsContent,
                          scrollPadding: EdgeInsets.all(0),
                          maxLines: null,
                          onTapOutside: (event) {
                            FocusScope.of(context).unfocus();
                          },
                          textAlign: TextAlign.justify,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorPalette.detailBorder,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorPalette.primaryColor,
                              ),
                            ),
                            contentPadding: const EdgeInsets.only(
                              left: 5,
                              right: 5,
                              top: 0,
                              bottom: 13,
                            ),
                          ),
                        ),
                      ),
                      Gap(5),
                      Container(
                        width: size.width - 200,
                        height: 35,
                        child: TextField(
                          cursorColor: Colors.black,
                          style: TextStyles.roomPropsContent,
                          scrollPadding: EdgeInsets.all(0),
                          maxLines: null,
                          onTapOutside: (event) {
                            FocusScope.of(context).unfocus();
                          },
                          textAlign: TextAlign.justify,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorPalette.detailBorder,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorPalette.primaryColor,
                              ),
                            ),
                            contentPadding: const EdgeInsets.only(
                              left: 5,
                              right: 5,
                              top: 0,
                              bottom: 13,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 35,
                        width: null,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'VND/Month',
                          style: TextStyles.roomPropsContent,
                        ),
                      ),
                      Gap(5),
                      Container(
                        height: 35,
                        width: null,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'VND/m3',
                          style: TextStyles.roomPropsContent,
                        ),
                      ),
                      Gap(5),
                      Container(
                        height: 35,
                        width: null,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'VND/kWh',
                          style: TextStyles.roomPropsContent,
                        ),
                      ),
                      Gap(5),
                      Container(
                        height: 35,
                        width: null,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'VND/Month',
                          style: TextStyles.roomPropsContent,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Gap(30),
              Text(
                'Owner Information',
                style: TextStyles.detailTitle,
              ),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Name:',
                    style: TextStyles.roomProps,
                  ),
                  Container(
                    width: size.width - 140,
                    height: 35,
                    child: TextField(
                      cursorColor: Colors.black,
                      style: TextStyles.roomPropsContent,
                      scrollPadding: EdgeInsets.all(0),
                      maxLines: null,
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorPalette.detailBorder,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorPalette.primaryColor,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(
                          left: 5,
                          right: 5,
                          top: 0,
                          bottom: 13,
                        ),
                        hintText: 'Example: Nguyen Chu Tro',
                        hintStyle: TextStyles.descriptionRoom.copyWith(
                            color: ColorPalette.rankText.withOpacity(0.5)),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Phone:',
                    style: TextStyles.roomProps,
                  ),
                  Container(
                    width: size.width - 140,
                    height: 35,
                    child: TextField(
                      cursorColor: Colors.black,
                      style: TextStyles.roomPropsContent,
                      scrollPadding: EdgeInsets.all(0),
                      maxLines: null,
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorPalette.detailBorder,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorPalette.primaryColor,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(
                          left: 5,
                          right: 5,
                          top: 0,
                          bottom: 13,
                        ),
                        hintText: 'Example: 0123456789',
                        hintStyle: TextStyles.descriptionRoom.copyWith(
                            color: ColorPalette.rankText.withOpacity(0.5)),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Email:',
                    style: TextStyles.roomProps,
                  ),
                  Container(
                    width: size.width - 140,
                    height: 35,
                    child: TextField(
                      cursorColor: Colors.black,
                      style: TextStyles.roomPropsContent,
                      scrollPadding: EdgeInsets.all(0),
                      maxLines: null,
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorPalette.detailBorder,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorPalette.primaryColor,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(
                          left: 5,
                          right: 5,
                          top: 0,
                          bottom: 13,
                        ),
                        hintText: 'Example: abcd@gmail.com',
                        hintStyle: TextStyles.descriptionRoom.copyWith(
                            color: ColorPalette.rankText.withOpacity(0.5)),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Facebook:',
                    style: TextStyles.roomProps,
                  ),
                  Container(
                    width: size.width - 140,
                    height: 35,
                    child: TextField(
                      cursorColor: Colors.black,
                      style: TextStyles.roomPropsContent,
                      scrollPadding: EdgeInsets.all(0),
                      maxLines: null,
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorPalette.detailBorder,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorPalette.primaryColor,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(
                          left: 5,
                          right: 5,
                          top: 0,
                          bottom: 13,
                        ),
                        hintText:
                            'Example: https://www.facebook.com/nguyenchutro',
                        hintStyle: TextStyles.descriptionRoom.copyWith(
                            color: ColorPalette.rankText.withOpacity(0.5)),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Address:',
                    style: TextStyles.roomProps,
                  ),
                  Container(
                    width: size.width - 140,
                    height: 35,
                    child: TextField(
                      cursorColor: Colors.black,
                      style: TextStyles.roomPropsContent,
                      scrollPadding: EdgeInsets.all(0),
                      maxLines: null,
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorPalette.detailBorder,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorPalette.primaryColor,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(
                          left: 5,
                          right: 5,
                          top: 0,
                          bottom: 13,
                        ),
                        hintText:
                            'Example: 43 Tan Lap, Dong Hoa, Di An, Binh Duong',
                        hintStyle: TextStyles.descriptionRoom.copyWith(
                            color: ColorPalette.rankText.withOpacity(0.5)),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(45),
              ModelButton(
                name: 'Save',
                onTap: () {
                  //save room
                },
                width: 150,
                color: ColorPalette.primaryColor.withOpacity(0.75),
              ),
              Gap(10),
              ModelButton(
                name: 'DELETE',
                onTap: () {
                  //save room
                },
                width: 150,
                color: ColorPalette.redColor,
              ),
              Gap(50),
            ],
          ),
        ),
      ),
    );
  }
}
