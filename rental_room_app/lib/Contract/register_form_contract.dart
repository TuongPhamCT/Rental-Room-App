import 'dart:typed_data';

abstract class RegisterFormContract {
  void onRegisterSucceeded();
  void onRegisterFailed();
  void onChangeProfilePicture(Uint8List pickedImage);
  void onWaitingProgressBar();
  void onPopContext();
}
