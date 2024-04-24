import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:rental_room_app/Contract/edit_form_contract.dart';
import 'package:rental_room_app/Contract/rental_form_contract.dart';
import 'package:rental_room_app/Presenter/edit_form_presenter.dart';
import 'package:rental_room_app/Presenter/rental_from_presenter.dart';
import 'package:rental_room_app/Views/rental_form_screen.dart';
import 'package:rental_room_app/themes/color_palete.dart';
import 'package:rental_room_app/themes/text_styles.dart';
import 'package:rental_room_app/widgets/custom_text_field.dart';
import 'package:rental_room_app/widgets/model_button.dart';
import 'package:rental_room_app/widgets/numeric_up_down.dart';

class EditFormScreen extends StatefulWidget {
  const EditFormScreen({super.key});

  @override
  State<EditFormScreen> createState() => _EditFormScreenState();
}

class _EditFormScreenState extends State<EditFormScreen>
    implements EditFormContract {
  EditFormPresenter? _editFormPresenter;
  final _formKey = GlobalKey<FormState>();

  //
  //params controllers
  //
  String roomId = "P001";
  final _guestNameController = TextEditingController();
  String _gender = "";
  final _phoneNumberController = TextEditingController();
  final _citizenIdentificationController = TextEditingController();
  final _emailController = TextEditingController();
  DateTime? _birthday = DateTime.now();
  final _numberOfPeopleController = TextEditingController();
  DateTime? _startDate = DateTime.now();
  String deposit = "500000";
  final _durationController = TextEditingController();
  final _facebookController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _editFormPresenter = EditFormPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorPalette.backgroundColor,
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
                color: ColorPalette.primaryColor,
                shadows: [Shadow(color: Colors.black12, offset: Offset(3, 6))],
              ),
            ),
          ),
          title: Text('Edit Form',
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
                    const Gap(30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        children: [
                          Text(
                            "Room ID",
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
                        textAlign: TextAlign.center,
                        style: TextStyles.h6.italic
                            .copyWith(color: ColorPalette.grayText),
                        enabled: false,
                        initialValue: roomId,
                      ),
                    ),
                    const Gap(5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        children: [
                          Text(
                            "Guest Name",
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
                            _editFormPresenter!.validateGuestName,
                        editingController: _guestNameController,
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
                        stringValidator: _editFormPresenter!.validateGender,
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
                        stringValidator: _editFormPresenter!.validatePhoneNum,
                        editingController: _phoneNumberController,
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
                            _editFormPresenter!.validateIdentification,
                        editingController: _citizenIdentificationController,
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
                            "Email Address",
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
                        stringValidator: _editFormPresenter!.validateEmail,
                        editingController: _emailController,
                        keyboardType: TextInputType.emailAddress,
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
                            _editFormPresenter!.validateBirthday,
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
                            "Number of People",
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
                        controller: _numberOfPeopleController,
                      ),
                    ),
                    const Gap(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        children: [
                          Text(
                            "Start Date",
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
                            _editFormPresenter!.validateStartDate,
                        style: TextStyles.h6.italic,
                        onChangedDateTime: (value) {
                          setState(() {
                            _startDate = value;
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
                            "Duration",
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
                        controller: _durationController,
                      ),
                    ),
                    const Gap(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        children: [
                          Text(
                            "Deposit",
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
                        textAlign: TextAlign.center,
                        style: TextStyles.h6.italic
                            .copyWith(color: ColorPalette.grayText),
                        enabled: false,
                        initialValue: deposit,
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
                        stringValidator: _editFormPresenter!.validateFacebook,
                        editingController: _facebookController,
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
