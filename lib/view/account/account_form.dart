import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quandopartir/generated/i18n.dart';
import 'package:quandopartir/presenter/account/account_presenter.dart';
import 'package:quandopartir/util/my_color.dart';
import 'package:quandopartir/view/account/accaount_view.dart';
import 'package:progress_dialog/progress_dialog.dart';

class AccountForm extends StatefulWidget {

  final AccountPresenter _presenter;

  AccountForm(this._presenter);

  @override
  State<StatefulWidget> createState() => _AccountState();
}

class _AccountState extends State<AccountForm> implements AccountView {
  //identifies the Form and allows form's validation
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  ProgressDialog _progressDialog;

  @override
  void initState() {
    super.initState();
    this.widget._presenter.view = this;
  }

  @override
  void didUpdateWidget(AccountForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    this.widget._presenter.view = this;
  }

  void _buildProgressDialog(BuildContext context) {
    _progressDialog = ProgressDialog(context);
    _progressDialog.style(message: "Wait...", backgroundColor: MyColor.accentColor());
  }


  String _validateNameText(String value) {
    return this.widget._presenter.validateName(value);
  }
  String _validateLastNameText(String value) {
    return this.widget._presenter.validateLastName(value);
  }
  String _validateEmailText(String value) {
    return this.widget._presenter.validateEmailText(value);
  }
  String _validatePasswordText(String value) {
    return this.widget._presenter.validatePassword(value);
  }

  _newAccount() {
    this.widget._presenter.newAccount();
  }


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
    print("dispose");
  }

  @override
  hideLoading() {
    if (_progressDialog.isShowing()) {
      _progressDialog.hide();
    }
  }

  @override
  showLoading() {
    if (!_progressDialog.isShowing()) {
      _progressDialog.show();
    }
  }

  @override
  showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: MyColor.accentColor(),
        textColor: MyColor.primaryColor(),
        fontSize: 16.0
    );
  }

  @override
  Widget build(BuildContext context) {
    _buildProgressDialog(context);
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          ListTile(
              title: _textFormField(nameController, S.of(context).name, _validateNameText)
          ),
          ListTile(
              title: _textFormField(lastnameController, S.of(context).lastname, _validateLastNameText)
          ),
          ListTile(
              title: _textFormField(emailController, S.of(context).email, _validateEmailText)
          ),
          ListTile(
              title: _textFormField(passwordController, S.of(context).password, _validatePasswordText, obscure: true)
          ),
          ListTile(
              title: _saveAccount(context)
          ),
        ],
      ),
    );
  }

  _saveAccount(BuildContext context) {
    return FlatButton(
      child: Text(S.of(context).save, style: TextStyle(color: Colors.white),),
      color: MyColor.accentColor(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      onPressed: (){
        if (_formKey.currentState.validate()) {
          _newAccount();
        }
      },
    );
  }

  _textFormField(TextEditingController controller, String label, Function validator, {bool obscure = false}) {
    return TextFormField(
        controller: controller,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.name,
        obscureText: obscure,
        style: TextStyle( color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
          errorStyle: TextStyle(color: MyColor.accentColor()),
          contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
          enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.white)),
          errorBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: MyColor.accentColor())),
          focusedErrorBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.white)),
        ),
        validator: validator);
  }
}