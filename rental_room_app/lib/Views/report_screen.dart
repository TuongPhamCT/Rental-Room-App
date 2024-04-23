import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:open_file_plus/open_file_plus.dart';

import 'package:rental_room_app/themes/color_palete.dart';
import 'package:rental_room_app/themes/text_styles.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:path/path.dart' as path;

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});
  static const String routeName = 'report_screen';

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  bool isPressed = false;

  String? dropdownMonthReportValue;
  String? dropdownYearReportValue;
  String? monthSelected;
  String? yearSelected;
  String? yearOfMonthReportSelected;
  int totalMonthPrice = 0;
  int totalYearPrice = 0;
  List<String> monthItems = [
    'JANUARY',
    'FEBRUARY',
    'MARCH',
    'APRIL',
    'MAY',
    'JUNE',
    'JULY',
    'AUGUST',
    'SEPTEMBER',
    'OCTOBER',
    'NOVEMBER',
    'DECEMBER'
  ];
  List<String> yearItems = [
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // listRoomKind = RoomKindModel.AllRoomKinds;
    //listRoom = RoomModel.AllRooms;
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorPalette.primaryColor,
          leadingWidth: 18 * 3,
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
                      color: Colors.black12,
                      offset: Offset(3, 6),
                      blurRadius: 6)
                ],
              ),
            ),
          ),
          title: Text(
            'REPORT',
            style: TextStyles.h8.bold.copyWith(
              shadows: [
                const Shadow(
                  color: Colors.black12,
                  offset: Offset(3, 6),
                  blurRadius: 6,
                )
              ],
              letterSpacing: 1.175,
            ),
          ),
          centerTitle: true,
          toolbarHeight: kToolbarHeight * 1.5,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 28,
              ),
              Row(
                children: [
                  Container(
                    height: 42,
                    width: 170,
                    margin: const EdgeInsets.only(right: 10, left: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorPalette.grayText),
                        borderRadius: BorderRadius.circular(20)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        alignment: Alignment.center,
                        value: dropdownMonthReportValue,
                        hint: Text(
                          "MONTHLY",
                          style: TextStyles.defaultStyle.copyWith(
                              fontSize: 16,
                              color: ColorPalette.calendarGround,
                              fontWeight: FontWeight.bold),
                        ),
                        iconStyleData: const IconStyleData(
                            iconEnabledColor: ColorPalette.grayText,
                            iconSize: 36),
                        onChanged: (value) {
                          setState(() {
                            dropdownMonthReportValue = value;
                          });
                        },
                        buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.only(left: 20),
                            height: 42,
                            width: 200),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 24,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        items: monthItems
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                onTap: () {
                                  setState(() {
                                    monthSelected = e;
                                  });
                                },
                                child: Text(
                                  e,
                                  style: TextStyles.defaultStyle.copyWith(
                                      color: ColorPalette.calendarGround,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 42,
                    width: 160,
                    margin: const EdgeInsets.only(right: 20),
                    alignment: Alignment.topRight,
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorPalette.grayText),
                        borderRadius: BorderRadius.circular(24)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        alignment: Alignment.center,
                        value: yearOfMonthReportSelected,
                        hint: Text(
                          "YEARLY",
                          style: TextStyles.defaultStyle.copyWith(
                              fontSize: 16,
                              color: ColorPalette.calendarGround,
                              fontWeight: FontWeight.bold),
                        ),
                        iconStyleData: const IconStyleData(
                            iconEnabledColor: ColorPalette.grayText,
                            iconSize: 36),
                        onChanged: (value) {
                          setState(() {
                            yearOfMonthReportSelected = value!;
                          });
                        },
                        buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.only(left: 36),
                            height: 42,
                            width: 200),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 24,
                        ),
                        dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5))),
                        items: yearItems
                            .map((e) => DropdownMenuItem(
                                value: e,
                                onTap: () {
                                  setState(() {
                                    yearOfMonthReportSelected = e;
                                  });
                                },
                                child: Center(
                                  child: Text(
                                    e,
                                    textAlign: TextAlign.center,
                                    style: TextStyles.defaultStyle.copyWith(
                                        color: ColorPalette.calendarGround,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const SizedBox(height: 24),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('TOTAL',
                        style: TextStyles.defaultStyle.bold.copyWith(
                          color: ColorPalette.greenText,
                        )),
                    Text(' VND',
                        style: TextStyles.defaultStyle.bold.copyWith(
                          color: ColorPalette.greenText,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Material(
                color: ColorPalette.primaryColor,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  splashColor: Colors.black38,
                  onTap: () {},
                  child: Container(
                    width: size.width / 2,
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      'Print',
                      style: TextStyles.h8.copyWith(
                        color: ColorPalette.backgroundColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 42,
                width: 220,
                decoration: BoxDecoration(
                    border: Border.all(color: ColorPalette.grayText),
                    borderRadius: BorderRadius.circular(24)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    alignment: Alignment.center,
                    value: dropdownYearReportValue,
                    hint: Text(
                      "YEARLY REPORT",
                      style: TextStyles.defaultStyle.copyWith(
                          fontSize: 16,
                          color: ColorPalette.calendarGround,
                          fontWeight: FontWeight.bold),
                    ),
                    iconStyleData: const IconStyleData(
                        iconEnabledColor: ColorPalette.grayText, iconSize: 36),
                    onChanged: (value) {
                      setState(() {
                        dropdownYearReportValue = value;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.only(left: 36),
                        height: 42,
                        width: 200),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 24,
                    ),
                    dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5))),
                    items: yearItems
                        .map((e) => DropdownMenuItem(
                            value: e,
                            onTap: () {
                              setState(() {
                                yearSelected = e;
                              });
                            },
                            child: Text(
                              e,
                              textAlign: TextAlign.center,
                              style: TextStyles.defaultStyle.copyWith(
                                  color: ColorPalette.calendarGround,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )))
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }

  double rate(int revenue, int totalPrice) {
    try {
      if (totalPrice == 0) return 0;
      return revenue / totalPrice;
    } catch (e) {
      return 0;
    }
  }

  Future<void> generatePDF() async {
    PdfDocument document = PdfDocument();
    var page = document.pages.add();

    List<int> bytes = await document.save();
    document.dispose();
    saveAndLaunchFile(bytes, 'output.pdf');
  }

  Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
    final result = await FilePicker.platform.getDirectoryPath();
    String? selectedPath;

    if (result != null) {
      selectedPath = result;

      final file = File(path.join(selectedPath, fileName));
      await file.writeAsBytes(bytes, flush: true);
      await OpenFile.open(file.path);
    }
  }
}
