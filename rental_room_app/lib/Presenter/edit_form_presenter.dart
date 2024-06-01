import 'package:rental_room_app/Contract/edit_form_contract.dart';

class EditFormPresenter {
  final EditFormContract? _view;
  EditFormPresenter(this._view);

  String? password;

  //*
  //Validators
  //*

  String? validateIdentification(String? id) {
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

  String? validateFacebook(String? facebook) {
    return null;
  }

  //*
  //Screen Logics
  //*

  String? validateRoomId(String? p1) {
    return null;
  }

  String? validateDeposit(String? p1) {}

  void sendRentalForm(String roomId, String text, String text2,
      DateTime? startDate, String text3, String text4, String text5) {}
}
