import 'package:rental_room_app/Contract/rental_form_contract.dart';

class RentalFormPresenter {
  final RentalFormContract? _view;
  RentalFormPresenter(this._view);

  String? password;

  //*
  //Validators
  //*
  String? validateGuestName(String? guestName) {
    return null;
  }

  String? validateRoomId(String? roomId) {
    return null;
  }

  String? validateGender(String? gender) {
    if (gender == null || gender.isEmpty) {
      return "Please choose your gender!";
    }
    return null;
  }

  String? validatePhoneNum(String? phoneNum) {
    return null;
  }

  String? validateIdentification(String? id) {
    return null;
  }

  String? validateEmail(String? email) {
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

  String? validateStartDate(DateTime? startDate) {
    if (startDate == null) {
      return "Please enter your start date!";
    } else if (startDate.isBefore(DateTime.now())) {
      return "Invalid start date!";
    }
    return null;
  }

  String? validateDeposit(String? deposit) {
    return null;
  }

  String? validateFacebook(String? facebook) {
    return null;
  }

  //*
  //Screen Logics
  //*
}
