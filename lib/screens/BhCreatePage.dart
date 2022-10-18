import 'dart:convert';
import 'package:barberapp/model/g.model.dart';
import 'package:barberapp/screens/BHAddAppointmnetScreen.dart';
import 'package:barberapp/screens/BHAppointmentScreen.dart';
import 'package:barberapp/screens/BHCustomerDashedBoardScreen.dart';

import 'package:barberapp/screens/BHVerificationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:barberapp/utils/BHColors.dart';
import 'package:barberapp/utils/BHConstants.dart';
import 'package:barberapp/utils/BHImages.dart';
import 'package:barberapp/utils/BHWidgets.dart';
import 'package:http/http.dart' as http;

class BHCreatePages extends StatefulWidget {
  static String tag = '/NewRegistrationScreen';

  @override
  NewRegistrationScreenState createState() => NewRegistrationScreenState();
}

class NewRegistrationScreenState extends State<BHCreatePages> {
  bool _showPassword = false;
  TextEditingController pagename = TextEditingController();
  TextEditingController pagetittle = TextEditingController();
  TextEditingController pagecategory = TextEditingController();
  TextEditingController pagedescription = TextEditingController();
  TextEditingController pagesubcategory = TextEditingController();
  TextEditingController fid = TextEditingController();

  var register = "Customer";

  FocusNode pagenameFocusNode = FocusNode();
  FocusNode pagetittleFocusNode = FocusNode();
  FocusNode pagecategoryFocusNode = FocusNode();
  FocusNode pagedescriptionFocusNode = FocusNode();
  FocusNode pagesubcategoryFocusNode = FocusNode();
  FocusNode fidFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    pagenameFocusNode.dispose();
    pagetittleFocusNode.dispose();
    pagecategoryFocusNode.dispose();
    pagedescriptionFocusNode.dispose();
    pagesubcategoryFocusNode.dispose();
    fidFocusNode.dispose();
  }

  Future<void> customerregisters() async {
    print(pagename.text);

    print(pagetittle.text);
    var response = await http.post(
        Uri.parse(
            'https://hostrelic.com/sys/wowonder/api/create-page?access_token=d7dd3e850f2b663061c7294aa6b78484c2318bb3a5ada60bb0f7791867a9f58494604705784982481becf26e9f32353e30870060538746e7'),
        body: ({
          "page_name": pagename.text,
          "page_title": pagetittle.text,
          "page_category": pagecategory.text,
          "page_description": pagedescription.text,
          "page_sub_category": pagecategory.text,
          " fid_1": fid.text,

          'server_key':server_key
// 'type': 'get_news_feed'
        }));

    print(json.decode(response.body));

    var data = json.decode(response.body)['api_status'];
    print(data);
// var err_type = json.decode(response.body)['errors']['error_text'];
    if (data == 200) {
      print("ök");
      finish(context);
      BHDashedBoardScreen.launch(context);
      // Navigator.push(context,
          // MaterialPageRoute(builder: (context) => B()));

// show alert
    } else if (data == 400) {
      BHDashedBoardScreen.launch(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(BHColorPrimary);

    return SafeArea(
      child: Scaffold(
        backgroundColor: BHColorPrimary,
        body: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 24),
              child: Align(
                alignment: Alignment.topCenter,
                child: SvgPicture.asset(BHAppLogo,
                    color: white.withOpacity(0.8), height: 150, width: 150),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 200),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15)),
                color: context.cardColor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: pagename,
                          focusNode: pagenameFocusNode,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(pagetittleFocusNode);
                          },
                          style: primaryTextStyle(),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: BHAppDividerColor)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: BHColorPrimary)),
                            labelText: "Page Name",
                            labelStyle: secondaryTextStyle(),
                          ),
                        ),
                        TextFormField(
                          controller: pagetittle,
                          focusNode: pagetittleFocusNode,
// obscureText: !_showPassword,
                          keyboardType: TextInputType.text,
                          style: primaryTextStyle(),
                          decoration: InputDecoration(
                            labelText: "Page Title",
                            labelStyle: secondaryTextStyle(),
                            suffixIcon: Icon(Icons.location_on,
                                color: BHColorPrimary, size: 18),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: BHAppDividerColor)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: BHColorPrimary)),
                          ),
                        ),
                        TextFormField(
                          controller: pagecategory,
                          focusNode: pagecategoryFocusNode,
// obscureText: !_showPassword,
                          keyboardType: TextInputType.text,
                          style: primaryTextStyle(),
                          decoration: InputDecoration(
                            labelText: "Page Category",
                            labelStyle: secondaryTextStyle(),
                            suffixIcon: Icon(Icons.location_on,
                                color: BHColorPrimary, size: 18),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: BHAppDividerColor)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: BHColorPrimary)),
                          ),
                        ),
                        TextFormField(
                          controller: pagedescription,
                          keyboardType: TextInputType.datetime,
                          focusNode: pagedescriptionFocusNode,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(pagesubcategoryFocusNode);
                          },
                          style: primaryTextStyle(),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: BHAppDividerColor)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: BHColorPrimary)),
                            labelText: "Page description",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2014, 8),
                                    lastDate: DateTime(2101));
                              },
                              child: Icon(Icons.calendar_today,
                                  color: BHColorPrimary, size: 16),
                            ),
                            labelStyle: secondaryTextStyle(),
                          ),
                        ),
                        TextFormField(
                          controller: pagesubcategory,
                          focusNode: pagesubcategoryFocusNode,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.multiline,
                          maxLines: 2,
                          style: primaryTextStyle(),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: BHAppDividerColor)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: BHColorPrimary)),
                            labelText: "Page Sub Category",
                            suffixIcon: Icon(Icons.location_on,
                                color: BHColorPrimary, size: 18),
                            labelStyle: secondaryTextStyle(),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          primary: BHColorPrimary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        onPressed: () {
                          print("Ok");
                          customerregisters();
//registerUsers();
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              color: whiteColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BackButton(color: Colors.white),
          ],
        ),
      ),
    );
  }

// Future<void> logins() async {
// if (passwordCont.text.isNotEmpty && emailCont.text.isNotEmpty) {
// var response = await http.post(Uri.parse("https://hostrelic.com/sys/wowonder/api/create-account'"),

// body: ({
// 'name': fullNameCont.text,
// 'email': emailCont.text,
// 'password': passwordCont.text,
// 'server_key': '0173e2128db8a97b9e375dfb3c731de728fd5611-ec0acfc09ee7c3e289c855741382d18f-85844002'
// }));
// print(response.statusCode);
// if (response.statusCode == 200) {
// // Navigator.push(context, MaterialPageRoute(builder: (context)=> BHDashedBoardScreen()
// BHDashedBoardScreen().launch(context);
// ;
// } else {
// ScaffoldMessenger.of(context)
// .showSnackBar(SnackBar(content: Text("Invalid")));
// }
// } else {
// ScaffoldMessenger.of(context)
// .showSnackBar(SnackBar(content: Text("Black Field Not Allowed")));
// }
// }

// void registerUsers() async{
// var url = "https://hostrelic.com/sys/wowonder/api/create-account";
// var data ={

// "username": fullNameCont.text,
// "email": emailCont.text,
// "password": passwordCont.text,
// 'server_key': '0173e2128db8a97b9e375dfb3c731de728fd5611-ec0acfc09ee7c3e289c855741382d18f-85844002'
// };

// var body = json.encode(data);
// var urlParse= Uri.parse(url);
// http.Response responses = await http.post(
// urlParse,
// body: body,
// headers: {
// "Content-Type": "application/json"

// }

// );
// var datas = jsonDecode(responses.body);
// print(datas);
// // Response response = await http.post(
// // urlParse,
// // body: body,
// // headers: {
// // "Content-Type": "application/json"
// // }
// // );

// // var data = jsonDecode(response.body);

// }

}
