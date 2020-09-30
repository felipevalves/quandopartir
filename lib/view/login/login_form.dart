import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quandopartir/util/my_color.dart';
import 'package:quandopartir/view/login/login_view.dart';
import 'package:progress_dialog/progress_dialog.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State implements LoginView {
  //identifies the Form and allows form's validation
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  ProgressDialog _progressDialog;


  void _buildProgressDialog(BuildContext context) {
    _progressDialog = ProgressDialog(context);
    _progressDialog.style(message: "Wait...", backgroundColor: MyColor.accentColor());
  }

  String _validateEmailText(String value) {
    //chamar o presenter para validar
    if (value.isEmpty)
      return "E-mail é obrigatório";

    return null;
  }

  void _login() {
    //this.widget.presenter.loginServer(emailController.text, passwordController.text);
    // thread sleep 3 para teste
    showLoading();
    print("Login 1");
    Future.delayed(Duration(seconds: 3), () {
      hideLoading();
      return "ok";
    });
    print("Login 2");

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
  openHomePage() {
//vai ser chamado pelo presenter depois de validar o login
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    _buildProgressDialog(context);
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          ListTile(
            title: TextFormField(
                controller: emailController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle( color: Colors.white),
                decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(color: Colors.white),
                  errorStyle: TextStyle(color: MyColor.accentColor()),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                  enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.white)),
                  errorBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: MyColor.accentColor())),
                  focusedErrorBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.white)),
                ),
                validator: _validateEmailText),
          ),
          ListTile(
            title: TextFormField(
              controller: passwordController,
              textInputAction: TextInputAction.go,
              obscureText: true,
              style: TextStyle( color: Colors.white),
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(color: Colors.white),
                errorStyle: TextStyle(color: MyColor.accentColor()),
//                filled: true,
//                fillColor: MyColor.color(MyColor.inputLogin),
                contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.white)),
                errorBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: MyColor.accentColor())),
                focusedErrorBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.white)),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "Senha é obrigatório";
                }
                return null;
              },
            ),
          ),
          ListTile(
              title: _loginButton()
          ),
        ],
      ),
    );
  }

  _loginButton() {
    return FlatButton(
      child: Text('Login', style: TextStyle(color: Colors.white),),
      color: MyColor.accentColor(),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
      ),
      onPressed: (){
        if (_formKey.currentState.validate()) {
          _login();
        }
      },
    );
  }
}