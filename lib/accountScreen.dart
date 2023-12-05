import 'package:amazonui/User/addressScreen.dart';
import 'package:amazonui/mainproviderClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'User/wishList.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff42f5f2),
        elevation: 0,
        leading: Image.asset("assets/amz.png"),
        actions: [
          Icon(
            Icons.notifications_none_sharp,
            color: Colors.black,
            size: 29,
          ),
          SizedBox(
            width: 15,
          ),
          Icon(
            (Icons.search),
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Consumer<MainProvider>(
          builder: (context,value,child) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                  child: Row(
                    children: [
                      Text("Hello,",
                          style:
                              TextStyle(fontWeight: FontWeight.w500, fontSize: 19)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Shafeeq",
                          style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 132,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context) =>AddressScreen() , ));
                        },
                        child: Icon(
                          Icons.account_circle_rounded,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 45,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white,
                          border: Border.all(color: Colors.black26),
                        ),
                        child: Center(
                            child: Text(
                          "Your Orders",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 45,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white,
                          border: Border.all(color: Colors.black26),
                        ),
                        child: Center(
                            child: Text(
                          "Buy again",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        )),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 45,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white,
                          border: Border.all(color: Colors.black26),
                        ),
                        child: Center(
                            child: Text(
                          "Your Account",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 45,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white,
                          border: Border.all(color: Colors.black26),
                        ),
                        child: Center(
                            child: InkWell(onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WishList()));

                            },
                              child: Text(
                          "Your Lists",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                            )),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                  child: Row(
                    children: [
                      Text(
                        "Your orders",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        width: 160,
                      ),
                      Text(
                        "See all",
                        style: TextStyle(fontSize: 14, color: Colors.greenAccent),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 130,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: Colors.black26),
                        ),
                        child: Image.asset("assets/pd.png"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 130,
                            width: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(color: Colors.black26),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Can't find the order?",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Container(
                                  width: 160,
                                  height: 72,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 25.0),
                                    child: TextFormField(
                                      style: TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                        hintText: "Search orders",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          borderSide:
                                              const BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: Colors.lightBlue)),
                                        prefixIcon: const Icon(
                                          Icons.search,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 8,
                  color: Colors.black26,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Text(
                        "Buy again",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 190,
                      ),
                      Text(
                        "See all",
                        style: TextStyle(color: Colors.greenAccent),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 115,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        border: Border.all(color: Colors.black26),
                      ),
                      child: Image.asset("assets/mask.png"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 4,
                  color: Colors.black26,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Text(
                        "Your Lists",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(
                        width: 210,
                      ),
                      Text(
                        "See all",
                        style: TextStyle(color: Colors.cyan),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 95,
                  width: 345,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    border: Border.all(color: Colors.black26),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  "Shopping",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "List",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Private.",
                            style: TextStyle(fontSize: 10),
                          ),
                          Text(
                            "Default",
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                      Container(
                        height: 85,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black12,
                          border: Border.all(color: Colors.black26),
                        ),
                        child: Image.asset(
                          "assets/mob.png",
                          scale: 8,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Container(
                        height: 85,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black12,
                          border: Border.all(color: Colors.black26),
                        ),
                        child: Image.asset(
                          "assets/hbag.png",
                          scale: 5,
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Container(
                        height: 85,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black12,
                          border: Border.all(color: Colors.black26),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Icon(Icons.more_horiz_sharp)
                            // Text("...",style: TextStyle(fontSize: 40),),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
