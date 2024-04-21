import 'dart:ffi';

import 'package:date_field/date_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rental_room_app/Contract/change_password_contract.dart';
import 'package:rental_room_app/Contract/notification_contract.dart';
import 'package:rental_room_app/Presenter/change_password_presenter.dart';
import 'package:rental_room_app/Presenter/notification_presenter.dart';
import 'package:rental_room_app/config/asset_helper.dart';
import 'package:rental_room_app/themes/color_palete.dart';
import 'package:rental_room_app/themes/text_styles.dart';
import 'package:rental_room_app/widgets/custom_text_field.dart';
import 'package:rental_room_app/widgets/model_button.dart';
import 'package:rental_room_app/widgets/numeric_up_down.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    implements NotificationContract {
  NotificationPresenter? _notificationPresenter;
  final _formKey = GlobalKey<FormState>();
  final _minutesBeforeNoti = TextEditingController();
  DateTime? _notiTime;

  @override
  void initState() {
    _notificationPresenter = NotificationPresenter(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
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
              onTap: () => context.pop(),
              child: const Icon(
                FontAwesomeIcons.arrowLeft,
                color: ColorPalette.backgroundColor,
                shadows: [Shadow(color: Colors.black12, offset: Offset(3, 6))],
              ),
            ),
          ),
          title: Text('NOTIFICATION',
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
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorPalette.backgroundColor,
        body: SingleChildScrollView(
          reverse: true,
          child: Center(
            child: Container(
              color: ColorPalette.backgroundColor,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Gap(40),
                    const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(AssetHelper.defaultAvatar),
                    ),
                    const Gap(20),
                    Text(
                      "Nguyen Nguoi Thue",
                      style: TextStyles.h4.semibold.copyWith(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          color: ColorPalette.primaryColor),
                    ),
                    Text("aduvjppr0@gmail.com",
                        style: TextStyles.labelStaffDetail.regular.copyWith(
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                            color: ColorPalette.detailBorder.withOpacity(0.7))),
                    const Gap(50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        children: [
                          Text(
                            "Reminder before deadline",
                            style: TextStyles.timenotifi.medium
                                .copyWith(color: ColorPalette.darkBlueText),
                          )
                        ],
                      ),
                    ),
                    const Gap(5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: NumericUpDown(
                        controller: _minutesBeforeNoti,
                      ),
                    ),
                    const Gap(25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        children: [
                          Text(
                            "Time to Reminder",
                            style: TextStyles.timenotifi.medium
                                .copyWith(color: ColorPalette.darkBlueText),
                          )
                        ],
                      ),
                    ),
                    const Gap(5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: CustomFormField.dateFormField(
                        dateTimeValidator:
                            _notificationPresenter!.validatedatetime,
                        style: TextStyles.h6.italic,
                        dateTimePickerMode: DateTimeFieldPickerMode.time,
                        onChangedDateTime: (value) {
                          setState(() {
                            _notiTime = value;
                          });
                        },
                      ),
                    ),
                    const Gap(5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        children: [
                          Text(
                            "Ringtone",
                            style: TextStyles.timenotifi.medium
                                .copyWith(color: ColorPalette.darkBlueText),
                          )
                        ],
                      ),
                    ),
                    const Gap(5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: DropdownMenu(
                          expandedInsets: const EdgeInsets.all(0),
                          inputDecorationTheme: InputDecorationTheme(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2, color: ColorPalette.detailBorder),
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: ColorPalette.detailBorder),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          initialSelection: "adu",
                          dropdownMenuEntries: const <DropdownMenuEntry<
                              String>>[
                            DropdownMenuEntry(value: "adu", label: "Adu"),
                            DropdownMenuEntry(value: "vailon", label: "Vailon"),
                            DropdownMenuEntry(
                                value: "anhban", label: "Anh Ban"),
                            DropdownMenuEntry(
                                value: "nay hai vai", label: "Nay Hai Vai")
                          ]),
                    ),
                    const Gap(20),
                    ModelButton(
                        onTap: () {
                          //TODO: save ontap handle
                        },
                        name: "Save",
                        color: ColorPalette.primaryColor.withOpacity(0.75),
                        width: 150),
                    const Gap(10),
                    ModelButton(
                        onTap: () {
                          //TODO: cancel ontap handle
                        },
                        name: "Cancel",
                        color: ColorPalette.redColor.withOpacity(0.75),
                        width: 150),
                    const Gap(30),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
