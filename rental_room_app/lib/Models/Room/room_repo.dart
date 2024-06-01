import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rental_room_app/Models/Room/room_model.dart';

abstract class RoomRepository {
  Future<void> uploadRoom(Room room);
  Future<List<String>> uploadImages(
      List<Uint8List> images, String userId, String roomId);
  Stream<List<Room>> getRooms();
  Future<Room> getOneRoom(String roomID);
}

class RoomRepositoryIml implements RoomRepository {
  @override
  Future<void> uploadRoom(Room room) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection(Room.documentId).doc();

    // Cập nhật roomId với documentID
    room.roomId = docRef.id;
    await docRef
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

  @override
  Stream<List<Room>> getRooms() {
    return FirebaseFirestore.instance
        .collection(Room.documentId)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Room.fromFirestore(doc)).toList());
  }

  @override
  Future<Room> getOneRoom(String roomID) async {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('Rooms').doc(roomID).get();
    if (doc.exists) {
      return Room.fromFirestore(doc);
    } else {
      throw Exception('This Room data not found');
    }
  }
}
