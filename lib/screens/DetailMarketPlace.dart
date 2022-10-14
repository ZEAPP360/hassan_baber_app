import 'package:flutter/material.dart';


class DetatilMarketplace extends StatefulWidget {
  static String tag = '/DashedBoardScreen';
  var product;
  DetatilMarketplace(this.product);

  @override
  DetatilMarketplaceState createState() => DetatilMarketplaceState(product);
}

class DetatilMarketplaceState extends State<DetatilMarketplace > {
  var product;
  DetatilMarketplaceState(this.product);
 

  @override
  void initState() {
    super.initState();
    print(product.name);
    print( product.images[0]["image"]);
    print(product.price.toString());
    print(product. description);
    print(product.category);
    print(product.timeText);
   
  }

 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Product Detail",style: TextStyle(color: Colors.black),),
        ),
        body: SingleChildScrollView(
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child:Text(product.name.toString())
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height:300,
                  child: Image.network(product.images[0]["image"]),
        
                  // child: Text("Images"),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.price_change),
                      Text(product.price.toString()),
                  

                    ],
                  ),
                ),
                 Container(
                  child: Text(product. description.toString(),textAlign: TextAlign.justify,),
                ),
                SizedBox(height: 15,),
                 Container(
        
                  child: Row(
                    children: [
                      Icon(Icons.phone,color: Colors.green,),
                      SizedBox(width: 10,),
                      Text("01200202",textAlign: TextAlign.justify,),
                    ],
                  ),
                ),
                 SizedBox(height: 15,),
                 Container(
        
                  child: Row(
                    children: [
                      Icon(Icons.location_on,color: Colors.red,),
                      SizedBox(width: 10,),
                      Text(product.location.toString(),textAlign: TextAlign.justify,),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),

       
      ),
    );
  }
}
