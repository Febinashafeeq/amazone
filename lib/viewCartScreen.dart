import 'package:amazonui/paymentScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mainproviderClass.dart';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          //color: Colors.white,
          height: 40,
          width: 300,
          child: Text(
            "My Cart",
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Color(0xff42f5f2),
            child: Row(
              children: [
                Icon(Icons.location_on_outlined),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Select a location to see product availability",
                  style:
                  TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
                InkWell(
                    onTap: () {},
                    child: Icon(
                      (Icons.keyboard_arrow_down),
                    )),
              ],
            ),
          ),
         Padding(
           padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 15),
           child: Container(
             child: Column(
               children: [
                 Row(
                   children: [

                     Text("Subtotal ",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                     Text("₹45,129",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),
                   ],
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 Row(
                   children: [
                     Text("EMI Available  "),
                     Text("Details",style: TextStyle(color: Colors.cyan),)
                   ],
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 Row(
                   children: [
                     Icon(Icons.check_circle,color: Colors.green.shade800),
                     Text("Part of your order qualifies for FREE Delivery.",style: TextStyle(color: Colors.green.shade400),),
                   ],
                 ),
                 Row(
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(left: 20.0),
                       child: Text("Select this option at checkout."),
                     ),
                     Text("Details",style: TextStyle(color: Colors.cyan),),
                   ],
                 ),

                 Padding(
                   padding: EdgeInsets.symmetric(vertical: 18.0),
                   child: InkWell(
                     onTap: (){
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => PaymentScreen(),
                           ));
                     },
                     child: Container(
                       height: 45,
                       width: 330,
                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.yellow),
                       child: Center(child: Text("Proceed to Buy (3 items)",style: TextStyle(fontWeight: FontWeight.w600),),),
                     ),
                   ),
                 ),
                 Container(
                   child: Row(
                     children: [
                       Icon(Icons.crop_square_rounded),
                       Text("Send as a gift. Include custom message"),
                     ],
                   ),
                 ),
               ],

             ),
           ),
         ),

          Consumer<MainProvider>(builder: (context, value, child) {
            return Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: value.cartlist.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Container(
                        height: 250,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  height: 140,
                                  width: 130,
                                  child: Center(
                                    child: Image.network(
                                        value.cartlist[index].photo,
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(value.cartlist[index].name),
                                    Text(
                                      "₹${value.cartlist[index].price}",
                                      style: TextStyle(color: Colors.black,fontSize: 19),
                                    ),
                                    Text("Eligible for FREE shipping",style: TextStyle(fontSize: 10),),
                                    SizedBox(
                                      height: 80,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              // crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: Colors.black12),
                                        color: Colors.white),
                                    height: 30,
                                    width: 80,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            height: 30,
                                            width: 25,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                  width: 1,
                                                  color: Colors.black12,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    topLeft:
                                                        Radius.circular(10))),
                                            child: Icon(Icons.remove)),
                                        Container(
                                            height: 30,
                                            width: 15,
                                            child: Center(child: Text("0"))),
                                        Container(
                                            height: 30,
                                            width: 25,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                  width: 1,
                                                  color: Colors.black12,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10))),
                                            child: Icon(Icons.add))
                                      ],
                                    )),
                                SizedBox(
                                  width: 50,
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border:
                                            Border.all(color: Colors.black12)),
                                    height: 30,
                                    width: 60,
                                    child: Center(child: Text("Remove"))),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,

                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),

                                        border:
                                        Border.all(color: Colors.black12)),
                                    height: 30,
                                    width: 100,
                                    child: Center(child: Text("Save for later"))),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border:
                                        Border.all(color: Colors.black12)),
                                    height: 30,
                                    width: 120,
                                    child: Center(child: Text("See more like this"))),
                              ],
                            ),

                          ],
                        ),
                      ),
                    );
                  }),
            );
          }),
        ],
      ),
    );
  }
}
