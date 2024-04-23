import 'package:cloud_firestore/cloud_firestore.dart';

class users {
  String userID;
  String userName;
  String email;
  String phone;
  String gender;
  DateTime birthday;
  bool isOwner;

  users({
    required this.userID,
    required this.userName,
    required this.email,
    required this.phone,
    required this.birthday,
    required this.gender,
    required this.isOwner,
  });

  // Phương thức để chuyển đổi dữ liệu thành một Map để lưu trữ trên Firestore
  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'userName': userName,
      'email': email,
      'phone': phone,
      'birthday': birthday,
      'gender': gender,
      'isOwner': isOwner,
    };
  }

  factory users.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return users(
      userID: data['userID'],
      userName: data['userName'],
      email: data['email'],
      phone: data['phone'],
      birthday: data['birthday'].toDate(),
      gender: data['gender'],
      isOwner: data['isOwner'],
    );
  }
}
