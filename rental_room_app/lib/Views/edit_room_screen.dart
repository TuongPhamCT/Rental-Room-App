import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:rental_room_app/themes/color_palete.dart';
import 'package:rental_room_app/themes/text_styles.dart';
import 'package:rental_room_app/widgets/model_button.dart';

class EditRoomScreen extends StatefulWidget {
  const EditRoomScreen({super.key});

  @override
  State<EditRoomScreen> createState() => _EditRoomScreenState();
}

class _EditRoomScreenState extends State<EditRoomScreen> {
  bool isVisibleFilter = false;
  final _roomIDController = TextEditingController();
  final _kindController = TextEditingController();
  final _areaController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceRoomController = TextEditingController();
  final _priceWaterController = TextEditingController();
  final _priceElectricController = TextEditingController();
  final _priceOtherController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _facebookController = TextEditingController();
  final _addressController = TextEditingController();
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
                    child: TextField(
                      controller: _roomIDController,
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
                    child: TextField(
                      controller: _kindController,
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
                    child: TextField(
                      controller: _areaController,
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
                    child: TextField(
                      controller: _locationController,
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
                height: 35,
                child: const Text(
                  'Description:',
                  style: TextStyles.roomProps,
                ),
              ),
              TextField(
                controller: _descriptionController,
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
                  hintText: 'Example: A beautiful room with full furniture',
                  hintStyle: TextStyles.descriptionRoom
                      .copyWith(color: ColorPalette.rankText.withOpacity(0.5)),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 35,
                child: const Text(
                  'Pictures:',
                  style: TextStyles.roomProps,
                ),
              ),
              const Column(
                  //them anh do cho day
                  ),
              Container(
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  width: 250,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: ColorPalette.detailBorder.withOpacity(0.1),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Text('Upload Here'),
                ),
              ),
              const Gap(30),
              const Text(
                'Price',
                style: TextStyles.detailTitle,
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    child: const Text(
                      'Room:',
                      style: TextStyles.roomProps,
                    ),
                  ),
                  SizedBox(
                    width: size.width - 200,
                    child: TextField(
                      controller: _priceRoomController,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      style: TextStyles.roomPropsContent,
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
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    alignment: Alignment.centerRight,
                    child: const Text(
                      'VND/Month',
                      style: TextStyles.roomPropsContent,
                    ),
                  ),
                ],
              ),
              const Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    child: const Text(
                      'Water:',
                      style: TextStyles.roomProps,
                    ),
                  ),
                  SizedBox(
                    width: size.width - 200,
                    child: TextField(
                      controller: _priceWaterController,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      style: TextStyles.roomPropsContent,
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
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    alignment: Alignment.centerRight,
                    child: const Text(
                      'VND/m3',
                      style: TextStyles.roomPropsContent,
                    ),
                  ),
                ],
              ),
              const Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    child: const Text(
                      'Electric:',
                      style: TextStyles.roomProps,
                    ),
                  ),
                  SizedBox(
                    width: size.width - 200,
                    child: TextField(
                      controller: _priceElectricController,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      style: TextStyles.roomPropsContent,
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
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    alignment: Alignment.centerRight,
                    child: const Text(
                      'VND/kWh',
                      style: TextStyles.roomPropsContent,
                    ),
                  ),
                ],
              ),
              const Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    child: const Text(
                      'Other:',
                      style: TextStyles.roomProps,
                    ),
                  ),
                  SizedBox(
                    width: size.width - 200,
                    child: TextField(
                      controller: _priceOtherController,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      style: TextStyles.roomPropsContent,
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
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    alignment: Alignment.centerRight,
                    child: const Text(
                      'VND/Month',
                      style: TextStyles.roomPropsContent,
                    ),
                  ),
                ],
              ),
              const Gap(5),
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
                    child: TextField(
                      controller: _nameController,
                      cursorColor: Colors.black,
                      style: TextStyles.roomPropsContent,
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
                    child: TextField(
                      controller: _phoneController,
                      cursorColor: Colors.black,
                      style: TextStyles.roomPropsContent,
                      maxLines: null,
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      keyboardType: TextInputType.number,
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
                    child: TextField(
                      controller: _emailController,
                      cursorColor: Colors.black,
                      style: TextStyles.roomPropsContent,
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
                    child: TextField(
                      controller: _facebookController,
                      cursorColor: Colors.black,
                      style: TextStyles.roomPropsContent,
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
                    child: TextField(
                      controller: _addressController,
                      cursorColor: Colors.black,
                      style: TextStyles.roomPropsContent,
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
                  name: 'Save',
                  onTap: () {
                    //save room
                  },
                  width: 150,
                  color: ColorPalette.primaryColor.withOpacity(0.75),
                ),
              ),
              const Gap(10),
              Container(
                alignment: Alignment.center,
                child: ModelButton(
                  name: 'DELETE',
                  onTap: () {
                    //save room
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
    );
  }
}
