import 'package:image_picker/image_picker.dart';
import 'package:rental_room_app/Contract/create_room_contract.dart';
import 'package:string_validator/string_validator.dart';

class CreateRoomPresenter {
  // ignore: unused_field
  final CreateRoomContract? _view;
  CreateRoomPresenter(this._view);

  String? validateRoomId(String? value) {
    value = value?.trim();

    if (value == null || value == "") {
      return "Please enter a Room ID";
    }
    return null;
  }

  String? validateKind(String? value) {
    value = value?.trim();

    if (value == null || value == "") {
      return "Please enter Room Kind";
    }
    return null;
  }

  String? validateArea(String? value) {
    if (value == null || value == "") {
      return "Please enter Area";
    }
    if (value.contains(',')) {
      return "Please use '.' instead of ','!";
    }
    double area;
    try {
      area = double.parse(value);
    } catch (e) {
      return "Invalid Area";
    }
    if (area <= 0) {
      return "Area must be greater than 0!";
    }
    return null;
  }

  String? validateLocation(String? value) {
    value = value?.trim();

    if (value == null || value == "") {
      return "Please enter location";
    }
    return null;
  }

  String? validateDescription(String? value) {
    value = value?.trim();

    if (value == null || value == "") {
      return "Please enter description";
    }
    return null;
  }

  String? validateRoomPrice(String? value) {
    value = value?.trim();

    if (value == null || value == "") {
      return "Please enter room price";
    }
    if (value.contains(',')) {
      return "Please use '.' instead of ','!";
    }
    double area;
    try {
      area = double.parse(value);
    } catch (e) {
      return "Invalid room price";
    }
    if (area <= 0) {
      return "Room price must be greater than 0!";
    }
    return null;
  }

  String? validateWaterPrice(String? value) {
    value = value?.trim();

    if (value == null || value == "") {
      return "Please enter water price";
    }
    if (value.contains(',')) {
      return "Please use '.' instead of ','!";
    }
    double area;
    try {
      area = double.parse(value);
    } catch (e) {
      return "Invalid water price";
    }
    if (area <= 0) {
      return "Water price must be greater than 0!";
    }
    return null;
  }

  String? validateElectricPrice(String? value) {
    value = value?.trim();

    if (value == null || value == "") {
      return "Please enter electric price";
    }
    if (value.contains(',')) {
      return "Please use '.' instead of ','!";
    }
    double area;
    try {
      area = double.parse(value);
    } catch (e) {
      return "Invalid electric price";
    }
    if (area <= 0) {
      return "Electric price must be greater than 0!";
    }
    return null;
  }

  String? validateOtherPrice(String? value) {
    value = value?.trim();
    if (value == null || value == "") {
      return "Please enter other prices";
    }
    if (value.contains(',')) {
      return "Please use '.' instead of ','!";
    }
    double area;
    try {
      area = double.parse(value);
    } catch (e) {
      return "Invalid other prices";
    }
    if (area < 0) {
      return "Other prices must not be lesser than 0!";
    }
    return null;
  }

  String? validateName(String? value) {
    value = value?.trim();
    List<String>? nameParts = value?.split(" ");
    RegExp regex = RegExp(r'\d');

    if (value == null || value.isEmpty) {
      return "Please enter your full name!";
    } else if (regex.hasMatch(value)) {
      return "Name must not contain numbers!";
    } else if (value.length < 2) {
      return "Full name must contain at least 2 characters!";
    } else if (nameParts!.length < 2) {
      return "Full name should contain at least 2 parts (first name and last name)!";
    }
    return null;
  }

  String? validatePhone(String? value) {
    value = value?.trim();
    if (value == null || value.isEmpty) {
      return "Please enter your phone number!";
    } else if (value.length > 11 || value.length < 8) {
      return "Phone number must have 8 to 11 digits!";
    }
    return null;
  }

  String? validateEmail(String? value) {
    value = value?.trim();
    if (value == null || value.isEmpty) {
      return "Please enter your email!";
    } else if (!isEmail(value)) {
      return "Email is not in the correct format!";
    }
    return null;
  }

  String? validateFacebook(String? value) {
    value = value?.trim();
    if (value == null || value.isEmpty) {
      return null;
    } else if (!isURL(value)) {
      return "Invalid Facebook link!";
    }
    return null;
  }

  String? validateAddress(String? value) {
    value = value?.trim();
    if (value == null || value.isEmpty) {
      return "Please enter your Address!";
    }
    return null;
  }

    String? validateImage(List<String>? value) {
    if (value == null || value.isEmpty) {
      return "Please add at least one image!";
    }
    return null;
  }

  //
  //logic code
  //
  void selectImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _view?.onChangeProfilePicture(pickedImage.path);
    }
  }
}
