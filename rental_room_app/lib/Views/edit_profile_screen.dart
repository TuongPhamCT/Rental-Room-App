import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rental_room_app/Contract/edit_profile_contract.dart';
import 'package:rental_room_app/Presenter/edit_profile_presenter.dart';
import 'package:rental_room_app/config/asset_helper.dart';
import 'package:rental_room_app/themes/color_palete.dart';
import 'package:rental_room_app/themes/text_styles.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>
    implements EditProfileContract {
  EditProfilePresenter? _editProfilePresenter;
  final _formKey = GlobalKey<FormState>();

  final _fullnameTextController = TextEditingController();

  @override
  void initState() {
    _editProfilePresenter = EditProfilePresenter(this);
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
              ),
            ),
          ),
          title: Text('EDIT PROFILE',
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
                    const Gap(30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        children: [
                          Text(
                            "Full Name",
                            style: TextStyles.timenotifi.medium
                                .copyWith(color: ColorPalette.darkBlueText),
                          )
                        ],
                      ),
                    ),
                    const Gap(5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: TextFormField(
                        controller: _fullnameTextController,
                        validator: _editProfilePresenter?.validateFullName,
                        keyboardType: TextInputType.name,
                        style: TextStyles.h6.italic,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2, color: ColorPalette.detailBorder),
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3, color: ColorPalette.detailBorder),
                              borderRadius: BorderRadius.circular(20)),
                          helperText: " ",
                        ),
                        obscureText: false,
                      ),
                    ),
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
