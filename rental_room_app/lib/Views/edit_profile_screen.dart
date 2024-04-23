import 'package:flutter/gestures.dart';
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
import 'package:rental_room_app/widgets/custom_text_field.dart';
import 'package:rental_room_app/widgets/model_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  String? _gender;

  late String _userName;
  late String _email;
  String _userAvatarUrl = '';

  // ignore: unused_field
  DateTime? _birthday;
  @override
  void initState() {
    _editProfilePresenter = EditProfilePresenter(this);
    _getUserInfoFromSharedPreferences();
    super.initState();
  }

  Future<void> _getUserInfoFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('name') ?? 'Nguyen Van A';
      _userAvatarUrl = prefs.getString('avatar') ?? '';
      _email = prefs.getString('email') ?? 'nguyenvana@gmail.com';
    });
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
          child: Center(
            child: Container(
              color: ColorPalette.backgroundColor,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Gap(45),
                    Container(
                      alignment: Alignment.center,
                      child: Container(
                        height: 132,
                        width: 132,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: _userAvatarUrl.isNotEmpty
                              ? DecorationImage(
                                  image: NetworkImage(_userAvatarUrl),
                                  fit: BoxFit.cover,
                                )
                              : DecorationImage(
                                  image: AssetImage(AssetHelper.avatar),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                    const Gap(10),
                    Text(
                      _userName,
                      style: TextStyles.title,
                    ),
                    Text(
                      _email,
                      style: TextStyles.descriptionRoom.copyWith(
                        fontSize: 16,
                      ),
                    ),
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
                      child: CustomFormField.textFormField(
                        stringValidator:
                            _editProfilePresenter!.validateFullName,
                        editingController: _fullnameTextController,
                        keyboardType: TextInputType.name,
                        textAlign: TextAlign.center,
                        style: TextStyles.h6.italic,
                      ),
                    ),
                    const Gap(5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        children: [
                          Text(
                            "Gender",
                            style: TextStyles.timenotifi.medium
                                .copyWith(color: ColorPalette.darkBlueText),
                          )
                        ],
                      ),
                    ),
                    const Gap(5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: CustomFormField.genderFormField(
                        stringValidator: _editProfilePresenter!.validateGender,
                        gender: _gender,
                        onChangedString: (value) {
                          setState(() {
                            _gender = value!;
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
                            "Phone Number",
                            style: TextStyles.timenotifi.medium
                                .copyWith(color: ColorPalette.darkBlueText),
                          )
                        ],
                      ),
                    ),
                    const Gap(5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: CustomFormField.textFormField(
                        stringValidator:
                            _editProfilePresenter!.validateFullName,
                        editingController: _fullnameTextController,
                        keyboardType: TextInputType.phone,
                        textAlign: TextAlign.center,
                        style: TextStyles.h6.italic,
                      ),
                    ),
                    const Gap(5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        children: [
                          Text(
                            "Identification Number",
                            style: TextStyles.timenotifi.medium
                                .copyWith(color: ColorPalette.darkBlueText),
                          )
                        ],
                      ),
                    ),
                    const Gap(5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: CustomFormField.textFormField(
                        stringValidator:
                            _editProfilePresenter!.validateFullName,
                        editingController: _fullnameTextController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyles.h6.italic,
                      ),
                    ),
                    const Gap(5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        children: [
                          Text(
                            "Birthday",
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
                            _editProfilePresenter!.validateBirthday,
                        style: TextStyles.h6.italic,
                        onChangedDateTime: (value) {
                          setState(() {
                            _birthday = value;
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
                            "Facebook",
                            style: TextStyles.timenotifi.medium
                                .copyWith(color: ColorPalette.darkBlueText),
                          )
                        ],
                      ),
                    ),
                    const Gap(5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: CustomFormField.textFormField(
                        stringValidator:
                            _editProfilePresenter!.validateFullName,
                        editingController: _fullnameTextController,
                        keyboardType: TextInputType.url,
                        textAlign: TextAlign.center,
                        style: TextStyles.h6.italic,
                      ),
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
                    RichText(
                      text: TextSpan(style: TextStyles.h6, children: <TextSpan>[
                        TextSpan(
                            text: "Do you want to change password? ",
                            style: TextStyles.h6.copyWith(
                                fontFamily: GoogleFonts.ntr().fontFamily)),
                        TextSpan(
                            text: "Change Password!",
                            style: TextStyles.h6.copyWith(
                                fontFamily: GoogleFonts.ntr().fontFamily,
                                color: ColorPalette.greenText),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                GoRouter.of(context).go('/home');
                              })
                      ]),
                    ),
                    const Gap(60),
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
