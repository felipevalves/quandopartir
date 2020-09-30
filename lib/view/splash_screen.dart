
import 'package:flutter/material.dart';
import 'package:quandopartir/util/my_color.dart';

import 'start_page.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        FutureBuilder(
          future: getPage(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data;
            }
            else {
              return Container(
                height: double.infinity,
                decoration: BoxDecoration(
                    color: MyColor.primaryColor()
                ),
                child: Container (
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Image.asset('images/logo_quando_partir.png')
                ),
              );
            }
          },
        )
      ],
    );
  }

  Future<Widget> getPage(BuildContext context) async {
    await delay();

    return StartPage();
  }

  Future<String> delay() async =>
      await Future.delayed(Duration(seconds: 3), () {
        return "ok";
      });
}
