import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:rental_room_app/Models/Comment/comment_model.dart';
import 'package:rental_room_app/Models/User/user_repo.dart';
import 'package:rental_room_app/config/asset_helper.dart';
import 'package:rental_room_app/themes/color_palete.dart';
import 'package:rental_room_app/themes/text_styles.dart';

class CommentWidget extends StatefulWidget {
  final Comment comment;
  const CommentWidget({super.key, required this.comment});

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  UserRepository _userRepository = UserRepositoryIml();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: ColorPalette.detailBorder.withOpacity(0.5),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(AssetHelper.avatar),
                      fit: BoxFit.cover,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        FutureBuilder(
                            future: _userRepository
                                .getUserById(widget.comment.userId),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!.userName,
                                  style: TextStyles.h5,
                                );
                              } else {
                                return const SizedBox(height: 20, width: 35);
                              }
                            }),
                        const Gap(10),
                        Container(
                          alignment: Alignment.center,
                          child: RatingBar.builder(
                            ignoreGestures: true,
                            initialRating: widget.comment.rating,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 15,
                            unratedColor: ColorPalette.primaryColor,
                            itemBuilder: (context, index) {
                              if (index < widget.comment.rating) {
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
                            onRatingUpdate: (double value) {},
                          ),
                        ),
                        const Gap(5),
                      ],
                    ),
                    FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(
                          widget.comment.content,
                          style: TextStyles.h6,
                        )),
                    const Gap(2),
                    Text(
                      widget.comment.time,
                      style: TextStyles.h6,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
