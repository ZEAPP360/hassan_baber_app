import 'dart:convert';

import 'package:barberapp/screens/BHAddAppointmnetScreen.dart';
import 'package:barberapp/screens/BHCustomerDashedBoardScreen.dart';
import 'package:barberapp/screens/BHVerificationScreen.dart';
import 'package:barberapp/screens/BhCreatePage.dart';
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
class BHRegistrationScreen extends StatefulWidget {
  static String tag = '/NewRegistrationScreen';

  @override
  NewRegistrationScreenState createState() => NewRegistrationScreenState();
}

class NewRegistrationScreenState extends State<BHRegistrationScreen> {
  bool _showPassword = false;
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  TextEditingController ConfirmPas = TextEditingController();
   TextEditingController ContactNo = TextEditingController();
  TextEditingController fullNameCont = TextEditingController();
  TextEditingController dateOfBirthCont = TextEditingController();
  TextEditingController addressCont = TextEditingController();
     TextEditingController bussinessemailCont = TextEditingController();
  TextEditingController bussinespasswordCont = TextEditingController();
  TextEditingController bussinessConfirmPas = TextEditingController();
   TextEditingController bussinessContactNo = TextEditingController();
  TextEditingController bussinessfullNameCont = TextEditingController();
  TextEditingController bussinessdateOfBirthCont = TextEditingController();
  TextEditingController bussinessaddressCont = TextEditingController();
  var register = "Customer";

  FocusNode fullNameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode dobFocusNode = FocusNode();
  FocusNode addressFocusNode = FocusNode();
  FocusNode contactNoFocusNode   =  FocusNode();
  FocusNode ConfirmPasNode = FocusNode();

  FocusNode bussinessfullNameFocusNode = FocusNode();
  FocusNode bussinesspasswordFocusNode = FocusNode();
  FocusNode bussinessemailFocusNode = FocusNode();
  FocusNode bussinessdobFocusNode = FocusNode();
  FocusNode bussinessaddressFocusNode = FocusNode();
  FocusNode bussinesscontactNoFocusNode   =  FocusNode();
  FocusNode bussinessConfirmFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    fullNameFocusNode.dispose();
    passwordFocusNode.dispose();
    emailFocusNode.dispose();
    dobFocusNode.dispose();
    addressFocusNode.dispose();
    ConfirmPasNode.dispose();
     bussinessfullNameFocusNode.dispose();
    bussinesspasswordFocusNode.dispose();
    bussinessemailFocusNode.dispose();
    bussinessdobFocusNode.dispose();
    bussinessaddressFocusNode.dispose();
    bussinessConfirmFocusNode.dispose();
    
  }

Future<void> customerregisters() async {

  print(emailCont.text);
  print(passwordCont.text);
   var response = await http.post(
        Uri.parse(
            'https://hostrelic.com/sys/wowonder/api/create-account'),
        body: ({
          "username": fullNameCont.text,
          "password": passwordCont.text,
          "confirm_password": ConfirmPas.text,
          "email": emailCont.text,
          'server_key':server_key
          // 'type': 'get_news_feed'
        }));


        print(json.decode(response.body));
    
        var data = json.decode(response.body)['api_status'];
        print(data);
      //   var err_type = json.decode(response.body)['errors']['error_text'];
      if(data == 200){
        print("ök");
         finish(context);
        //  BHDashedBoardScreen.launch(context);>
        // Navigator.push(context,MaterialPageRoute(builder: (context)=>BHDashedBoardScreen({})));
         
        // show alert
         }
         else if(data == 400){ 
           BHDashedBoardScreen.launch(context);
           
         }
        
      
}

Future<void> bussinessregisters() async {

  print(bussinessfullNameCont.text);
  print(bussinespasswordCont.text);
   var response = await http.post(
        Uri.parse(
            'https://hostrelic.com/sys/wowonder/api/create-account'),
        body: ({
          "username": bussinessfullNameCont.text,
          "password": bussinespasswordCont.text,
          "confirm_password": bussinespasswordCont.text,
          "email": bussinessemailCont.text,
          'server_key':
             server_key,
          // 'type': 'get_news_feed'
        }));


        print(json.decode(response.body));
    
        var data = json.decode(response.body)['api_status'];
        print(data);
      //   var err_type = json.decode(response.body)['errors']['error_text'];
      if(data == 200){
        print("ök");
         finish(context);
        //  BHDashedBoardScreen.launch(context);>
        Navigator.push(context,MaterialPageRoute(builder: (context)=>BHCreatePages()));
         
        // show alert
         }
         else if(data == 400){ 
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
                    Row(
                      children: [
                        Text("Register As :  "),
                        1.width,
                        Radio(
                          value: "Customer",
                          groupValue: register,
                          onChanged: (value) {
                            print(value);

                            setState(() {
                              register = value as String;
                            });
                          },
                        ),
                        Text("Customer"),
                        1.width,
                        Radio(
                          value: "Business",
                          groupValue: register,
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              register = value as String;
                            });
                          },
                        ),
                        Text("Business")
                      ],
                    ),
                    register == "Customer"
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             TextFormField(
                      controller: fullNameCont,
                      focusNode: fullNameFocusNode,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(passwordFocusNode);
                      },
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: BHAppDividerColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: BHColorPrimary)),
                        labelText: "Full Name",
                        labelStyle: secondaryTextStyle(),
                      ),
                    ),
                    TextFormField(
                      controller: passwordCont,
                      focusNode: passwordFocusNode,
                      obscureText: !_showPassword,
                      keyboardType: TextInputType.text,
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: secondaryTextStyle(),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          child: Icon(
                              _showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: BHColorPrimary,
                              size: 20),
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: BHAppDividerColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: BHColorPrimary)),
                      ),
                    ),
                    TextFormField(
                      controller: ConfirmPas,
                      focusNode: ConfirmPasNode,
                      obscureText: !_showPassword,
                      keyboardType: TextInputType.text,
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                        labelStyle: secondaryTextStyle(),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          child: Icon(
                              _showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: BHColorPrimary,
                              size: 20),
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: BHAppDividerColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: BHColorPrimary)),
                      ),
                    ),
                    TextFormField(
                      controller: emailCont,
                      focusNode: emailFocusNode,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(dobFocusNode);
                      },
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: BHAppDividerColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: BHColorPrimary)),
                        labelText: "Email",
                        labelStyle: secondaryTextStyle(),
                      ),
                    ),
                    TextFormField(
                      controller: dateOfBirthCont,
                      keyboardType: TextInputType.datetime,
                      focusNode: dobFocusNode,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(addressFocusNode);
                      },
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: BHAppDividerColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: BHColorPrimary)),
                        labelText: "Date of Birth",
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
                      controller: addressCont,
                      focusNode: addressFocusNode,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.multiline,
                      maxLines: 2,
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: BHAppDividerColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: BHColorPrimary)),
                        labelText: "Your Address",
                        suffixIcon: Icon(Icons.location_on,
                            color: BHColorPrimary, size: 18),
                        labelStyle: secondaryTextStyle(),
                      ),
                    ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                      controller: bussinessfullNameCont,
                       focusNode: bussinessfullNameFocusNode,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(bussinesspasswordFocusNode);
                      },
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: BHAppDividerColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: BHColorPrimary)),
                        labelText: "Shop Name",
                        labelStyle: secondaryTextStyle(),
                      ),
                    ),
                    TextFormField(
                     controller: bussinessemailCont,
                       focusNode: bussinessemailFocusNode,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(passwordFocusNode);
                      },
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: BHAppDividerColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: BHColorPrimary)),
                        labelText: "Email",
                        labelStyle: secondaryTextStyle(),
                      ),
                    ),
                    TextFormField(
                       controller: bussinessContactNo,
                       focusNode: bussinesscontactNoFocusNode,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(passwordFocusNode);
                      },
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: BHAppDividerColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: BHColorPrimary)),
                        labelText: "Contact No",
                        labelStyle: secondaryTextStyle(),
                      ),
                    ),
                       TextFormField(
                      controller: bussinespasswordCont,
                      focusNode: bussinesspasswordFocusNode,
                      obscureText: !_showPassword,
                      keyboardType: TextInputType.text,
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: secondaryTextStyle(),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          child: Icon(
                              _showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: BHColorPrimary,
                              size: 20),
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: BHAppDividerColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: BHColorPrimary)),
                      ),
                    ),
                    TextFormField(
                      controller: bussinessConfirmPas,
                      focusNode: bussinessConfirmFocusNode,
                      obscureText: !_showPassword,
                      keyboardType: TextInputType.text,
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                        labelStyle: secondaryTextStyle(),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          child: Icon(
                              _showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: BHColorPrimary,
                              size: 20),
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: BHAppDividerColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: BHColorPrimary)),
                      ),
                    ),
                    Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ElevatedButton(
                               style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          primary: BHColorPrimary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                              onPressed: (){},
                              child: const Text(
                                "Upload Inside Shop Pic",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                           Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ElevatedButton(
                               style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          primary: BHColorPrimary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                              onPressed: (){},
                              child: const Text(
                                "Upload Outside Shop Pic",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          TextFormField(
                      // controller: fullNameCont,
                      // focusNode: fullNameFocusNode,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(passwordFocusNode);
                      },
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: BHAppDividerColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: BHColorPrimary)),
                        labelText: "License Number",
                        labelStyle: secondaryTextStyle(),
                      ),
                    ),
                           Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ElevatedButton(
                               style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          primary: BHColorPrimary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                              onPressed: (){},
                              child: const Text(
                                "Upload License Copy Pic",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          
                          ],
                        ),

                    
                    24.height,
                    
                    8.height,
                 register == "Customer" ?     Container(
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
                          "CUSTOMER REGSISTER",
                          style: TextStyle(
                              color: whiteColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ):
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
                        bussinessregisters();
                         //registerUsers();
                        },
                        child: Text(
                          "BUSSINESS REGSISTER",
                          style: TextStyle(
                              color: whiteColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                    ,
                    24.height,
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () {
                            // bussinessregisters() ;
                          finish(context);
                        },
                        child: Text.rich(
                          TextSpan(
                            text: BHTxtAccount,
                            style: TextStyle(color: BHAppTextColorSecondary),
                            children: <TextSpan>[
                              TextSpan(
                                  text: BHBtnSignIn,
                                  style: TextStyle(color: BHColorPrimary))
                            ],
                          ),
                        ),
                      ),
                    ),
                    8.height,
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

  Future<void> logins() async {
    if (passwordCont.text.isNotEmpty && emailCont.text.isNotEmpty) {
       var response = await http.post(Uri.parse("https://hostrelic.com/sys/wowonder/api/create-account'"),
         
          body: ({
            'name': fullNameCont.text,
            'email':  emailCont.text,
            'password': passwordCont.text,
            'server_key': '0173e2128db8a97b9e375dfb3c731de728fd5611-ec0acfc09ee7c3e289c855741382d18f-85844002'
          }));
          print(response.statusCode);
      if (response.statusCode == 200) {
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> BHDashedBoardScreen()
        BHDashedBoardScreen({}).launch(context);
        ;
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Black Field Not Allowed")));
    }
  }


void registerUsers() async{
var url = "https://hostrelic.com/sys/wowonder/api/create-account";
var data ={

  "username": fullNameCont.text,
  "email": emailCont.text,
  "password": passwordCont.text,
  'server_key': '0173e2128db8a97b9e375dfb3c731de728fd5611-ec0acfc09ee7c3e289c855741382d18f-85844002'
};

var body =  json.encode(data);
var urlParse= Uri.parse(url);
http.Response responses = await http.post(
  urlParse,
  body: body,
  headers: {
    "Content-Type": "application/json"
  
  }

);
var datas =  jsonDecode(responses.body);
print(datas);
// Response response = await http.post(
//   urlParse,
//   body: body,
//   headers: {
//     "Content-Type": "application/json"
//   }
// );

// var data = jsonDecode(response.body);

}


}
