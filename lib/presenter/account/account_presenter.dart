import 'package:flutter/cupertino.dart';
import 'package:quandopartir/generated/i18n.dart';
import 'package:quandopartir/util/util.dart';
import 'package:quandopartir/view/account/accaount_view.dart';

abstract class AccountPresenter {
  set view(AccountView view);
  void newAccount();
  String validateName(String name);
  String validateLastName(String lastName);
  String validatePassword(String password);
  String validateEmailText(String email){return null;}
}

class AccountPresenterImpl implements AccountPresenter {

  AccountView _view;
  BuildContext _context;

  AccountPresenterImpl(this._context);

  @override
  String validateName(String name) {

    if (name.isEmpty)
      return S.of(_context).name_required;
    return null;
  }

  @override
  String validateLastName(String lastName) {

    if (lastName.isEmpty)
      return S.of(_context).lastname_required;
    return null;
  }

  String validateEmailText(String email) {
    if (email.isEmpty) {
      return S.of(_context).email_required;
    }

    if (!Util.isEmailValid(email)) {
      return S.of(_context).email_invalid;
    }
    return null;
  }

  @override
  String validatePassword(String password) {

    if (password.isEmpty)
      return S.of(_context).password_required;
    return null;
  }

  @override
  void set view(AccountView view) {
    _view = view;
  }

  @override
  void newAccount() {
    print('New Account presenter');
    _view.showLoading();

    print("newAccount 1");
    Future.delayed(Duration(seconds: 3), () {
      _view.hideLoading();
      return "ok";
    });
    print("newAccount 2");
  }

}