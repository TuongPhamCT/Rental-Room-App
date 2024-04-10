import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:rental_room_app/config/asset_helper.dart';
import 'package:rental_room_app/config/image_helper.dart';
import 'package:rental_room_app/themes/color_palete.dart';
import 'package:rental_room_app/themes/text_styles.dart';
import 'package:rental_room_app/widgets/boder_container.dart';
import 'package:rental_room_app/widgets/model_button.dart';
import 'package:rental_room_app/widgets/sub_image_frame.dart';

class DetailRoomScreen extends StatefulWidget {
  const DetailRoomScreen({super.key});
  static final String routeName = "detail_room";

  @override
  State<DetailRoomScreen> createState() => _DetailRoomScreenState();
}

class _DetailRoomScreenState extends State<DetailRoomScreen> {
  bool isPressed = false;
  PageController _pageController = new PageController();
  int _currenImage = 0;
  List<String> images = [
    AssetHelper.priImage,
    AssetHelper.subOne,
    AssetHelper.subTwo,
    AssetHelper.subThree
  ];

  final int numberstar = 5;
  double rating = 4.8;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
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
                            'P001',
                            style: TextStyles.h8,
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
                                borderRadius: BorderRadius.only(
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
                    BoderContainer(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.locationPin,
                            size: 24,
                            color: ColorPalette.primaryColor.withOpacity(0.44),
                          ),
                          Gap(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Location',
                                style: TextStyles.detailTitle,
                              ),
                              Container(
                                width: size.width - 120,
                                child: Text(
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
                    Gap(10),
                    BoderContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Photos',
                            style: TextStyles.detailTitle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SubFrame(
                                child: Image(
                                  image: AssetImage(AssetHelper.subOne),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SubFrame(
                                child: Image(
                                  image: AssetImage(AssetHelper.subTwo),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SubFrame(
                                child: Image(
                                  image: AssetImage(AssetHelper.subThree),
                                  width: (size.width - 120) / 3,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Gap(10),
                    BoderContainer(
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
                Gap(10),
                BoderContainer(
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
                Gap(10),
                BoderContainer(
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
                Gap(10),
                BoderContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: TextStyles.detailTitle,
                      ),
                      Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 50,
                                child: Icon(
                                  FontAwesomeIcons.houseChimney,
                                  size: 15,
                                  color: ColorPalette.primaryColor,
                                ),
                              ),
                              Text(
                                '1.500.000',
                                style: TextStyles.descriptionRoom,
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                          Text(
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
                                child: Icon(
                                  Icons.water_drop_sharp,
                                  size: 15,
                                  color: ColorPalette.primaryColor,
                                ),
                              ),
                              Text(
                                '16.000',
                                style: TextStyles.descriptionRoom,
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                          Text(
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
                                child: Icon(
                                  FontAwesomeIcons.boltLightning,
                                  size: 15,
                                  color: ColorPalette.primaryColor,
                                ),
                              ),
                              Text(
                                '4.500',
                                style: TextStyles.descriptionRoom,
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                          Text(
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
                                child: Icon(
                                  Icons.receipt_long,
                                  size: 15,
                                  color: ColorPalette.primaryColor,
                                ),
                              ),
                              Text(
                                '120.000',
                                style: TextStyles.descriptionRoom,
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                          Text(
                            'VND/Month',
                            style: TextStyles.descriptionRoom,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Gap(10),
                BoderContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Owner Information',
                        style: TextStyles.detailTitle,
                      ),
                      Gap(10),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 50,
                            child: Icon(
                              FontAwesomeIcons.user,
                              size: 15,
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          Text(
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
                            child: Icon(
                              Icons.phone,
                              size: 15,
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          Text(
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
                            child: Icon(
                              FontAwesomeIcons.envelope,
                              size: 15,
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          Text(
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
                            child: Icon(
                              FontAwesomeIcons.facebookSquare,
                              size: 15,
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          Text(
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
                            child: Icon(
                              Icons.location_on,
                              size: 15,
                              color: ColorPalette.primaryColor,
                            ),
                          ),
                          Container(
                            width: size.width - 120,
                            child: Text(
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
                Gap(10),
                ModelButton(
                  onTap: () {},
                  name: 'Rental',
                  color: ColorPalette.primaryColor.withOpacity(0.75),
                  width: 150,
                ),
                RatingBar.builder(
                  initialRating: 4.5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 45,
                  unratedColor: Color(0xffDADADA),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (Null) {
                    // Hàm trống, không làm gì cả
                  },
                  ignoreGestures: true,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  Widget imageIndicator(bool isActive) {
    return Container(
      margin: EdgeInsets.only(left: 12),
      alignment: Alignment.center,
      child: Icon(
        FontAwesomeIcons.solidCircle,
        size: 9,
        color: isActive ? Color(0xffE5E5E5) : ColorPalette.detailBorder,
      ),
    );
  }
}
