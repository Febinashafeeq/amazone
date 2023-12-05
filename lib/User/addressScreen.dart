import 'package:amazonui/mainproviderClass.dart';
import 'package:amazonui/paymentScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Center(
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentScreen(),
                      ));
                },
                child: Text(
                  "CANCEL",
                  style: TextStyle(color: Colors.black),
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Consumer<MainProvider>(builder: (context, value, child) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Enter a new delivery address",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(vertical: 18.0),
                      //   child: SizedBox(
                      //     height: 50,
                      //     width: 330,
                      //     child: TextFormField(
                      //       // controller: value.otpController,
                      //       decoration: InputDecoration(
                      //         border: OutlineInputBorder(),
                      //         labelText: 'Use current location',
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Text(
                        "Full name(First name and last name)",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 13),
                      ),
                      TextFormField(
                        controller: value.cnamecontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          labelText: 'Name',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 18.0),
                        child: SizedBox(
                          height: 50,
                          width: 330,
                          child: TextFormField(
                              controller: value.countrycontroller,

                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'India',
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Mobile number)",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 13),
                      ),
                      TextFormField(
                        controller: value.mobcontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          labelText: 'Mobile number',
                        ),
                      ),
                      Text(
                        "May be used to assist delivery",
                        style: TextStyle(fontSize: 8, color: Colors.black),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Flat, House no.,Building,Company,Apartment",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 13),
                      ),
                      TextFormField(
                        controller: value.buildcontroller,


                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),

                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Landmark",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 13),
                      ),
                      TextFormField(
                        controller: value.landcontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          labelText: 'E.g. near goverment hospital',
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Town/City",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 13),
                      ),
                      TextFormField(
                        controller: value.towncontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.crop_square_rounded),
                            Text("Make this my default address"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        color: CupertinoColors.black,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 88.0),
                        child: ElevatedButton(
                            onPressed: () {
                              value.addAddress();
                              value.getaddressInfo();
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
                              "Add address",
                              style: TextStyle(color: Colors.black),
                            )),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
