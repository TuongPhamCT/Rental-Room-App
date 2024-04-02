abstract class LoginViewContract {
  void onLoadComplete();
  void onLoadError();
}

class LoginPresenter {
  LoginViewContract? _view;
}
