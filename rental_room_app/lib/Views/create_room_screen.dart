import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:rental_room_app/Contract/create_room_contract.dart';
import 'package:rental_room_app/Presenter/create_room_presenter.dart';
import 'package:rental_room_app/themes/color_palete.dart';
import 'package:rental_room_app/themes/text_styles.dart';
import 'package:rental_room_app/widgets/model_button.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen>
    implements CreateRoomContract {
  CreateRoomPresenter? _createRoomPresenter;
  final _formKey = GlobalKey<FormState>();

  //
  //Params Controllers
  //

  final _roomIdController = TextEditingController();
  final _kindController = TextEditingController();
  final _areaController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _roomPriceController = TextEditingController();
  final _waterPriceController = TextEditingController();
  final _electricPriceController = TextEditingController();
  final _otherControler = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _facebookController = TextEditingController();
  final _addressController = TextEditingController();

  final List<String> _images = [];

  @override
  void initState() {
    super.initState();
    _createRoomPresenter = CreateRoomPresenter(this);
  }

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
              context.pop();
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
        title: Text('CREATE ROOM',
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(10),
                const Text(
                  'Room Information',
                  style: TextStyles.detailTitle,
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Room ID:',
                      style: TextStyles.roomProps,
                    ),
                    SizedBox(
                      width: size.width - 140,
                      child: TextFormField(
                        controller: _roomIdController,
                        validator: _createRoomPresenter?.validateRoomId,
                        cursorColor: Colors.black,
                        style: TextStyles.roomPropsContent,
                        scrollPadding: const EdgeInsets.all(0),
                        maxLines: null,
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        textAlign: TextAlign.justify,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.detailBorder,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 0,
                            right: 0,
                            top: 5,
                            bottom: 0,
                          ),
                          hintText: 'Example: P001',
                          hintStyle: TextStyles.descriptionRoom.copyWith(
                              color: ColorPalette.rankText.withOpacity(0.5)),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Kind:',
                      style: TextStyles.roomProps,
                    ),
                    SizedBox(
                      width: size.width - 140,
                      child: TextFormField(
                        controller: _kindController,
                        validator: _createRoomPresenter?.validateKind,
                        cursorColor: Colors.black,
                        style: TextStyles.roomPropsContent,
                        scrollPadding: const EdgeInsets.all(0),
                        maxLines: null,
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        textAlign: TextAlign.justify,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.detailBorder,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 0,
                            right: 0,
                            top: 5,
                            bottom: 0,
                          ),
                          hintText: 'Example: Standard',
                          hintStyle: TextStyles.descriptionRoom.copyWith(
                              color: ColorPalette.rankText.withOpacity(0.5)),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Area:',
                      style: TextStyles.roomProps,
                    ),
                    SizedBox(
                      width: size.width - 140,
                      child: TextFormField(
                        controller: _areaController,
                        validator: _createRoomPresenter?.validateArea,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        style: TextStyles.roomPropsContent,
                        scrollPadding: const EdgeInsets.all(0),
                        maxLines: null,
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        textAlign: TextAlign.justify,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.detailBorder,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 0,
                            right: 0,
                            top: 5,
                            bottom: 0,
                          ),
                          hintText: 'Example: 60',
                          hintStyle: TextStyles.descriptionRoom.copyWith(
                              color: ColorPalette.rankText.withOpacity(0.5)),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Location:',
                      style: TextStyles.roomProps,
                    ),
                    SizedBox(
                      width: size.width - 140,
                      child: TextFormField(
                        controller: _locationController,
                        validator: _createRoomPresenter?.validateLocation,
                        cursorColor: Colors.black,
                        style: TextStyles.roomPropsContent,
                        scrollPadding: const EdgeInsets.all(0),
                        maxLines: null,
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        textAlign: TextAlign.justify,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.detailBorder,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 0,
                            right: 0,
                            top: 5,
                            bottom: 0,
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
                const Gap(5),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Description:',
                    style: TextStyles.roomProps,
                  ),
                ),
                TextFormField(
                  controller: _descriptionController,
                  validator: _createRoomPresenter?.validateDescription,
                  cursorColor: Colors.black,
                  style: TextStyles.roomPropsContent,
                  scrollPadding: const EdgeInsets.all(0),
                  maxLines: null,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  textAlign: TextAlign.justify,
                  decoration: InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.detailBorder,
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
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
                    hintStyle: TextStyles.descriptionRoom.copyWith(
                        color: ColorPalette.rankText.withOpacity(0.5)),
                  ),
                ),
                const Gap(10),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Pictures:',
                    style: TextStyles.roomProps,
                  ),
                ),
                const Gap(10),
                FormField(
                    validator: _createRoomPresenter?.validateImage,
                    builder: (FormFieldState<List<String>?> state) {
                      return InputDecorator(
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            helperText: "",
                            errorText: state.errorText,
                          ),
                          child: Column(children: [
                            GridView.count(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              mainAxisSpacing: 5.0,
                              crossAxisSpacing: 5.0,
                              children: List.generate(
                                _images.length,
                                (index) {
                                  return Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Image(
                                          image:
                                              FileImage(File(_images[index])),
                                          height: size.width / 2 - 20,
                                          width: size.width / 2 - 20,
                                        ),
                                      ),
                                      Positioned(
                                        top: 10.0,
                                        right: 10.0,
                                        child: IconButton(
                                          icon: const Icon(Icons.close),
                                          onPressed: () {
                                            setState(() {
                                              _images.removeAt(index);
                                            });
                                            state.didChange(_images);
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            const Gap(10),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  _createRoomPresenter
                                      ?.selectImageFromGallery();
                                  state.didChange(_images);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 250,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: ColorPalette.detailBorder
                                          .withOpacity(0.1),
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                  ),
                                  child: const Text('Upload Here'),
                                ),
                              ),
                            ),
                          ]));
                    }),
                const Gap(30),
                const Text(
                  'Price',
                  style: TextStyles.detailTitle,
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: null,
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Room:',
                            style: TextStyles.roomProps,
                          ),
                        ),
                        const Gap(5),
                        Container(
                          width: null,
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Water:',
                            style: TextStyles.roomProps,
                          ),
                        ),
                        const Gap(5),
                        Container(
                          width: null,
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Electric:',
                            style: TextStyles.roomProps,
                          ),
                        ),
                        const Gap(5),
                        Container(
                          width: null,
                          alignment: Alignment.centerLeft,
                          child: const Text(
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
                        SizedBox(
                          width: size.width - 200,
                          child: TextFormField(
                            controller: _roomPriceController,
                            validator: _createRoomPresenter?.validateRoomPrice,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.black,
                            style: TextStyles.roomPropsContent,
                            scrollPadding: const EdgeInsets.all(0),
                            maxLines: null,
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                            textAlign: TextAlign.justify,
                            decoration: const InputDecoration(
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
                              contentPadding: EdgeInsets.only(
                                left: 5,
                                right: 5,
                                top: 0,
                                bottom: 13,
                              ),
                            ),
                          ),
                        ),
                        const Gap(5),
                        SizedBox(
                          width: size.width - 200,
                          child: TextFormField(
                            controller: _waterPriceController,
                            validator: _createRoomPresenter?.validateWaterPrice,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.black,
                            style: TextStyles.roomPropsContent,
                            scrollPadding: const EdgeInsets.all(0),
                            maxLines: null,
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                            textAlign: TextAlign.justify,
                            decoration: const InputDecoration(
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
                              contentPadding: EdgeInsets.only(
                                left: 5,
                                right: 5,
                                top: 0,
                                bottom: 13,
                              ),
                            ),
                          ),
                        ),
                        const Gap(5),
                        SizedBox(
                          width: size.width - 200,
                          child: TextFormField(
                            controller: _electricPriceController,
                            validator:
                                _createRoomPresenter?.validateElectricPrice,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.black,
                            style: TextStyles.roomPropsContent,
                            scrollPadding: const EdgeInsets.all(0),
                            maxLines: null,
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                            textAlign: TextAlign.justify,
                            decoration: const InputDecoration(
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
                              contentPadding: EdgeInsets.only(
                                left: 5,
                                right: 5,
                                top: 0,
                                bottom: 13,
                              ),
                            ),
                          ),
                        ),
                        const Gap(5),
                        SizedBox(
                          width: size.width - 200,
                          child: TextFormField(
                            controller: _otherControler,
                            validator: _createRoomPresenter?.validateOtherPrice,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.black,
                            style: TextStyles.roomPropsContent,
                            scrollPadding: const EdgeInsets.all(0),
                            maxLines: null,
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                            textAlign: TextAlign.justify,
                            decoration: const InputDecoration(
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
                              contentPadding: EdgeInsets.only(
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
                          width: null,
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'VND/Month',
                            style: TextStyles.roomPropsContent,
                          ),
                        ),
                        const Gap(5),
                        Container(
                          width: null,
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'VND/m3',
                            style: TextStyles.roomPropsContent,
                          ),
                        ),
                        const Gap(5),
                        Container(
                          width: null,
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'VND/kWh',
                            style: TextStyles.roomPropsContent,
                          ),
                        ),
                        const Gap(5),
                        Container(
                          width: null,
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'VND/Month',
                            style: TextStyles.roomPropsContent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Gap(30),
                const Text(
                  'Owner Information',
                  style: TextStyles.detailTitle,
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Name:',
                      style: TextStyles.roomProps,
                    ),
                    SizedBox(
                      width: size.width - 140,
                      child: TextFormField(
                        controller: _nameController,
                        validator: _createRoomPresenter?.validateName,
                        keyboardType: TextInputType.name,
                        cursorColor: Colors.black,
                        style: TextStyles.roomPropsContent,
                        scrollPadding: const EdgeInsets.all(0),
                        maxLines: null,
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        textAlign: TextAlign.justify,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.detailBorder,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 0,
                            right: 0,
                            top: 5,
                            bottom: 0,
                          ),
                          hintText: 'Example: Nguyen Chu Tro',
                          hintStyle: TextStyles.descriptionRoom.copyWith(
                              color: ColorPalette.rankText.withOpacity(0.5)),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Phone:',
                      style: TextStyles.roomProps,
                    ),
                    SizedBox(
                      width: size.width - 140,
                      child: TextFormField(
                        controller: _phoneController,
                        validator: _createRoomPresenter?.validatePhone,
                        keyboardType: TextInputType.phone,
                        cursorColor: Colors.black,
                        style: TextStyles.roomPropsContent,
                        scrollPadding: const EdgeInsets.all(0),
                        maxLines: null,
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        textAlign: TextAlign.justify,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.detailBorder,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 0,
                            right: 0,
                            top: 5,
                            bottom: 0,
                          ),
                          hintText: 'Example: 0123456789',
                          hintStyle: TextStyles.descriptionRoom.copyWith(
                              color: ColorPalette.rankText.withOpacity(0.5)),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Email:',
                      style: TextStyles.roomProps,
                    ),
                    SizedBox(
                      width: size.width - 140,
                      child: TextFormField(
                        controller: _emailController,
                        validator: _createRoomPresenter?.validateEmail,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.black,
                        style: TextStyles.roomPropsContent,
                        scrollPadding: const EdgeInsets.all(0),
                        maxLines: null,
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        textAlign: TextAlign.justify,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.detailBorder,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 0,
                            right: 0,
                            top: 5,
                            bottom: 0,
                          ),
                          hintText: 'Example: abcd@gmail.com',
                          hintStyle: TextStyles.descriptionRoom.copyWith(
                              color: ColorPalette.rankText.withOpacity(0.5)),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Facebook:',
                      style: TextStyles.roomProps,
                    ),
                    SizedBox(
                      width: size.width - 140,
                      child: TextFormField(
                        controller: _facebookController,
                        validator: _createRoomPresenter?.validateFacebook,
                        keyboardType: TextInputType.url,
                        cursorColor: Colors.black,
                        style: TextStyles.roomPropsContent,
                        scrollPadding: const EdgeInsets.all(0),
                        maxLines: null,
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        textAlign: TextAlign.justify,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.detailBorder,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 0,
                            right: 0,
                            top: 5,
                            bottom: 0,
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
                const Gap(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Address:',
                      style: TextStyles.roomProps,
                    ),
                    SizedBox(
                      width: size.width - 140,
                      child: TextFormField(
                        controller: _addressController,
                        validator: _createRoomPresenter?.validateAddress,
                        cursorColor: Colors.black,
                        style: TextStyles.roomPropsContent,
                        scrollPadding: const EdgeInsets.all(0),
                        maxLines: null,
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        textAlign: TextAlign.justify,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.detailBorder,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 0,
                            right: 0,
                            top: 5,
                            bottom: 0,
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
                const Gap(45),
                Container(
                  alignment: Alignment.center,
                  child: ModelButton(
                    name: 'CREATE',
                    onTap: () {
                      //TODO: save room
                      if (_formKey.currentState!.validate()) {
                        _createRoomPresenter?.createButtonPressed(
                            _roomIdController.text,
                            _kindController.text,
                            _areaController.text,
                            _locationController.text,
                            _descriptionController.text,
                            _images,
                            _roomPriceController.text,
                            _waterPriceController.text,
                            _electricPriceController.text,
                            _otherControler.text,
                            _nameController.text,
                            _phoneController.text,
                            _emailController.text,
                            _facebookController.text,
                            _addressController.text);
                      }
                    },
                    width: 150,
                    color: ColorPalette.primaryColor.withOpacity(0.75),
                  ),
                ),
                const Gap(10),
                Container(
                  alignment: Alignment.center,
                  child: ModelButton(
                    name: 'CANCEL',
                    onTap: () {
                      //TODO: save room
                    },
                    width: 150,
                    color: ColorPalette.redColor,
                  ),
                ),
                const Gap(50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onChangeProfilePicture(String pickedImage) {
    setState(() {
      _images.add(pickedImage);
    });
  }

  @override
  void onCreateFailed() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: ColorPalette.greenText,
        content: Text(
          'Cannot create your room! Please try again later!',
          style: TextStyle(color: ColorPalette.errorColor),
        ),
      ),
    );
  }

  @override
  void onCreateSucceeded() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: ColorPalette.greenText,
        content: Text(
          'Your room has been added!',
          style: TextStyle(color: ColorPalette.errorColor),
        ),
      ),
    );
  }

  @override
  void onPopContext() {
    Navigator.of(context, rootNavigator: true).pop();
  }

  @override
  void onWaitingProgressBar() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });
  }
}
