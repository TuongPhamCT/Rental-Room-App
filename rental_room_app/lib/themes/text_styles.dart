import 'package:flutter/material.dart';
import 'package:rental_room_app/themes/color_palete.dart';

extension ExtendedTextStyle on TextStyle {
  TextStyle get bold {
    return copyWith(fontWeight: FontWeight.w700, fontFamily: AppFonts.rubik);
  }

  TextStyle get grayText {
    return copyWith(color: ColorPalette.grayText, fontFamily: AppFonts.rubik);
  }
}

class TextStyles {
  TextStyles(this.context);

  BuildContext? context;

  static const TextStyle defaultStyle = TextStyle(
      fontSize: 14,
      color: ColorPalette.blackText,
      fontWeight: FontWeight.w400,
      height: 16 / 14,
      fontFamily: AppFonts.rubik);

  static const TextStyle h1 = TextStyle(
      fontSize: 30,
      color: ColorPalette.blackText,
      fontWeight: FontWeight.w400,
      height: 16 / 14,
      fontFamily: AppFonts.rubik);
  static const TextStyle h2 = TextStyle(
      fontSize: 27.2,
      color: ColorPalette.blackText,
      fontWeight: FontWeight.w400,
      height: 16 / 14,
      fontFamily: AppFonts.rubik);
  static const TextStyle h3 = TextStyle(
      fontSize: 24.4,
      color: ColorPalette.blackText,
      fontWeight: FontWeight.w400,
      height: 16 / 14,
      fontFamily: AppFonts.rubik);
  static const TextStyle h4 = TextStyle(
      fontSize: 21.6,
      color: ColorPalette.blackText,
      fontWeight: FontWeight.w400,
      height: 16 / 14,
      fontFamily: AppFonts.rubik);
  static const TextStyle h5 = TextStyle(
      fontSize: 18.8,
      color: ColorPalette.blackText,
      fontWeight: FontWeight.w400,
      height: 16 / 14,
      fontFamily: AppFonts.rubik);
  static const TextStyle h6 = TextStyle(
      fontSize: 16,
      color: ColorPalette.blackText,
      fontWeight: FontWeight.w400,
      height: 16 / 14,
      fontFamily: AppFonts.rubik);
  static const TextStyle slo = TextStyle(
    fontFamily: AppFonts.lexend,
    fontSize: 32,
    color: ColorPalette.backgroundColor,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle h7 = TextStyle(
      fontSize: 24,
      color: ColorPalette.blackText,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.poppins);
  static const TextStyle h8 = TextStyle(
      fontSize: 24,
      letterSpacing: 1.305,
      color: ColorPalette.backgroundColor,
      fontWeight: FontWeight.w600,
      fontFamily: AppFonts.poppins);
  static const TextStyle h9 = TextStyle(
      fontSize: 24,
      color: ColorPalette.blackText,
      fontWeight: FontWeight.w600,
      fontFamily: AppFonts.inter);
  static const TextStyle staffInforDetail = TextStyle(
      fontSize: 14,
      color: ColorPalette.rankText,
      fontWeight: FontWeight.w500,
      fontFamily: AppFonts.poppins);
  static const TextStyle labelStaffDetail = TextStyle(
      fontSize: 16,
      color: ColorPalette.primaryColor,
      fontWeight: FontWeight.w600,
      fontFamily: AppFonts.poppins);
  static const TextStyle titleInfoDetail = TextStyle(
      fontSize: 14,
      color: ColorPalette.infoDetail,
      fontWeight: FontWeight.w500,
      fontFamily: AppFonts.poppins);
  static const TextStyle outsideMonth = TextStyle(
      fontSize: 14,
      color: Color(0xffD6D8E1),
      fontWeight: FontWeight.w500,
      fontFamily: AppFonts.inter);
  static const TextStyle defaultMonth = TextStyle(
      fontSize: 14,
      color: Color(0xff45454A),
      fontWeight: FontWeight.w600,
      fontFamily: AppFonts.inter);
  static const TextStyle calendarNote = TextStyle(
      fontSize: 12,
      color: ColorPalette.detailBorder,
      fontWeight: FontWeight.w500,
      fontFamily: AppFonts.inter);
  static const TextStyle inforRoomDetail = TextStyle(
    fontSize: 14,
    color: Color(0xff1B1446),
  );
  static const TextStyle descriptionRoom = TextStyle(
      fontSize: 14,
      color: ColorPalette.rankText,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.inter);
  static const TextStyle iconInDetailRoom = TextStyle(
      fontSize: 14,
      color: Color(0xff000000),
      fontWeight: FontWeight.w500,
      fontFamily: AppFonts.inter);
  static const TextStyle desFunction = TextStyle(
    fontFamily: AppFonts.poppins,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: ColorPalette.rankText,
  );
  static const TextStyle titlenotifi = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: ColorPalette.greenText,
    letterSpacing: 1.08,
  );
  static const TextStyle timenotifi = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: ColorPalette.detailBorder,
    letterSpacing: 0.8,
  );
  static const TextStyle titlehotelinfor = TextStyle(
    fontFamily: AppFonts.poppins,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: ColorPalette.primaryColor,
  );
  static const TextStyle titleHeading = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: ColorPalette.primaryColor,
  );
  static const TextStyle seeAll = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w300,
    fontSize: 12,
    color: ColorPalette.grayText,
  );
  static const TextStyle bottomBar = TextStyle(
    fontFamily: AppFonts.poppins,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: ColorPalette.primaryColor,
  );
  static const TextStyle buttonName = TextStyle(
    fontFamily: AppFonts.poppins,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: ColorPalette.backgroundColor,
  );
  static const TextStyle detailTitle = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: ColorPalette.darkBlueText,
  );
  static const TextStyle ratingNumb = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w700,
    fontSize: 64,
    color: ColorPalette.blackText,
  );

  static const TextStyle ratingText = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w300,
    fontSize: 12,
    color: ColorPalette.blackText,
  );
  static const TextStyle total = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: ColorPalette.primaryColor,
  );
}

// How to use?
// Text('test text', style: TextStyles.normalText.semibold.whiteColor);
// Text('test text', style: TextStyles.itemText.whiteColor.bold);
class AppFonts {
  static const String rubik = 'Rubik';
  static const String lexend = 'Lexend';
  static const String poppins = 'Poppins';
  static const String inter = 'Inter';
}
