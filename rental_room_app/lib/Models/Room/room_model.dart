import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rental_room_app/Models/Price/price_model.dart';

enum Kind { apartment, flat }

class Room {
  static const String documentId = 'Rooms';

  String roomId;
  String kind;
  double area;
  String location;
  String description;
  List<String> imageUrls;
  Price price;
  String ownerId;
  String ownerName;
  String ownerPhone;
  String ownerEmail;
  String ownerFacebook;
  String ownerAddress;
  bool isAvailable;

  Room(
      {required this.roomId,
      required this.kind,
      required this.area,
      required this.location,
      required this.description,
      required this.imageUrls,
      required this.price,
      required this.ownerId,
      required this.ownerName,
      required this.ownerPhone,
      required this.ownerEmail,
      required this.ownerFacebook,
      required this.ownerAddress,
      required this.isAvailable});

  // Phương thức để chuyển đổi dữ liệu thành một Map để lưu trữ trên Firestore
  Map<String, dynamic> toJson() {
    return {
      'roomId': roomId,
      'kind': kind,
      'area': area,
      'location': location,
      'description': description,
      'imageUrls': imageUrls,
      'price': price.toJson(),
      'ownerId': ownerId,
      'ownerName': ownerName,
      'ownerPhone': ownerPhone,
      'ownerEmail': ownerEmail,
      'ownerFacebook': ownerFacebook,
      'ownerAddress': ownerAddress,
      'isAvailable': isAvailable
    };
  }

  factory Room.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Room(
        roomId: data['roomId'],
        kind: data['kind'],
        area: data['area'],
        location: data['location'],
        description: data['description'],
        imageUrls: data['imageUrls']?.cast<String>(),
        price: Price.fromFirestore(data['price']),
        ownerId: data['ownerId'],
        ownerName: data['ownerName'],
        ownerPhone: data['ownerPhone'],
        ownerEmail: data['ownerEmail'],
        ownerFacebook: data['ownerFacebook'],
        ownerAddress: data['ownerAddress'],
        isAvailable: data['isAvailable']);
  }
}
