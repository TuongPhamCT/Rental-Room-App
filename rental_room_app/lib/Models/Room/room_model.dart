import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rental_room_app/Models/Price/price_model.dart';

enum Kind { apartment, flat }

class Room {
  String roomId;
  String ownerId;
  String kind;
  double area;
  String location;
  String description;
  Price price;
  bool isAvailable;

  Room(
      {required this.roomId,
      required this.ownerId,
      required this.kind,
      required this.area,
      required this.location,
      required this.description,
      required this.price,
      required this.isAvailable});

  // Phương thức để chuyển đổi dữ liệu thành một Map để lưu trữ trên Firestore
  Map<String, dynamic> toJson() {
    return {
      'roomId': roomId,
      'ownerId': ownerId,
      'kind': kind,
      'area': area,
      'location': location,
      'description': description,
      'price': price.toJson(),
      'isAvailable': isAvailable
    };
  }

  factory Room.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Room(
        roomId: data['roomId'],
        ownerId: data['ownerId'],
        kind: data['kind'],
        area: data['area'],
        location: data['location'],
        description: data['description'],
        price: Price.fromFirestore(data['price']),
        isAvailable: data['isAvailable']);
  }
}
