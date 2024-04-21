import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rental_room_app/Contract/register_form_contract.dart';

class RegisterFormPresenter {
  final RegisterFormContract? _view;
  RegisterFormPresenter(this._view);

  String? password;

  //*
  //Validators
  //*
  String? validatePhoneNum(String? phoneNum) {
    phoneNum = phoneNum?.trim();
    if (phoneNum == null || phoneNum.isEmpty) {
      return "Please enter your phone number!";
    } else if (phoneNum.length > 11 || phoneNum.length < 8) {
      return "Phone number must have 8 to 11 digits!";
    }
    return null;
  }

  String? validateFullName(String? name) {
    name = name?.trim();
    List<String>? nameParts = name?.split(" ");
    RegExp regex = RegExp(r'[^a-zA-Z\s]');

    if (name == null || name.isEmpty) {
      return "Please enter your full name!";
    } else if (regex.hasMatch(name)) {
      return "Name must not contain numbers or symbols!";
    } else if (name.length < 2) {
      return "Full name must contain at least 2 characters!";
    } else if (nameParts!.length < 2) {
      return "Full name should contain at least 2 parts (first name and last name)!";
    }
    return null;
  }

  String? validateGender(String? gender) {
    if (gender == null || gender.isEmpty) {
      return "Please choose your gender!";
    }
    return null;
  }

  String? validateBirthday(DateTime? birthday) {
    if (birthday == null) {
      return "Please enter your birthday!";
    } else if (birthday.isAfter(DateTime.now())) {
      return "Invalid birthday!";
    }
    return null;
  }

  String? validateAccountPassword(String? password) {
    password = password?.trim();
    this.password = password;
    if (password == null || password.isEmpty) {
      return "Please enter your password!";
    } else if (password.length < 6) {
      return "Password must have at least 6 characters!";
    }
    return null;
  }

  String? validateConfirmPassword(String? password) {
    password = password?.trim();
    if (password == null || password.isEmpty) {
      return "Please confirm your password!";
    } else if (this.password != password) {
      return "Passwords do not match!";
    }
    return null;
  }

  //*
  //Screen Logics
  //*

  Future<UserCredential?> _registerWithEmailAndPassword(
    String email,
    String password,
    String displayName,
    String phone,
    String gender,
    DateTime birthday,
    bool isOwner,
    String? avatar,
  ) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (avatar != null && avatar.isNotEmpty) {
        // Upload File to Firebase Storage
        Reference ref = FirebaseStorage.instance
            .ref()
            .child('avatars')
            .child('${userCredential.user!.uid}.jpg');
        Uint8List imageData = await File(avatar).readAsBytes();
        await ref.putData(
            imageData, SettableMetadata(contentType: 'image/jpeg'));

        String url = await ref.getDownloadURL();
        await userCredential.user!.updatePhotoURL(url);
      } else {
        await userCredential.user!.updatePhotoURL(
            'https://firebasestorage.googleapis.com/v0/b/rental-room-c34cb.appspot.com/o/avatar.jpg?alt=media&token=e9a9f6f6-9200-405a-98b4-5ae1130cd4bf');
      }

      await userCredential.user!.updateDisplayName(displayName);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'email': email,
        'Name': displayName,
        'phone': phone,
        'birthday': birthday,
        'gender': gender,
        'isOwner': isOwner
      });
      return userCredential;
    } catch (e) {
      if (kDebugMode) {
        print('Error creating user: $e');
      }
      return null;
    }
  }

  void selectImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _view?.onChangeProfilePicture(pickedImage.path);
      print(pickedImage.path);
    }
  }

  Future<void> doneButtonPressed(
    String? email,
    String password,
    String displayName,
    String phone,
    String gender,
    DateTime birthday,
    bool isOwner,
    String? avatar,
  ) async {
    email = email?.trim();
    password = password.trim();
    displayName = displayName.trim();
    _view?.onWaitingProgressBar();

    UserCredential? result = await _registerWithEmailAndPassword(email!,
        password, displayName, phone, gender, birthday, isOwner, avatar);

    _view?.onPopContext();
    if (result == null) {
      _view?.onRegisterFailed();
    } else {
      _view?.onRegisterSucceeded();
    }
    //TODO: upload user's data handle
  }
}
