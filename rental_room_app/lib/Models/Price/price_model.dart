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

  factory Price.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Price(
      room: data['room'],
      water: data['water'],
      electric: data['electric'],
      others: data['others'],
    );
  }
}
