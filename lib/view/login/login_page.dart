import 'package:flutter/material.dart';
import 'package:quandopartir/util/my_color.dart';
import 'package:quandopartir/view/login/login_form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColor.primaryColor(),
        body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container (
                  height: MediaQuery.of(context).size.height / 1.8,
                  decoration: BoxDecoration(
                      image: DecorationImage (
                          image: AssetImage('images/logo_quando_partir.png')
                      )
                  ),
                ),
                Container (
                  child: LoginForm(),
                ),
              ],
            )
        )
    );
  }

}
