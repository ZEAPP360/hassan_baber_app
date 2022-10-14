import 'dart:async';
import 'package:barberapp/screens/BHLoginScreen.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:barberapp/screens/BHWalkThroughScreen.dart';
import 'package:barberapp/main.dart';

import 'BHAppointmentScreen.dart';
import 'BHCustomerDashedBoardScreen.dart';

class BHSplashScreen extends StatefulWidget {
  static String tag = '/BHSplashScreen';

  @override
  BHSplashScreenState createState() => BHSplashScreenState();
}

class BHSplashScreenState extends State<BHSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    Timer(Duration(seconds: 5), () {
      finish(context);
      BHWalkThroughScreen().launch(context);
      // BHLoginScreen().launch(context);
      // BHDashedBoardScreen().launch(context);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.oragne,
      body: Container(
        constraints: BoxConstraints(
          maxHeight: double.infinity,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff6F4E37),
            Color.fromARGB(255, 235, 170, 124),
          ],
        )),
        child: Center(
          child: SvgPicture.asset(
            'images/bh_logo.svg',
            height: 250,
            width: 250,
            color:
                appStore.isDarkModeOn ? white : Colors.black.withOpacity(0.7),
          ),
        ),
      ),
    );
  }
}
