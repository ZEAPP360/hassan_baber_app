import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:barberapp/model/BHModel.dart';
import 'package:barberapp/utils/BHColors.dart';
import 'package:barberapp/utils/BHConstants.dart';
import 'package:barberapp/utils/BHDataProvider.dart';
import 'package:barberapp/utils/BHWidgets.dart';

import 'BHDetailScreen.dart';
import 'BHNotificationScreen.dart';
import 'BHSpecialListViewAllScreen.dart';
import 'BHSpecialOfferViewAllScreen.dart';

import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class BHDiscoverScreen extends StatefulWidget {
  static String tag = '/DiscoverBottomNavigationBarScreen';

   

  @override
  BHDiscoverScreenState createState() => BHDiscoverScreenState();
}

class BHDiscoverScreenState extends State<BHDiscoverScreen> {


    final LocalStorage storage = new LocalStorage('localstorage_app');


  late List<BHBestSpecialModel> bestSpecialList;
  late List<BHSpecialOfferModel> specialOfferList;
  late List<BHBestSpecialModel> bestSpecialNewList;
  late List<BHSpecialOfferModel> specialOfferNewList;

  var user_array_data ={} ;
  

  @override
  void initState() {
    super.initState();
    callApi();
    getUserData();
    bestSpecialList = getSpecialList();
    specialOfferList = getSpecialOfferList();
    bestSpecialNewList = getSpecialNewList();
    specialOfferNewList = getSpecialOfferNewList();
    // callApi();
  }

  var newsfeed = [];


   getUserData() async {
    var access_token=  storage.getItem("access_token");
    var user_id =  storage.getItem("User_id");
      var response1 = await http.post(
        Uri.parse(
            'https://hostrelic.com/sys/wowonder/api/get-user-data?access_token=${access_token}'),
        body: ({
         
          'server_key':
            server_key,
              'fetch':'user_data,followers,following',
              'user_id':user_id
         
        }));

           var userdata  =  json.decode(response1.body)['user_data'];
           var apistatus1  =  json.decode(response1.body)['api_status'];

           print('data1'+userdata.runtimeType.toString());

           user_array_data.addAll(userdata);

           print(apistatus1);


   }

  callApi() async {
      if (mounted) {
    setState(() {
      
    });
}
    newsfeed = [];
    setState(() {});

    var response = await http.post(
        Uri.parse(
            'https://hostrelic.com/sys/wowonder/api/posts?access_token=d5f72a349b37d297ce9cf6ad3ef8886433d974fb2d5aada1722a3cba1fcc7f7a7141fa0684650167df1a336b7e0b0cb186de6e66800c43a9'),
        body: ({
          'server_key':
              server_key,
          'type': 'get_news_feed'
        }));
    var data = json.decode(response.body)['data'];

    for (var i in data) {
      UserModel2 data = UserModel2(
        i['id'],
        i['post_id'],
        i['user_id'],
        i['recipient_id'],
        i['postText'],
        i['group_id'],
        i['event_id'],
        i['page_event_id'],
        i['PostLink'],
        i['PostLinkTitle'],
        i['postLinkImage'],
        i['postLinkContent'],
        i['postVimeo'],
        i['postDailymotion'],
        i['postFacebook'],
        i['postFile'],
        i['postFileName'],
        i['postFileThumb'],
        i['postYoutube'],
        i['time'],
        i['registered'],
        i['album_name'],
        i['post_url'],
        i['publisher']['username'],
        i['publisher']['email'],
        i['publisher']['first_name'],
        i['publisher']['last_name'],
        i['publisher']['avatar'],
        i['publisher']['cover'],
        i['publisher']['background_image'],
        i['publisher']['address'],
        i['publisher']['about'],
        i['publisher']['gender'],
        i['publisher']['birthday'],
        i['publisher']['language'],
      );

      newsfeed.add(data);
    }
    setState(() {});
    //  set;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(250, 246, 248, 248),
        height: MediaQuery.of(context).size.height,
        constraints: BoxConstraints(
          maxHeight: double.infinity,
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // ElevatedButton(
              //     onPressed: () {
              //       callApi();
              //     },
              //     child: Text("Chk")),
              Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Hi', style: boldTextStyle(size: 18)),
                        8.width,
                    user_array_data.length>0 ?     Text('Welcome In , ${user_array_data["username"].toString()}',
                            style: TextStyle(
                                fontSize: 18,
                                color: BHColorPrimary,
                                fontWeight: FontWeight.bold)): Text('Welcome In ',
                            style: TextStyle(
                                fontSize: 18,
                                color: BHColorPrimary,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    GestureDetector(
                      child: Icon(Icons.notifications,
                          color: BHColorPrimary, size: 22),
                      onTap: () {
                        BHNotificationScreen().launch(context);
                      },
                    )
                  ],
                ),
              ),
              16.height,
              Row(
                children: [
                  Icon(Icons.location_on, size: 16),
                  8.width,
                  Text('10 Keyfield Terrace, St Albans AL1 1QH, UK',
                      style: secondaryTextStyle()),
                ],
              ),
              8.height,
              UserPost(context,newsfeed),
              SizedBox(
                height: 20,
              ),
              ListChange(),
              SizedBox(
                height: 20,
              ),
              // POSTGENERATOR(context),
              SizedBox(
                height: 20,
              ),
              // UserPost(context,newsfeed),
              ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: newsfeed.length,
                  itemBuilder: (context, i) {
                    // print(newsfeed.length);
                    // print(newsfeed[i]);
                    return Column(
                      children: [
                        // Container(child: Text(newsfeed[i].posttext.toString())),
                        // // newsfeed[i].username != null || newsfeed[i].username !="" ?  Container(child: Text(newsfeed[i].username.toString())):
                        // // Text("No user name"),
                        // Container(child: Text(newsfeed[i].user_id)),
                        // newsfeed[i].username != null ||
                        //         newsfeed[i].username != ""
                        //     ? Container(
                        //         child: Text(newsfeed[i].username.toString()))
                        //     : Text("No user name"),
                        // newsfeed[i].postFile != ""
                        //     ? Container(
                        //         child: Image.network(newsfeed[i].postFile),
                        //       )
                        //     : Text(""),
                        // CircleAvatar(
                        //   child: Image.network(newsfeed[i].avatar),
                        // )
                            
                          POSTGENERATOR(
                          newsfeed[i]
                        ),
                      ],
                    );
                  }),
              // ListView.builder(
              //     physics: BouncingScrollPhysics(),
              //     shrinkWrap: true,
              //     itemCount: Listgen.length,
              //     itemBuilder: ((context, index) {
              //       return Column(
              //         children: [
              //           SizedBox(
              //             height: 20,
              //           ),
              //           POSTGENERATOR(
              //             Listgen[index],
              //           ),
              //         ],
              //       );
              //     })),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Container(
              //       padding: EdgeInsets.symmetric(vertical: 16),
              //       child: TextFormField(
              //         autocorrect: true,
              //         decoration: InputDecoration(
              //           contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              //           hintText: 'Find salon specialist',
              //           prefixIcon: Icon(Icons.search, color: BHGreyColor),
              //           hintStyle: TextStyle(color: BHGreyColor),
              //           filled: true,
              //           fillColor: context.cardColor,
              //           enabledBorder: OutlineInputBorder(
              //             borderSide: BorderSide(color: BHAppDividerColor, width: 0.5),
              //             borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //           ),
              //           focusedBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //             borderSide: BorderSide(color: BHAppDividerColor, width: 0.5),
              //           ),
              //         ),
              //       ),
              //     ).expand(),
              //     8.width,
              //     Container(
              //       padding: EdgeInsets.all(10),
              //       margin: EdgeInsets.only(right: 14),
              //       height: 45,
              //       child: Icon(Icons.filter_list, color: Colors.grey),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.all(Radius.circular(10)),
              //         border: Border.all(color: BHAppDividerColor, width: 0.5),
              //       ),
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(BHTxtBestSpecialists, style: boldTextStyle()),
              //     8.height,
              //     Text(BHTxtViewAll, style: boldTextStyle(color: BHColorPrimary)).onTap(
              //       () {
              //         sendTextData(context);
              //       },
              //     ),
              //   ],
              // ),
              // 8.height,
              // Container(
              //   height: 200,
              //   child: ListView.builder(
              //     itemCount: bestSpecialList.length,
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (BuildContext context, int index) {
              //       return GestureDetector(
              //         onTap: () {
              //           BHDetailScreen().launch(context);
              //         },
              //         child: Card(
              //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              //           margin: EdgeInsets.fromLTRB(8, 8, 16, 8),
              //           shadowColor: BHGreyColor.withOpacity(0.3),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             mainAxisSize: MainAxisSize.min,
              //             children: [
              //               ClipRRect(
              //                 borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              //                 child: commonCacheImageWidget(bestSpecialList[index].img, 110, width: 120, fit: BoxFit.cover),
              //               ),
              //               Text(bestSpecialList[index].title!, style: boldTextStyle()).paddingAll(8),
              //               Text(bestSpecialList[index].subTitle!, style: secondaryTextStyle()).paddingSymmetric(horizontal: 8),
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(BHTxtSpecialOffers, style: boldTextStyle()),
              //     Text(BHTxtViewAll, style: boldTextStyle(color: BHColorPrimary)).onTap(
              //       () {
              //         sendTextDataOffer(context);
              //       },
              //     ),
              //   ],
              // ),
              // Container(
              //   height: 200,
              //   child: ListView.builder(
              //     padding: EdgeInsets.symmetric(vertical: 8),
              //     itemCount: specialOfferList.length,
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (BuildContext context, int index) {
              //       return GestureDetector(
              //         onTap: () {
              //           BHDetailScreen().launch(context);
              //         },
              //         child: Card(
              //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              //           margin: EdgeInsets.fromLTRB(0, 8, 16, 8),
              //           shadowColor: BHGreyColor.withOpacity(0.3),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               ClipRRect(
              //                 borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              //                 child: commonCacheImageWidget(specialOfferList[index].img, 100, width: 200, fit: BoxFit.cover),
              //               ),
              //               Text(specialOfferList[index].title!, style: boldTextStyle()).paddingAll(8),
              //               Text(
              //                 specialOfferList[index].subtitle!,
              //                 style: secondaryTextStyle(),
              //               ).paddingOnly(left: 8, right: 8, bottom: 8),
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(BHTxtSalonSpecialLists, style: boldTextStyle()),
              //     Text(BHTxtViewAll, style: boldTextStyle(color: BHColorPrimary)).onTap(
              //       () {
              //         sendTextData(context);
              //       },
              //     ),
              //   ],
              // ),
              // Container(
              //   height: 204,
              //   child: ListView.builder(
              //     padding: EdgeInsets.fromLTRB(0, 8, 16, 8),
              //     itemCount: bestSpecialNewList.length,
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (BuildContext context, int index) {
              //       return GestureDetector(
              //         onTap: () {
              //           BHDetailScreen().launch(context);
              //         },
              //         child: Card(
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(10),
              //           ),
              //           margin: EdgeInsets.fromLTRB(0, 8, 16, 8),
              //           shadowColor: BHGreyColor.withOpacity(0.3),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               ClipRRect(
              //                 borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              //                 child: Container(
              //                   child: commonCacheImageWidget(bestSpecialNewList[index].img, 110, width: 120, fit: BoxFit.cover),
              //                 ),
              //               ),
              //               8.height,
              //               Container(
              //                 padding: EdgeInsets.only(left: 8),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Text(
              //                       bestSpecialNewList[index].title!,
              //                       style: boldTextStyle(),
              //                     ),
              //                     8.height,
              //                     Text(bestSpecialNewList[index].subTitle!, style: secondaryTextStyle()),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(BHTxtSalonServices, style: boldTextStyle()),
              //     Text(BHTxtViewAll, style: boldTextStyle(color: BHColorPrimary)).onTap(
              //       () {
              //         sendTextDataOffer(context);
              //       },
              //     ),
              //   ],
              // ),
              // Container(
              //   height: 200,
              //   child: ListView.builder(
              //     padding: EdgeInsets.fromLTRB(0, 8, 16, 8),
              //     itemCount: specialOfferNewList.length,
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (BuildContext context, int index) {
              //       return GestureDetector(
              //         onTap: () {
              //           BHDetailScreen().launch(context);
              //         },
              //         child: Card(
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(10),
              //           ),
              //           margin: EdgeInsets.fromLTRB(0, 8, 16, 8),
              //           shadowColor: BHGreyColor.withOpacity(0.3),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               ClipRRect(
              //                 borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              //                 child: commonCacheImageWidget(specialOfferNewList[index].img, 100, width: 200, fit: BoxFit.cover),
              //               ),
              //               Padding(
              //                 padding: EdgeInsets.all(10),
              //                 child: Text(specialOfferNewList[index].title!, style: boldTextStyle()),
              //               ),
              //               Text(
              //                 specialOfferNewList[index].subtitle!,
              //                 style: secondaryTextStyle(),
              //               ).paddingOnly(right: 8, left: 8, bottom: 8),
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

   POSTGENERATOR(var list) {
    // print(list.username);
    // return Text("cALL");
    // print(list["name"]);
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          ListTile(
            // leading:Container(
            //   margin: EdgeInsets.only(left: 0),
            //   child: Icon(Icons.account_circle_outlined,)),
            title: Row(
              children: [
                
               CircleAvatar(
                radius: 10,
                backgroundImage: NetworkImage(list.avatar),

               ),
                10.width,
                Text(list.username),
              ],
            ),
            trailing: Icon(Icons.arrow_drop_down),
          ),
          // SizedBox(
          //   height: 10,
          // ),
       list.posttext !='' ?  Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            constraints: BoxConstraints(
              maxHeight: double.infinity,
            ),
            child: Text(
              list.posttext.toString(),
              style: TextStyle(),
              textAlign: TextAlign.justify,
            ),
          )
          :Text(""),
          // SizedBox(
          //   height: 10,
          // ),
         list.postFile != "" ?  Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(5),
            child: Image.network(
              list.postFile
              ,
              fit: BoxFit.fitWidth,
            ),
          ):
          Text(""),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 2,
            color: Color.fromARGB(255, 177, 177, 177),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.thumb_up_outlined,
                          size: 22,
                          color: Color.fromARGB(255, 63, 63, 63),
                        ),
                        7.width,
                        Text(list.username),
                      ],
                    )),
                Container(
                    child: Row(
                  children: [
                    Icon(
                      Icons.comment_sharp,
                      size: 22,
                      color: Color.fromARGB(255, 63, 63, 63),
                    ),
                    7.width,
                    Text("comment")
                  ],
                )),
                Container(
                    child: Row(
                  children: [
                    Icon(
                      Icons.share,
                      size: 22,
                      color: Color.fromARGB(255, 63, 63, 63),
                    ),
                    4.width,
                    Text("Share")
                  ],
                ))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Container ListChange() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            // BoxShadow(
            //   blurRadius: 10,spreadRadius: 1,
            //   color: Color.fromARGB(255, 255, 254, 254),
            // )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 235, 232, 232),
            ),
            child: Icon(Icons.add_chart_rounded),
          ),
          Container(
            padding: EdgeInsets.all(7),
            margin: EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 235, 232, 232),
            ),
            child: Icon(Icons.card_travel_rounded),
          ),
          Container(
            padding: EdgeInsets.all(7),
            margin: EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 235, 232, 232),
            ),
            child: Icon(Icons.photo),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 235, 232, 232),
            ),
            child: Icon(Icons.video_camera_back_outlined),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 235, 232, 232),
            ),
            child: Icon(Icons.library_music_rounded),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 235, 232, 232),
            ),
            child: Icon(Icons.document_scanner),
          ),
          Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 235, 232, 232),
              ),
              child: Icon(Icons.explicit_sharp)),
        ],
      ),
    );
  }

  Container UserPost(BuildContext context, var lists ) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: double.infinity,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 1,
              color: Color.fromARGB(255, 206, 203, 203),
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(
              Icons.account_circle,
              color: Colors.red,
            ),
            title: Text(''),
            trailing: Icon(
              Icons.supervised_user_circle_outlined,
              color: Color.fromARGB(255, 189, 175, 51),
            ),
          ),
          10.height,
          Center(
              child: Text(
            "What going On ?HashTag...@Metion",
            style: TextStyle(color: Color.fromARGB(255, 126, 126, 126)),
          )),
          40.height,
          Divider(
            height: 1,
            color: Color.fromARGB(255, 175, 175, 175),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 228, 227, 227),
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.photo,
                    color: Colors.lightBlueAccent,
                  ),
                  8.width,
                  Text("Upload Pics")
                ]),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 228, 227, 227),
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.insert_chart_outlined_rounded,
                    color: Colors.blue,
                  ),
                  8.width,
                  Text("Create Poll")
                ]),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 228, 227, 227),
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.video_call,
                    color: Colors.green,
                  ),
                  8.width,
                  Text("Upload Videos")
                ]),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 228, 227, 227),
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.add_circle_rounded,
                    color: Colors.black,
                  ),
                  8.width,
                  Text("More")
                ]),
              )
            ],
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }

  void sendTextData(BuildContext context) {
    String textData = 'Best Specialists';
    BHSpecialListViewAllScreen(specialList: textData).launch(context);
  }

  void sendTextDataOffer(BuildContext context) {
    String sendOfferText = 'Special Offers';
    BHSpecialOfferViewAllScreen(offerData: sendOfferText).launch(context);
  }
}

class UserModel2 {
  var id;
  var post_id;
  var user_id;
  var recipient_id;
  var posttext;
  var group_id;
  var event_id;
  var page_event_id;
  var PostLink;
  var PostLinkTitle;
  var postLinkImage;
  var postLinkContent;
  var postVimeo;
  var postDailymotion;
  var postFacebook;
  var postFile;
  var postFileName;
  var postFileThumb;
  var postYoutube;
  var time;
  var registered;
  var album_name;
  var post_url;
  var username;
  var email;
  var first_name;
  var last_name;
  var avatar;
  var cover;
  var background_image;
  var address;
  var about;
  var gender;
  var birthday;
  var language;

  UserModel2(
    this.id,
    this.post_id,
    this.user_id,
    this.recipient_id,
    this.posttext,
    this.group_id,
    this.event_id,
    this.page_event_id,
    this.PostLink,
    this.PostLinkTitle,
    this.postLinkImage,
    this.postLinkContent,
    this.postVimeo,
    this.postDailymotion,
    this.postFacebook,
    this.postFile,
    this.postFileName,
    this.postFileThumb,
    this.postYoutube,
    this.time,
    this.registered,
    this.album_name,
    this.post_url,
    this.username,
    this.email,
    this.first_name,
    this.last_name,
    this.avatar,
    this.cover,
    this.background_image,
    this.address,
    this.about,
    this.gender,
    this.birthday,
    this.language,
  );

  // UserModel2(this.author, this.title, this.description, this.url, this.image,
  //     this.publishedAt, this.content);
}
