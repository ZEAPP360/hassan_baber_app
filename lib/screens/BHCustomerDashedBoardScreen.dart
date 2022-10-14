import 'dart:convert';

import 'package:barberapp/screens/BHAddAppointmnetScreen.dart';
import 'package:flutter/material.dart';
import 'package:barberapp/main.dart';
import 'package:barberapp/utils/BHColors.dart';
import 'package:barberapp/utils/BHWidgets.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:http/http.dart' as http;
import '../controllers/load_controller.dart';
import 'BHAppointmentScreen.dart';
import 'BHDiscoverScreen.dart';
import 'BHMessagesScreen.dart';
import 'BHNotifyScreen.dart';
import 'BHProfileScreen.dart';

class BHDashedBoardScreen extends StatefulWidget {
  // static String tag = '/DashedBoardScreen';

  Map UserData1;
  BHDashedBoardScreen(this.UserData1);
  


  @override
  BHDashedBoardScreenState createState() => BHDashedBoardScreenState(UserData1);

  static void launch(BuildContext context) {}
}

class BHDashedBoardScreenState extends State<BHDashedBoardScreen> {
  
  Map UserData1;
  BHDashedBoardScreenState(this.UserData1);

  int _selectedIndex = 0;
  
  LoginController _consentController = Get.find();
 

  @override
  void initState() {
    super.initState();
    print(UserData1);
    changeStatusColor(appStore.isDarkModeOn ? scaffoldDarkColor : white);
   getData();
  }


   var _pages = <Widget>[
    BHDiscoverScreen(),
    BHNotifyScreen(),
      BhAddAppointmentScreen(),
    // BHAppointmentScreen(),
    BHMessagesScreen(),
    BHProfileScreen(),
  ];
 void getData() async {
    _consentController.loadData();
  }

  _bottomTab() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(color: BHColorPrimary),
      selectedItemColor: BHColorPrimary,
      unselectedLabelStyle: TextStyle(color: BHGreyColor),
      unselectedItemColor: BHGreyColor,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Market'),
        BottomNavigationBarItem(icon: Icon(Icons.date_range), label: 'Add Appointment'),
        // BottomNavigationBarItem(icon: Icon(Icons.select_all_outlined), label: 'All Appointment'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }

  void _onItemTapped(int index) {
    // finish(context);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold( 
        bottomNavigationBar: _bottomTab(),
        body: Center(child: _pages.elementAt(_selectedIndex)),
      ),
    );
  }
Future<void> logins() async {
    var response = await http.post(
Uri.parse('https://hostrelic.com/sys/wowonder/api/posts?access_token=d5f72a349b37d297ce9cf6ad3ef8886433d974fb2d5aada1722a3cba1fcc7f7a7141fa0684650167df1a336b7e0b0cb186de6e66800c43a9'),
body: ({
// "username": 'adminia',
// "password": 'Admin123!@#',
'server_key':
'0173e2128db8a97b9e375dfb3c731de728fd5611-ec0acfc09ee7c3e289c855741382d18f-85844002',
'type':'get_news_feed'
}));


print(json.decode(response.body)['data']);
      
}  

}
