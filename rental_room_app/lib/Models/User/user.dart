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
  Map<String, dynamic> toMap() {
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

  // Phương thức tạo một đối tượng User từ một tài liệu Firestore
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

void addUserToFirestore(users user) async {
  try {
    Map<String, dynamic> userData = user.toMap();
    DocumentReference docRef =
        await FirebaseFirestore.instance.collection('users').add(userData);
    print('User added to Firestore with ID: ${docRef.id}');
  } catch (e) {
    print('Error adding user to Firestore: $e');
  }
}
