import 'package:flutter/material.dart';
import 'package:quandopartir/generated/i18n.dart';
import 'package:quandopartir/util/my_color.dart';
import 'package:quandopartir/view/account/account_page.dart';

import 'login/login_page.dart';

class StartPage extends StatelessWidget {
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
                  child: Text(S.of(context).welcome, style: TextStyle(color: Colors.white),),
                ),
                ListTile(
                    title: _facebookButton()),
                ListTile(
                    title: _googleButton()),
                ListTile(
                    title: _quandoPartirButton(context)),
                FlatButton(
                  child: Text(S.of(context).dont_have_account, style: TextStyle(color: Colors.white,  fontSize: 10),),
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => AccountPage()));},
                ),
              ],
            )
        )
    );
  }

  _facebookButton() {
    return FlatButton(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('images/facebook.png'), height: 30.0,),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text('Facebook', style: TextStyle(color: Colors.white),),
          )
        ],
      ),
      color: MyColor.color(MyColor.facebookBlue),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(color: MyColor.color(MyColor.facebookBlue))
      ),
      onPressed: (){print('Facebook Pressed');},
    );
  }

  _googleButton() {
    return FlatButton(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('images/google_logo.png'), height: 25.0,),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text('Google'),
          )
        ],
      ),
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(color: Colors.white)
      ),
      onPressed: (){print('Google Pressed');},
    );
  }

  _quandoPartirButton(BuildContext context) {
    return FlatButton (
      child: Text(S.of(context).login, style: TextStyle(color: Colors.white),),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(color: Colors.white)
      ),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
//        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
    );
  }

}