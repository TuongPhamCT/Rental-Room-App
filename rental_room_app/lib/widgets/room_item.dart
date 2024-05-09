import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:rental_room_app/Models/Room/room_model.dart';
import 'package:rental_room_app/config/asset_helper.dart';
import 'package:rental_room_app/themes/color_palete.dart';
import 'package:rental_room_app/themes/text_styles.dart';

class RoomItem extends StatefulWidget {
  Room room;
  RoomItem({super.key, required this.room});

  @override
  State<RoomItem> createState() => _RoomItemState();
}

class _RoomItemState extends State<RoomItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //To Do: Navigate to RoomDetailScreen
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: ColorPalette.backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ColorPalette.grayText),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.network(
                widget.room.primaryImgUrl,
                width: double.infinity,
                height: 105,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        widget.room.roomId,
                        style: TextStyles.nameRoomItem,
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(AssetHelper.iconRoomKind),
                        Container(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(
                            widget.room.kind,
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      height: 1,
                      width: double.infinity,
                      color: ColorPalette.grayText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$ ' + widget.room.price.roomPrice.toString(),
                          style: TextStyles.nameRoomItem.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'VNĐ/month',
                          style: TextStyles.nameRoomItem.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.square,
                          color: ColorPalette.primaryColor,
                          size: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(
                            widget.room.area.toString(),
                            style: TextStyles.nameRoomItem.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        Text(
                          'm2',
                          style: TextStyles.nameRoomItem.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RatingBar.builder(
                          initialRating: 4.5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 13,
                          unratedColor: const Color(0xffDADADA),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (value) {},
                          ignoreGestures: true,
                        ),
                        Text(
                          '4.5',
                          style: TextStyles.nameRoomItem.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '(123,456)',
                          style: TextStyles.desFunction,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
