import 'dart:typed_data';

abstract class RegisterFormContract {
  void onRegisterSucceeded();
  void onRegisterFailed();
  void onChangeProfilePicture(String pickedImage);
  void onWaitingProgressBar();
  void onPopContext();
}
