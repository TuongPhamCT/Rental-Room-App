import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  ) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

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
      _view?.onChangeProfilePicture(await pickedImage.readAsBytes());
    }
  }

  Future<void> doneButtonPressed(
      String? email,
      String password,
      String displayName,
      String phone,
      String gender,
      DateTime birthday,
      bool isOwner) async {
    email = email?.trim();
    password = password.trim();
    displayName = displayName.trim();
    _view?.onWaitingProgressBar();
    UserCredential? result = await _registerWithEmailAndPassword(
        email!, password, displayName, phone, gender, birthday, isOwner);
    _view?.onPopContext();
    if (result == null) {
      _view?.onRegisterFailed();
    } else {
      _view?.onRegisterSucceeded();
    }
    //TODO: upload user's data handle
  }
}
