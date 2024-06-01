import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  String userID;
  String userName;
  String email;
  String phone;
  String gender;
  DateTime birthday;
  bool isOwner;

  Users({
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

  factory Users.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Users(
      userID: data['userID'],
      userName: data['name'],
      email: data['email'],
      phone: data['phone'],
      birthday: data['birthDay'].toDate(),
      gender: data['gender'],
      isOwner: data['isOwner'],
    );
  }

  String get getUserName => userName;
  String get getEmail => email;
  String get getPhone => phone;
  DateTime get getBirthday => birthday;
  String get getGender => gender;
  bool get getIsOwner => isOwner;
}
