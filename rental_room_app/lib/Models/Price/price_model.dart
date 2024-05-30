import 'package:cloud_firestore/cloud_firestore.dart';

class Price {
  double room;
  double water;
  double electric;
  double others;

  Price(
      {required this.room,
      required this.water,
      required this.electric,
      required this.others});

  // Phương thức để chuyển đổi dữ liệu thành một Map để lưu trữ trên Firestore
  Map<String, dynamic> toJson() {
    return {
      'room': room,
      'water': water,
      'electric': electric,
      'others': others
    };
  }

  factory Price.fromFirestore(Map<String, dynamic> data) {
    return Price(
      room: double.parse(data['room'].toString()),
      water: double.parse(data['water'].toString()),
      electric: double.parse(data['electric'].toString()),
      others: double.parse(data['others'].toString()),
    );
  }
  double get roomPrice => room;
  double get waterPrice => water;
  double get electricPrice => electric;
  double get othersPrice => others;
}
