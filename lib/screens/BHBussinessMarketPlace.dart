import 'dart:convert';
import 'dart:io';

import 'package:barberapp/screens/DetailMarketPlace.dart';
import 'package:barberapp/utils/BHConstants.dart';
import 'package:flutter/material.dart';
import 'package:barberapp/utils/panel.dart';
import 'package:localstorage/localstorage.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:barberapp/model/BHModel.dart';
import 'package:barberapp/utils/BHColors.dart';
import 'package:barberapp/utils/BHDataProvider.dart';
import 'package:barberapp/utils/BHImages.dart';
import 'package:barberapp/utils/BHWidgets.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
class BHBussinessMarketPlace extends StatefulWidget {
  static String tag = '/SlideUpSheetScreen';

  @override
  BHBussinessMarketPlaceState createState() => BHBussinessMarketPlaceState();
}

class BHBussinessMarketPlaceState extends State<BHBussinessMarketPlace> {
  late List<BHNotifyModel> notifyList;
  TextEditingController findSalonCont = TextEditingController();

  late  var imagepath;
  TextEditingController prod_title = TextEditingController();
  TextEditingController prod_cat = TextEditingController();
  TextEditingController prod_price = TextEditingController();
  TextEditingController prod_loc = TextEditingController();
  TextEditingController prod_subcat = TextEditingController();
   TextEditingController prod_des= TextEditingController();


   final LocalStorage storage = new LocalStorage('localstorage_app');



  @override
  void initState() {
    super.initState();
    
    notifyList = getNotifyList();
     callApi();
  }
  

  var marketproduct = [];

  callApi() async {
    if (mounted) {
    setState(() {
       
    });
}
    marketproduct = [];
    // setState(() {});
    print("hello");
    var response = await http.post(
        Uri.parse(
            'https://hostrelic.com/sys/wowonder/api/get-products?access_token=a37fdb2bdcdf6bb72a8d2449f6ffab8acf09f8399865ad0615379d68218e3860c9b2b7d563335652acfe22eeddf82266e32f8f17912d59fe'),
        body: ({
          'server_key':
              server_key,
        }));

    var data = json.decode(response.body)["products"];
    print("Call"+data.toString());


    print(data.length);

    for (var i in data) {

      UserModel3 data = UserModel3(
        i['id'],
        i['user_id'],
        i['page_id'],
        i['name'],
        i['description'],
        i['category'],
        i['subcategory'],
        i['price'],
        i['location'],
        i['status'],
        i['type'],
        i['currency'],
        i['lng'],
        i['lat'],
        i['units'],
        i['time'],
        i['active'],
        i['images'],
        i['timeText'],
        i['postId'],
        i['editdescription'],
        i['url'],
         i['reviewUrl'],
        i['seoId'],
        i['reviewsSeoId'],
        i['productSubCategory'],
        i['fields'],
        i['addedToCart'],
        i['rating'],
        i['reviewsCount'],
        i['priceFormat'],
       
      );


      marketproduct.add(data);
      // print(marketproduct);
    }
    print(marketproduct);
    setState(() {});
    //  set;
  }

  imageupload() async {
    print("Image Uplaod");

    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final image = await _picker.pickImage(source: ImageSource.gallery);

    print("image :" + image!.path);
   imagepath = image.path;
    setState(() {
      imagepath = image.path;
    });
    print(imagepath);
  }
  addMarketPlace(){
    print("add Market place");
    showDialog(
      
    context: context,
    builder: (_) {
      var emailController = TextEditingController();
      var messageController = TextEditingController();

     

      return Container(
        width: 1000,
        height: 100,
        child: AlertDialog(
          //  insetPadding: EdgeInsets.symmetric(horizontal: 400),
          title: Text('Add New Product'),
          content: SingleChildScrollView(
            child: Container(
              height: 450,
              child: Column(
                
                children: [
                  TextFormField(
                    controller: prod_title,
                    decoration: InputDecoration(hintText: 'Product_Title'),
                  ),
                    16.height,
          
                 TextFormField(
                    controller: prod_cat,
                    decoration: InputDecoration(hintText: 'Product_Category'),
                  ),
                    16.height,
          
          
                  TextFormField(
                    controller: prod_price,
                    decoration: InputDecoration(hintText: 'Product_Price'),
                  ),
                    16.height,
          
          
                  TextFormField(
                    controller: prod_loc,
                    decoration: InputDecoration(hintText: 'Product_Location'),
                  ),
                    16.height,
          
                  TextFormField(
                    controller: prod_subcat,
                    decoration: InputDecoration(hintText: 'Product_sub_Title'),
                  ),
                    16.height,
          
                     TextFormField(
                    controller: prod_des,
                    decoration: InputDecoration(hintText: 'Product_Descrpition'),
                  ),
                    16.height,
          
          
                  ElevatedButton(onPressed: (){
                     imageupload();
                  }, child: Text("Image Upload"))
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Send them to your email maybe?
                // var email = emailController.text;
                // var message = messageController.text;
                // Navigator.pop(context);
                addnewproduct();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      );
    },
  );
  }


addnewproduct() async {
  // print("call");

   String ImageName = path.basename(imagepath);
    File file = File(imagepath);

    print(ImageName.toString());
    print(file.toString());


      var access_token = storage.getItem("access_token");
    var user_id = storage.getItem("User_id");

// List<int> imageBytes = imagepath.readAsBytesSync();

// var base64Image = base64Encode(imagepath.readAsBytesSync());

// print(base64Image);

   var response = await http.post(
        Uri.parse(
            'https://hostrelic.com/sys/wowonder/api/create-product?access_token=$access_token'),
        body: ({
          'server_key':server_key,
          'product_title':prod_title.text,
          'product_category':prod_cat.text,
          'product_description':prod_des.text,
          'product_price':prod_price.text,
          'product_location':prod_loc.text,
          'images[]':file.toString(),
          'product_sub_category':prod_subcat.text
        }));

  //  var response = await http.post(
  //             uploadurl, 
  //             body: {
  //                'image': baseimage,
  //             }
  //     );

    print(response.body);


}


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          
      body: SingleChildScrollView(
        
        child: Container(
          color: Color.fromARGB(255, 236, 234, 234),
          child: Column(
            
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2,
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: ListTile(
                      leading: Text("Market Place",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      trailing: Container(child: ElevatedButton(child: Icon(Icons.add),
                      onPressed: (){
                        addMarketPlace();
                      },
                      )),
                    )),
                    // Container()
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     ListCat(_icons[0]),
                //     ListCat(_icons[1]),
                //     ListCat(_icons[2]),
                //     ListCat(_icons[3])

                //   ],
                // )
                GridView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: marketproduct.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (1 / 1.7),
                    // crossAxisSpacing: 4.0,
                    // mainAxisSpacing: 4.0
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    print(marketproduct[index].price );
                     print( marketproduct[index].images[0]["image"]);
                    // print(marketproduct[index]["price"]);
                    return GestureDetector(
                      onTap: (){ 
                       
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          DetatilMarketplace(marketproduct[index])));
                        
                      },
                      child: Container(
                          constraints: BoxConstraints(
                            maxHeight: double.infinity,
                          ),
                          child: Card(
                            elevation: 100,
                              child: Column(
                            children: [
                            
                              Container(
                                height: 230,
                                child: Image.network(
                                marketproduct[index].images[0]["image"],
                                ),
                              ),
                              Text(marketproduct[index].price.toString(),   style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(marketproduct[index].location.toString(),
                                 style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                            ],
                          ))),
                    );
                  },
                )
              ]),
        ),
      ),
    ));
    // body: SlidingUpPanel(
    //   panelBuilder: (ScrollController? sc) => _scrollingList(sc!),
    //   margin: EdgeInsets.symmetric(horizontal: 16),
    //   borderRadius: BorderRadius.only(
    //     topLeft: Radius.circular(24.0),
    //     topRight: Radius.circular(24.0),
    //   ),
    // ),
  }

  Container ListCat(var icn) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 236, 235, 235),
            borderRadius: BorderRadius.circular(20)),
        child: Icon(icn));
  }


  Widget _scrollingList(ScrollController sc) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        color: context.cardColor,
      ),
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(BHLocation,
                    width: 14, height: 14, color: context.iconColor),
                8.width,
                Text('Dorthy walks,chicago,Us.',
                    style: primaryTextStyle(size: 14)),
              ],
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      autocorrect: true,
                      controller: findSalonCont,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        hintText: 'Find salon Services',
                        prefixIcon: Icon(Icons.search,
                            color: context.iconColor, size: 20),
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        filled: true,
                        fillColor: context.cardColor,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: BHAppDividerColor, width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: BHAppDividerColor, width: 0.5),
                        ),
                      ),
                    ),
                  ),
                ),
                8.width,
                Container(
                  child: Icon(Icons.cancel, color: context.iconColor),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: BHAppDividerColor, width: 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ).onTap(
                  () {
                    findSalonCont.clear();
                  },
                ),
              ],
            ),
            16.height,
            ListView.separated(
              separatorBuilder: (context, index) =>
                  Divider(color: BHAppDividerColor),
              physics: NeverScrollableScrollPhysics(),
              itemCount: notifyList.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: commonCacheImageWidget(notifyList[index].img, 60,
                          width: 90, fit: BoxFit.cover),
                    ),
                    8.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(notifyList[index].name!, style: boldTextStyle()),
                        8.height,
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                size: 14, color: BHAppTextColorSecondary),
                            Text(
                              notifyList[index].address!,
                              style: secondaryTextStyle(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ).expand(),
                          ],
                        ),
                        8.height,
                        Row(
                          children: [
                            Text(notifyList[index].rating.toString(),
                                style: TextStyle(
                                    fontSize: 12, color: BHGreyColor)),
                            Icon(Icons.star, size: 14, color: BHColorPrimary)
                                .paddingOnly(left: 4),
                            8.width,
                            Text(notifyList[index].distance.toString(),
                                style: TextStyle(
                                    fontSize: 12, color: BHGreyColor)),
                            Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Text('km',
                                  style: TextStyle(
                                      fontSize: 12, color: BHGreyColor)),
                            ),
                          ],
                        ),
                      ],
                    ).expand(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

//   List<IconData> _icons = [
// // The underscore declares a variable as private in dart.
//     Icons.person,
//     Icons.inbox,
//     Icons.sell,
//     Icons.category
//   ];
//   List<String> images = [
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxaTlviCL29fqDEQ81vp1wP7TPl7B-TwOJ4JREhr3Rw20F_pazWFCrWAj5XjMQsff2t7M&usqp=CAU",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO2Qs4e-8bT5JXeFqiFscGYinQ-cFPJ94ts-Ay3bkkuB8ftcfnvtj_RqkoSrSQu3nQbXk&usqp=CAU",
//     "https://ae01.alicdn.com/kf/Ae4d642f89964401697a956111ccf223ce/Hair-Cutting-Machine-T9-Vintage-Hair-Trimmer-for-Men-Barber-Clippers-Professional-USB-Rechargeable-Electric-Beard.jpg_Q90.jpg_.webp",
//     "https://static-01.daraz.pk/p/9b30759c1f778d0ae6b0940e4d831b8c.jpg",
//     "https://cdn.shopify.com/s/files/1/1679/1289/products/napla-mieufa-uv-cut-floral-hair-and-skin-perfume-spray-tender-lily-spf50-pa-80g-lmching-group-2_540x.jpg?v=1663137899",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCdPKHBAzMQseeqcFx7WSGAA1xZB90OHGeEkZ0WrIiAIvpgVGluNJTSGrOHYXBdxhUkeo&usqp=CAU",
//   ];

}

class UserModel3 {
     String? id;
    String? userId;
    String? pageId;
    String? name;
    String? description;
    String? category;
    String? subCategory;
    String? price;
    String? location;
    String? status;
    String? type;
    String? currency;
    String? lng;
    String? lat;
    String? units;
    String? time;
    String? active;
    List? images;
    String? timeText;
    String? postId;
    String? editDescription;
    String? url;
    String? reviewsUrl;
    String? seoId;
    String? reviewsSeoId;
    String? productSubCategory;
    List<dynamic>? fields;
    int? addedToCart;
   // Seller userData;
    dynamic? rating;
    int? reviewsCount;
    String? priceFormat;
   // Seller seller;

  UserModel3(
    this.id,
        this.userId,
        this.pageId,
        this.name,
        this.description,
        this.category,
        this.subCategory,
        this.price,
        this.location,
        this.status,
        this.type,
        this.currency,
        this.lng,
        this.lat,
        this.units,
        this.time,
        this.active,
        this.images,
        this.timeText,
        this.postId,
        this.editDescription,
        this.url,
        this.reviewsUrl,
        this.seoId,
        this.reviewsSeoId,
        this.productSubCategory,
        this.fields,
        this.addedToCart,
        
        this.rating,
        this.reviewsCount,
        this.priceFormat,
      
  );

  // UserModel2(this.author, this.title, this.description, this.url, this.image,
  //     this.publishedAt, this.content);
}