import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rental_room_app/Models/Room/room_model.dart';

abstract class RoomRepository {
  Future<void> uploadRoom(Room room);
  Future<List<String>> uploadImages(
      List<Uint8List> images, String userId, String roomId);
}

class RoomRepositoryIml implements RoomRepository {
  @override
  Future<void> uploadRoom(Room room) async {
    await FirebaseFirestore.instance
        .collection(Room.documentId)
        .doc()
        .set(room.toJson())
        .onError((e, _) => throw Exception('Upload Room Failed'));
  }

  @override
  Future<List<String>> uploadImages(
      List<Uint8List> images, String userId, String roomId) async {
    int fileName = 0;
    List<String> imageUrls = [];

    for (Uint8List image in images) {
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('Rooms')
          .child(userId)
          .child(roomId)
          .child('pic$fileName.jpg');
      fileName++;
      await ref.putData(image, SettableMetadata(contentType: 'image/jpeg'));

      String url = await ref.getDownloadURL();
      imageUrls.add(url);
    }
    return imageUrls;
  }
}
