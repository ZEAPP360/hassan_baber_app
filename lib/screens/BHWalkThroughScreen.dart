import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:barberapp/utils/BHColors.dart';
import 'package:barberapp/utils/BHConstants.dart';
import 'package:barberapp/utils/BHImages.dart';
import 'package:barberapp/main.dart';
import 'package:barberapp/utils/BHWidgets.dart';

import 'BHLoginScreen.dart';

class BHWalkThroughScreen extends StatefulWidget {
  static String tag = '/WalkThroughScreen';

  @override
  BHWalkThroughScreenState createState() => BHWalkThroughScreenState();
}

class BHWalkThroughScreenState extends State<BHWalkThroughScreen> {
  PageController _pageController = PageController();
  int currentPage = 0;
  static const _kDuration = const Duration(seconds: 1);
  static const _kCurve = Curves.ease;

  @override
  void initState() {
    super.initState();
    changeStatusColor(Colors.transparent);
  }

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(appStore.isDarkModeOn ? scaffoldDarkColor : white);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (i) {
              currentPage = i;
              setState(() {});
            },
            children: [
              Column(
                children: <Widget>[
                  commonCacheImageWidget("https://m.media-amazon.com/images/I/61DJ1pgm1VL._AC_SY780_.jpg", context.height() * 0.7, width: context.width(), fit: BoxFit.cover),
                  16.height,
                  Text(
                    BHWalkThroughTitle1,
                    textAlign: TextAlign.center,
                    style: boldTextStyle(color: appStore.isDarkModeOn ? white : BHAppTextColorPrimary, size: 18),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      BHWalkThroughSubTitle1,
                      textAlign: TextAlign.center,
                      style: secondaryTextStyle(color: BHAppTextColorSecondary),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  commonCacheImageWidget("https://st2.depositphotos.com/1001951/7784/i/950/depositphotos_77841548-stock-photo-clients-chair-in-barber-shop.jpg", context.height() * 0.7, width: context.width(), fit: BoxFit.cover),
                  16.height,
                  Text(
                    BHWalkThroughTitle2,
                    textAlign: TextAlign.center,
                    style: boldTextStyle(color: appStore.isDarkModeOn ? white : BHAppTextColorPrimary, size: 18),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      BHWalkThroughSubTitle2,
                      textAlign: TextAlign.center,
                      style: secondaryTextStyle(color: BHAppTextColorSecondary),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  commonCacheImageWidget("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFHWKgaf8_3wtC8X5CZdlTI5eoPHDQJJCY94d2yOXa2qcptQ_AKxLG3_X560bD4k6mIfY&usqp=CAU", context.height() * 0.7, width: context.width(), fit: BoxFit.cover),
                  16.height,
                  Text(
                    BHWalkThroughTitle3,
                    textAlign: TextAlign.center,
                    style: boldTextStyle(color: appStore.isDarkModeOn ? white : BHAppTextColorPrimary, size: 18),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      BHWalkThroughSubTitle3,
                      textAlign: TextAlign.center,
                      style: secondaryTextStyle(color: BHAppTextColorSecondary),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 90,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: DotsIndicator(
                dotsCount: 3,
                position: currentPage.toDouble(),
                decorator: DotsDecorator(
                  color: BHGreyColor.withOpacity(0.5),
                  activeColor: BHColorPrimary,
                  size: Size.square(9.0),
                  activeSize: Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Text('Skip', style: TextStyle(color: BHAppTextColorSecondary)),
                  onPressed: () {
                    BHLoginScreen().launch(context);
                  },
                ),
                TextButton(
                  child: Text(BHBtnNext, style: TextStyle(color: BHAppTextColorSecondary)),
                  onPressed: () {
                    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
                  },
                )
              ],
            ).visible(
              currentPage != 2,
              defaultWidget: Container(
                margin: EdgeInsets.only(),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 270,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: BHColorPrimary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {
                        BHLoginScreen().launch(context);
                      },
                      child: Text(BHBtnGetStarted, style: TextStyle(fontWeight: FontWeight.bold, color: whiteColor)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
