import 'package:amazonui/User/addressScreen.dart';
import 'package:amazonui/mainproviderClass.dart';
import 'package:amazonui/viewCartScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Center(
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Cartscreen(),
                      ));
                },
                child: Text(
                  "CANCEL",
                  style: TextStyle(color: Colors.black),
                )),
          )
        ],
      ),
      body: Consumer<MainProvider>(builder: (context, value, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15.0,
                ),
                child: Text(
                  "Select a delivery address",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                child: Container(
                  height: 280,
                  width: 330,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      border: Border.all(color: Colors.black12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.radio_button_checked_sharp),
                          // Radio(value: value, groupValue: groupValue, onChanged: onChanged),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 11.0, horizontal: 10),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "h",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Text("h"),
                                Text("h"),
                                Text("Phone"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 23.0),
                        child: Column(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) =>,
                                  //     ));
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.yellow),
                                ),
                                child: Text(
                                  "Deliver to this address",
                                  style: TextStyle(color: Colors.black),
                                )),
                            ElevatedButton(
                                onPressed: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) =>,
                                  //     ));
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.grey.shade100),
                                ),
                                child: Text(
                                  "Edit Address",
                                  style: TextStyle(color: Colors.black),
                                )),
                            ElevatedButton(
                                onPressed: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) =>,
                                  //     ));
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.grey.shade100),
                                ),
                                child: Text(
                                  "Add delivery instructions",
                                  style: TextStyle(color: Colors.black),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 180,
                width: 330,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.radio_button_checked_sharp),
                        // Radio(value: value, groupValue: groupValue, onChanged: onChanged),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 11.0, horizontal: 10),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "h",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text("h"),
                              Text("h"),
                              Text("Phone"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddressScreen(),
                      ));
                },
                child: Container(
                  height: 60,
                  width: 330,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Add a New Address",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Icon(Icons.arrow_forward_ios_rounded,size: 25,)
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 60,
                width: 330,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Deliver to multiple address",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Icon(Icons.arrow_forward_ios_rounded,size: 25,)
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
