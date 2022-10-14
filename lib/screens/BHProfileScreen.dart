import 'dart:convert';

import 'package:barberapp/screens/BHLoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:barberapp/main.dart';
import 'package:localstorage/localstorage.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:barberapp/utils/BHColors.dart';
import 'package:barberapp/utils/BHConstants.dart';
import 'package:barberapp/utils/BHImages.dart';

import 'BHAccountInformationScreen.dart';
import 'BHInviteFriendsScreen.dart';
import 'BHNotificationScreen.dart';
import 'BHPaymentScreen.dart';
import 'package:http/http.dart' as http;

class BHProfileScreen extends StatefulWidget {
  static String tag = '/ProfileScreen';

  @override
  BHProfileScreenState createState() => BHProfileScreenState();
}

class BHProfileScreenState extends State<BHProfileScreen> {
  final LocalStorage storage = new LocalStorage('localstorage_app');

  Future<void> _showDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          contentTextStyle: TextStyle(color: BHAppTextColorSecondary),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4))),
          actionsPadding: EdgeInsets.symmetric(horizontal: 16.0),
          title: Text(BHTxtLogoutDialog, style: boldTextStyle()),
          content: Text(BHTxtLogoutMsg, style: secondaryTextStyle()),
          actions: <Widget>[
            TextButton(
              child: Text(BHBtnYes,
                  style: TextStyle(color: Colors.blue, fontSize: 14)),
              onPressed: () {
                finish(context);
                BHLoginScreen().launch(context);
              },
            ),
            TextButton(
              child: Text(BHBtnNo,
                  style: TextStyle(color: Colors.blue, fontSize: 14)),
              onPressed: () {
                BHProfileScreen().launch(context);
              },
            ),
          ],
        );
      },
    );
  }

  void initState() {
    super.initState();
    userdata();
  }

  var user_get_data =[];

  userdata() async {
    var access_token = storage.getItem("access_token");
    var user_id = storage.getItem("User_id");

    var response1 = await http.post(
        Uri.parse(
            'https://hostrelic.com/sys/wowonder/api/get-user-data?access_token=${access_token}'),
        body: ({
          'server_key': server_key,
          'fetch': 'user_data,followers,following',
          'user_id': user_id
        }));

    var userdata = json.decode(response1.body)['user_data'];
    var apistatus1 = json.decode(response1.body)['api_status'];

    user_get_data.add(userdata);
    setState(() {
      
    });

    print(userdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        padding: EdgeInsets.all(16.0),
        height: context.height(),
        child: SingleChildScrollView(
          child:
          user_get_data.length>0? 
           Column(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                        backgroundImage: Image.network(user_get_data[0]["avatar"])
                            .image,
                        radius: 50),
                  ),
                  8.height,
                  Text(user_get_data[0]["username"].toString(), style: boldTextStyle()),
                  8.height,
                  Text(user_get_data[0]["email"].toString(), style: secondaryTextStyle()),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: context.cardColor,
                  boxShadow: [
                    BoxShadow(
                        color: BHGreyColor.withOpacity(0.3),
                        offset: Offset(0.0, 1.0),
                        blurRadius: 2.0),
                  ],
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'images/ic_theme.png',
                              height: 20,
                              width: 20,
                              color: BHColorPrimary,
                            ),
                            12.width,
                            Text('DarkMode', style: secondaryTextStyle()),
                          ],
                        ),
                        Switch(
                          value: appStore.isDarkModeOn,
                          activeColor: appColorPrimary,
                          onChanged: (s) {
                            appStore.toggleDarkMode(value: s);
                          },
                        )
                      ],
                    ).onTap(() {
                      appStore.toggleDarkMode();
                    }),
                    4.height,
                    Row(
                      children: [
                        Image.asset(BHPaymentIcon,
                            height: 23, width: 23, color: BHColorPrimary),
                        8.width,
                        Text(BHTxtPaymentMethods, style: secondaryTextStyle())
                            .expand(),
                      ],
                    ).onTap(() {
                      BHPaymentScreen().launch(context);
                    }),
                    16.height,
                    Row(
                      children: [
                        Image.asset(BHInformationIcon,
                            height: 23, width: 23, color: BHColorPrimary),
                        8.width,
                        Text(BHTxtAccountInformation,
                                style: secondaryTextStyle())
                            .expand(),
                      ],
                    ).onTap(() {
                      BHAccountInformationScreen().launch(context);
                    }),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: context.cardColor,
                  boxShadow: [
                    BoxShadow(
                        color: BHGreyColor.withOpacity(0.3),
                        offset: Offset(0.0, 1.0),
                        blurRadius: 2.0),
                  ],
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(BHNotificationIcon,
                            height: 23, width: 23, color: BHColorPrimary),
                        8.width,
                        Text(BHTxtNotification, style: secondaryTextStyle())
                            .expand(),
                      ],
                    ).onTap(() {
                      BHNotificationScreen().launch(context);
                    }),
                    16.height,
                    Row(
                      children: [
                        Image.asset(BHInviteFriendsIcon,
                            height: 23, width: 23, color: BHColorPrimary),
                        8.width,
                        Text(BHTxtInviteFriends, style: secondaryTextStyle())
                            .expand(),
                      ],
                    ).onTap(() {
                      BHInviteFriendsScreen().launch(context);
                    }),
                    16.height,
                    Row(
                      children: [
                        Image.asset(BHSettingIcon,
                            height: 23, width: 23, color: BHColorPrimary),
                        8.width,
                        Text(BHTxtSetting, style: secondaryTextStyle())
                            .expand(),
                      ],
                    ).onTap(() {}),
                    16.height,
                    Row(
                      children: [
                        Image.asset(BHTerms_and_ServicesIcon,
                            height: 23, width: 23, color: BHColorPrimary),
                        8.width,
                        Text(BHTxtTermsOfServices, style: secondaryTextStyle())
                            .expand(),
                      ],
                    ).onTap(() {}),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16, bottom: 16),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: context.cardColor,
                  boxShadow: [
                    BoxShadow(
                        color: BHGreyColor.withOpacity(0.3),
                        offset: Offset(0.0, 1.0),
                        blurRadius: 2.0),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset(BHLogoutIcon,
                        height: 23, width: 23, color: BHColorPrimary),
                    8.width,
                    Text(BHTxtLogout, style: secondaryTextStyle()).expand(),
                  ],
                ).onTap(
                  () {
                    _showDialog();
                  },
                ),
              ),
            ],
          ):
          Container(
            margin: EdgeInsets.all(150),
            child: Center(
            
                child:
                Transform.scale(
  scale: 2,
  child: CircularProgressIndicator(
    color: Colors.orange,
  ),
)
                
              ),
          ),
          )
        ),
      
    );
  }
}
