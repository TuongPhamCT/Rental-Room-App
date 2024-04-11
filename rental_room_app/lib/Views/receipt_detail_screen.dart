import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gap/gap.dart';
import 'package:rental_room_app/themes/color_palete.dart';
import 'package:rental_room_app/themes/text_styles.dart';
import 'package:rental_room_app/widgets/border_container.dart';
import 'package:rental_room_app/widgets/model_button.dart';

class ReceiptDetailScreen extends StatefulWidget {
  const ReceiptDetailScreen({super.key});

  @override
  State<ReceiptDetailScreen> createState() => _ReceiptDetailScreenState();
}

class _ReceiptDetailScreenState extends State<ReceiptDetailScreen> {
  String status = 'Unpaid';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorPalette.primaryColor,
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
        title: Text('RECEIPT DETAIL',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            Container(
              alignment: Alignment.center,
              child: Text(
                'January',
                style: TextStyles.detailTitle.copyWith(fontSize: 30),
              ),
            ),
            const Gap(15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: BorderContainer(
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
                          'P002',
                          style: TextStyles.descriptionRoom,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Gap(20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: const Text('Bill', style: TextStyles.detailTitle),
            ),
            const Gap(10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
              child: Table(
                border: TableBorder.all(
                  width: 1.0,
                  color: Colors.black,
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                children: List.generate(
                  5,
                  (rowIndex) {
                    return TableRow(
                      children: List.generate(
                        5,
                        (colIndex) {
                          if (rowIndex == 0) {
                            // Hàng đầu tiên
                            switch (colIndex) {
                              case 0:
                                return TableCell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50.0,
                                    child: const Text('No'),
                                  ),
                                );
                              case 1:
                                return TableCell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50.0,
                                    child: const Text('Name'),
                                  ),
                                );
                              case 2:
                                return TableCell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50.0,
                                    child: const Text('Price'),
                                  ),
                                );
                              case 3:
                                return TableCell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50.0,
                                    child: const Text('Quantity'),
                                  ),
                                );
                              case 4:
                                return TableCell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50.0,
                                    child: const Text('Total'),
                                  ),
                                );
                              default:
                                return Container();
                            }
                          } else {
                            // Các hàng tiếp theo
                            if (colIndex == 0) {
                              // Cột đầu tiên
                              return TableCell(
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50.0,
                                  child:
                                      Text('$rowIndex'), // Đánh số từ 1 đến 4
                                ),
                              );
                            } else {
                              // Các ô khác bỏ trống
                              return Container();
                            }
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('TOTAL:', style: TextStyles.total),
                  Text('2.000.000 VND',
                      style: TextStyles.total.copyWith(color: Colors.black)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Status:', style: TextStyles.detailTitle),
                  Text(status, style: TextStyles.descriptionRoom),
                ],
              ),
            ),
            const Gap(20),
            ModelButton(
              onTap: () {},
              name: 'Paid The Bill',
              color: ColorPalette.primaryColor.withOpacity(0.75),
              width: 180,
            ),
            const Gap(10),
            ModelButton(
              onTap: () {},
              name: 'Print Receipt',
              color: ColorPalette.darkBlueText.withOpacity(0.75),
              width: 180,
            ),
            const Gap(30),
          ],
        ),
      ),
    );
  }
}
