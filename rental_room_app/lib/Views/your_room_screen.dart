import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:rental_room_app/config/asset_helper.dart';
import 'package:rental_room_app/themes/color_palete.dart';
import 'package:rental_room_app/themes/text_styles.dart';
import 'package:rental_room_app/widgets/border_container.dart';
import 'package:rental_room_app/widgets/model_button.dart';
import 'package:rental_room_app/widgets/sub_image_frame.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YourRoomScreen extends StatefulWidget {
  const YourRoomScreen({super.key});
  static const String routeName = "detail_room";

  @override
  State<YourRoomScreen> createState() => _YourRoomScreenState();
}

class _YourRoomScreenState extends State<YourRoomScreen> {
  bool isPressed = false;
  final PageController _pageController = PageController();
  int _currenImage = 0;
  List<String> images = [
    AssetHelper.priImage,
    AssetHelper.subOne,
    AssetHelper.subTwo,
    AssetHelper.subThree
  ];

  final int numberstar = 5;
  double rating = 0;

  int _selectedIndex = 1;
  late bool _isOwner;

  @override
  void initState() {
    super.initState();
    _getUserInfoFromSharedPreferences();
  }

  Future<void> _getUserInfoFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isOwner = prefs.getBool('isOwner') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currenImage = index;
                    });
                  },
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 250,
                      alignment: Alignment.bottomCenter,
                      child: Image(
                        image: AssetImage(images[index]),
                        height: 250,
                        width: size.width,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 90,
                      padding:
                          const EdgeInsets.only(left: 42, right: 42, top: 50),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              FontAwesomeIcons.arrowLeft,
                              color: isPressed
                                  ? ColorPalette.primaryColor
                                  : ColorPalette.backgroundColor,
                            ),
                          ),
                          Expanded(
                              child: Center(
                                  child: Text(
                            'P002',
                            style: TextStyles.h8.copyWith(
                              shadows: [
                                const Shadow(
                                  color: Colors.black12,
                                  offset: Offset(3, 6),
                                  blurRadius: 6,
                                )
                              ],
                            ),
                          ))),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      alignment: Alignment.center,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            width: 21 * 4,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return imageIndicator(index == _currenImage);
                              },
                            ),
                          ),
                          Container(
                            width: size.width,
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 55,
                              height: 20,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10)),
                                color: Colors.orangeAccent.withOpacity(0.8),
                              ),
                              child: Text(
                                'Booked',
                                textAlign: TextAlign.center,
                                style: TextStyles.calendarNote.copyWith(
                                  fontSize: 10,
                                  color: ColorPalette.backgroundColor,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BorderContainer(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.locationPin,
                            size: 24,
                            color: ColorPalette.primaryColor.withOpacity(0.44),
                          ),
                          const Gap(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Location',
                                style: TextStyles.detailTitle,
                              ),
                              SizedBox(
                                width: size.width - 120,
                                child: const Text(
                                  '43 Tân Lập, Đông Hoà, Dĩ An, Bình Dương',
                                  style: TextStyles.descriptionRoom,
                                  softWrap: true,
                                  maxLines: 3,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Gap(10),
                    BorderContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Photos',
                            style: TextStyles.detailTitle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SubFrame(
                                child: Image(
                                  image: AssetImage(AssetHelper.subOne),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SubFrame(
                                child: Image(
                                  image: AssetImage(AssetHelper.subTwo),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SubFrame(
                                child: Image(
                                  image: const AssetImage(AssetHelper.subThree),
                                  width: (size.width - 120) / 3,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Gap(10),
                    const BorderContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description',
                            style: TextStyles.detailTitle,
                          ),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, molestie ipsum et, consequat nunc. Nulla nec purus feugiat, molestie ipsum et, consequat nunc. Nulla nec purus feugiat, molestie ipsum et, consequat nunc.',
                            style: TextStyles.descriptionRoom,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap(10),
                const BorderContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kind',
                        style: TextStyles.detailTitle,
                      ),
                      Text(
                        'Standard',
                        style: TextStyles.descriptionRoom,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                const BorderContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Area',
                        style: TextStyles.detailTitle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '60',
                            style: TextStyles.descriptionRoom,
                            textAlign: TextAlign.justify,
                          ),
                          Text(
                            'm2',
                            style: TextStyles.descriptionRoom,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                BorderContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Price',
                        style: TextStyles.detailTitle,
                      ),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 50,
                                child: const Icon(
                                  FontAwesomeIcons.houseChimney,
                                  size: 15,
                                  color: ColorPalette.primaryColor,
                                ),
                              ),
                              const Text(
                                '1.500.000',
                                style: TextStyles.descriptionRoom,
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                          const Text(
                            'VND/Month',
                            style: TextStyles.descriptionRoom,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 50,
                                child: const Icon(
                                  Icons.water_drop_sharp,
                                  size: 15,
                                  color: ColorPalette.primaryColor,
                                ),
                              ),
                              const Text(
                                '16.000',
                                style: TextStyles.descriptionRoom,
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                          const Text(
                            'VND/m3',
                            style: TextStyles.descriptionRoom,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 50,
                                child: const Icon(
                                  FontAwesomeIcons.boltLightning,
                                  size: 15,
                                  color: ColorPalette.primaryColor,
                                ),
                              ),
                              const Text(
                                '4.500',
                                style: TextStyles.descriptionRoom,
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                          const Text(
                            'VND/kWh',
                            style: TextStyles.descriptionRoom,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 50,
                                child: const Icon(
                                  Icons.receipt_long,
                                  size: 15,
                                  color: ColorPalette.primaryColor,
                                ),
                              ),
                              const Text(
                                '120.000',
                                style: TextStyles.descriptionRoom,
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                          const Text(
                            'VND/Month',
                            style: TextStyles.descriptionRoom,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                BorderContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Owner Information',
                        style: TextStyles.detailTitle,
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 50,
                            child: const Icon(
                              FontAwesomeIcons.user,
                              size: 15,
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          const Text(
                            'Nguyen Chu Tro',
                            style: TextStyles.descriptionRoom,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 50,
                            child: const Icon(
                              Icons.phone_outlined,
                              size: 15,
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          const Text(
                            '0123456789',
                            style: TextStyles.descriptionRoom,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 50,
                            child: const Icon(
                              FontAwesomeIcons.envelope,
                              size: 15,
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          const Text(
                            'abcd@gmail.com',
                            style: TextStyles.descriptionRoom,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 50,
                            child: const Icon(
                              FontAwesomeIcons.squareFacebook,
                              size: 15,
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          const Text(
                            'www.facebook.com/username',
                            style: TextStyles.descriptionRoom,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 50,
                            child: const Icon(
                              Icons.location_on,
                              size: 15,
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: size.width - 120,
                            child: const Text(
                              '1 Vo Van Ngan, Thu Duc, HCMC',
                              style: TextStyles.descriptionRoom,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                BorderContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Rental Information',
                        style: TextStyles.detailTitle,
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 50,
                            child: const Icon(
                              FontAwesomeIcons.user,
                              size: 15,
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          const Text(
                            'Nguyen Nguoi Thue',
                            style: TextStyles.descriptionRoom,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 50,
                            child: const Icon(
                              Icons.male,
                              size: 15,
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          const Text(
                            'Male',
                            style: TextStyles.descriptionRoom,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 50,
                            child: const Icon(
                              Icons.phone_outlined,
                              size: 15,
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          const Text(
                            '0123456789',
                            style: TextStyles.descriptionRoom,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 50,
                            child: const Icon(
                              Icons.business,
                              size: 15,
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          const Text(
                            '012345678910',
                            style: TextStyles.descriptionRoom,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 50,
                            child: const Icon(
                              FontAwesomeIcons.envelope,
                              size: 15,
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          const Text(
                            'abcd@gmail.com',
                            style: TextStyles.descriptionRoom,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 50,
                            child: const Icon(
                              Icons.cake_outlined,
                              size: 15,
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          const Text(
                            '01/01/2024',
                            style: TextStyles.descriptionRoom,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 50,
                            child: const Icon(
                              Icons.people_alt_outlined,
                              size: 15,
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          const Text(
                            '5 persons',
                            style: TextStyles.descriptionRoom,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 50,
                            child: const Icon(
                              FontAwesomeIcons.solidHourglassHalf,
                              size: 15,
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          const Text(
                            '6 months',
                            style: TextStyles.descriptionRoom,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 50,
                            child: const Icon(
                              FontAwesomeIcons.moneyBillWave,
                              size: 15,
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          const Text(
                            '2.000.000 VND',
                            style: TextStyles.descriptionRoom,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 50,
                            child: const Icon(
                              FontAwesomeIcons.squareFacebook,
                              size: 15,
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          const Text(
                            'www.facebook.com/username',
                            style: TextStyles.descriptionRoom,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                ModelButton(
                  onTap: () {},
                  name: 'EDIT FORM',
                  color: ColorPalette.primaryColor.withOpacity(0.75),
                  width: 150,
                ),
                const Gap(5),
                ModelButton(
                  onTap: () {},
                  name: 'CHECK OUT',
                  color: ColorPalette.redColor,
                  width: 150,
                ),
                const Gap(5),
                ModelButton(
                  onTap: () {
                    GoRouter.of(context).go('/edit_room');
                  },
                  name: 'EDIT ROOM',
                  color: ColorPalette.primaryColor.withOpacity(0.75),
                  width: 150,
                ),
                const Gap(10),
                BorderContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Rating',
                        style: TextStyles.detailTitle,
                      ),
                      const Gap(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 130,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '4,8',
                                  style: TextStyles.ratingNumb,
                                ),
                                RatingBar.builder(
                                  initialRating: 4.8,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 18,
                                  unratedColor: const Color(0xffDADADA),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (value) {},
                                  ignoreGestures: true,
                                ),
                                const Text(
                                  '123.456',
                                  style: TextStyles.ratingText,
                                ),
                              ],
                            ),
                          ),
                          const Gap(15),
                          SizedBox(
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(
                                  width: size.width - 180,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        '5',
                                        style: TextStyles.ratingText,
                                      ),
                                      SizedBox(
                                        width: size.width - 190,
                                        child: LinearProgressIndicator(
                                          value: 0.8,
                                          backgroundColor:
                                              const Color(0xffDADADA),
                                          valueColor:
                                              const AlwaysStoppedAnimation<
                                                      Color>(
                                                  ColorPalette.primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          minHeight: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: size.width - 180,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        '4',
                                        style: TextStyles.ratingText,
                                      ),
                                      SizedBox(
                                        width: size.width - 190,
                                        child: LinearProgressIndicator(
                                          value: 0.2,
                                          backgroundColor:
                                              const Color(0xffDADADA),
                                          valueColor:
                                              const AlwaysStoppedAnimation<
                                                      Color>(
                                                  ColorPalette.primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          minHeight: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: size.width - 180,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        '3',
                                        style: TextStyles.ratingText,
                                      ),
                                      SizedBox(
                                        width: size.width - 190,
                                        child: LinearProgressIndicator(
                                          value: 0.1,
                                          backgroundColor:
                                              const Color(0xffDADADA),
                                          valueColor:
                                              const AlwaysStoppedAnimation<
                                                      Color>(
                                                  ColorPalette.primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          minHeight: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: size.width - 180,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        '2',
                                        style: TextStyles.ratingText,
                                      ),
                                      SizedBox(
                                        width: size.width - 190,
                                        child: LinearProgressIndicator(
                                          value: 0.05,
                                          backgroundColor:
                                              const Color(0xffDADADA),
                                          valueColor:
                                              const AlwaysStoppedAnimation<
                                                      Color>(
                                                  ColorPalette.primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          minHeight: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: size.width - 180,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        '1',
                                        style: TextStyles.ratingText,
                                      ),
                                      SizedBox(
                                        width: size.width - 190,
                                        child: LinearProgressIndicator(
                                          value: 0,
                                          backgroundColor:
                                              const Color(0xffDADADA),
                                          valueColor:
                                              const AlwaysStoppedAnimation<
                                                      Color>(
                                                  ColorPalette.primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          minHeight: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                BorderContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Rating for this room',
                        style: TextStyles.detailTitle,
                      ),
                      const Gap(5),
                      Container(
                        alignment: Alignment.center,
                        child: RatingBar.builder(
                          initialRating: rating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 60,
                          unratedColor: ColorPalette.primaryColor,
                          itemBuilder: (context, index) {
                            if (index < rating) {
                              return const Icon(
                                Icons.star,
                                color: Colors.amber,
                              );
                            } else {
                              return const Icon(
                                Icons.star_border_outlined,
                              );
                            }
                          },
                          onRatingUpdate: (double newRating) {
                            setState(() {
                              rating = newRating;
                            });
                          },
                        ),
                      ),
                      const Gap(5),
                      const Text(
                        'Write your review:',
                        style: TextStyles.detailTitle,
                      ),
                      TextField(
                        maxLines: null,
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        textAlign: TextAlign.justify,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          hintText: 'Write your review',
                          hintStyle: TextStyles.descriptionRoom.copyWith(
                              color: ColorPalette.rankText.withOpacity(0.5)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: ColorPalette.rankText.withOpacity(0.1),
                            ),
                          ),
                        ),
                      ),
                      const Gap(10),
                      ModelButton(
                        onTap: () {},
                        name: 'POST',
                        color: ColorPalette.primaryColor.withOpacity(0.75),
                        width: 150,
                      ),
                    ],
                  ),
                ),
                const Gap(15),
              ],
            ),
          ),
        ],
      )),
      bottomNavigationBar: SalomonBottomBar(
          backgroundColor: ColorPalette.backgroundColor,
          currentIndex: _selectedIndex,
          onTap: (id) {
            setState(() {
              _selectedIndex = id;
            });
            switch (id) {
              case 0:
                GoRouter.of(context).go('/home');
                break;
              case 1:
                GoRouter.of(context).go('/your_room');
                break;
              case 2:
                GoRouter.of(context).go('/notification_list');
                break;
              case 3:
                GoRouter.of(context).go('/setting');
                break;
              default:
                break;
            }
          },
          items: [
            SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.house,
                  color: ColorPalette.primaryColor,
                  size: 20,
                ),
                title: const Text(
                  'Home',
                  style: TextStyles.bottomBar,
                )),
            if (!_isOwner)
              SalomonBottomBarItem(
                  icon: const Icon(
                    FontAwesomeIcons.doorOpen,
                    color: ColorPalette.primaryColor,
                    size: 20,
                  ),
                  title: const Text(
                    'Your Room',
                    style: TextStyles.bottomBar,
                  )),
            if (_isOwner)
              SalomonBottomBarItem(
                  icon: const Icon(
                    FontAwesomeIcons.chartLine,
                    color: ColorPalette.primaryColor,
                    size: 20,
                  ),
                  title: const Text(
                    'Statistic',
                    style: TextStyles.bottomBar,
                  )),
            SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.bell,
                  color: ColorPalette.primaryColor,
                  size: 20,
                ),
                title: const Text(
                  'Notification',
                  style: TextStyles.bottomBar,
                )),
            SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.gear,
                  color: ColorPalette.primaryColor,
                  size: 20,
                ),
                title: const Text(
                  'Setting',
                  style: TextStyles.bottomBar,
                )),
          ]),
    );
  }

  Widget imageIndicator(bool isActive) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      alignment: Alignment.center,
      child: Icon(
        FontAwesomeIcons.solidCircle,
        size: 9,
        color: isActive ? const Color(0xffE5E5E5) : ColorPalette.detailBorder,
      ),
    );
  }
}
