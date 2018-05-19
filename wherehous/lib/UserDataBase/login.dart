import 'restData.dart';
import 'user.dart';

abstract class LoginPageContract
{
  void onLoginSuccess(User user);
  void onLoginError(String error);
}

class LoginPagePresenter
{
  LoginPageContract _view;
  RestData api = new RestData();
  LoginPagePresenter(this._view);

  doLogin(String username, String password)
  {
    api // i like this formatting :D
      .login(username, password)
      .then((User user)=>_view.onLoginSuccess(user))
      .catchError((onError)=>_view.onLoginError(onError));
  }
}