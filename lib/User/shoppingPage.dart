import 'package:amazonui/User/userLogin.dart';
import 'package:amazonui/User/wishList.dart';
import 'package:amazonui/cartScreen.dart';
import 'package:amazonui/mainproviderClass.dart';
import 'package:amazonui/viewCartScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ShoppingPage extends StatelessWidget {
  String image;
  String price;
  String name;
  // String img;
  // String cost;
  // String pname;

  ShoppingPage(
      {super.key,
      required this.image,
      required this.price,
      required this.name,
     });
  @override
  Widget build(BuildContext context) {
    // int itemcount = 0;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Colors.orange[100],
        title: Container(
          height: 40,
          child: TextFormField(
            decoration: InputDecoration(
                labelText: "Search Amazon.in",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.grey,
                )),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<MainProvider>(builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 18.0,
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      child: Image.network(image),
                    ),
                    Positioned(
                        left: 270,
                        child: InkWell(
                          onTap: () {
                            value.sharepop();
                          },
                          child: Icon(
                            Icons.share,
                            color: Colors.black,
                          ),
                        )),
                    Positioned(
                        top: 280,
                        child: InkWell(
                            onTap: () {
                              value.Addwishlist(name, price, image, context);
                              value.getwishlistinfo();
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => WishList()));
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(14),
                                        child: Center(child: const Text("Wishlist")),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Icon(Icons.favorite_border))),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        name,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.w100),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      "3.4",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orangeAccent,
                      size: 14,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orangeAccent,
                      size: 14,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orangeAccent,
                      size: 14,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orangeAccent,
                      size: 14,
                    ),
                    Icon(
                      Icons.star_outline,
                      color: Colors.orangeAccent,
                      size: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "51,393",
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, left: 8),
                      child: Text(
                        "Discghdfhf bhfdjfdlfk hjfsdkfk fhfklfk fjkf.f"
                        "dshmjm,nd,"
                        "fbj,dkjdkfjd.kdetweyriuori yfueiricnx mzkm geykrfeuiurfli ",
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 5.0),
                      child: Container(
                        height: 2,
                        width: 400,
                        color: Colors.black26,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Colour:",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          width: 250,
                        ),
                        Transform.rotate(
                            angle: 4.7,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 20,
                              ),
                            )),
                        // Transform.rotate(child: Icon(Icons.arrow_forward_ios_rounded,)),
                      ],
                    ),
                    // Container(
                    //   width: 400,
                    //   height: 50,
                    //   color: Colors.cyanAccent,
                    // ),
                    Consumer<MainProvider>(builder: (context, value, child) {
                      return SizedBox(
                        height: 100,
                        child: ListView.builder(
                            itemCount: value.productimage.length,
                            padding: EdgeInsets.all(8),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 6,),
                                height: 100,
                                width: 130,
                                decoration: BoxDecoration(

                                  border: Border.all(
                                    color: Colors.black26,
                                  ),
                                ),
                                child: Image.asset(value.productimage[index],
                                    fit: BoxFit.fill),
                              );
                            }),
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 5.0),
                      child: Container(
                        height: 2,
                        width: 400,
                        color: Colors.black26,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 208.0, top: 7.0),
                      child: Container(
                        width: 110,
                        height: 29,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.pink),
                        child: Center(
                            child: Text(
                          "Deal of the Day",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 160.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "-30% ",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.pink,
                            ),
                          ),
                          Text(
                            "₹ ",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            price,
                            style: TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 210.0),
                      child: Text(
                        "M.R.P.:₹4700",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 100.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              ".  ",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text("EMI starts at ₹ 200.  "),
                          Text(
                            "EMI options",
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 160.0,
                      ),
                      child: Text("Inclusive of all taxes"),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 5.0),
                      child: Container(
                        height: 2,
                        width: 400,
                        color: Colors.black26,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 7.0),
                      child: Row(
                        children: [
                          Text(
                            "Total:  ₹",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            price,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 17.0, top: 20),
                      child: Row(
                        children: [
                          Text(
                            "FREE delivery  ",
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                          Text(
                            "Wednesday, 23 March. ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Details",
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("Or fastest delivery"),
                        ),
                        Text(
                          "Today by 7 PM",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        Text(
                          "Select location",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      value.Addcart(name, price, image, context);
                      value.getcartinfo();
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Cartscreen()));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                child: const Text("Cart"),
                              ),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Container(
                                  child: Text("Proceed to checkout"),
                                ))
                          ],
                        ),
                      );
                    },
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.yellowAccent),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                UserLogin(from: "New", oldid: ""),
                          ));
                    },
                    child: Text(
                      "Buy Now",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.orange,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
