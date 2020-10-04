import 'package:flutter/material.dart';
import 'package:quandopartir/generated/i18n.dart';
import 'package:quandopartir/presenter/account/account_presenter.dart';
import 'package:quandopartir/util/my_color.dart';
import 'package:quandopartir/view/account/account_form.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColor.primaryColor(),
        body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container (
                  height: MediaQuery.of(context).size.height / 2.5,
                  decoration: BoxDecoration(
                      image: DecorationImage (
                          image: AssetImage('images/logo_quando_partir.png')
                      )
                  ),
                ),
                Container (
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Text(S.of(context).new_account, style: TextStyle(color: Colors.white),),
                ),
                Container (
                  child: AccountForm(AccountPresenterImpl(context)),
                ),
                Container (
                    child: FlatButton(
                      child: Text(S.of(context).go_back, style: TextStyle(color: Colors.white, fontSize: 10),),
                      onPressed: (){Navigator.pop(context);},
                    )
                )
              ],
            )
        )
    );
  }

}
