import 'package:amazonui/displayUser.dart';
import 'package:amazonui/mainproviderClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../amazonhomeScreen.dart';
import '../amazonhomeScreen.dart';
import '../bottomNavigationScreen.dart';

class UserLogin extends StatelessWidget {
  String from;
  String oldid;
  UserLogin({super.key, required this.from, required this.oldid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[100],
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Center(child: Image.asset("assets/amazonlogo.png")),
      ),
      body: Consumer<MainProvider>(builder: (context, value, child) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              value.fileimage != null
                  ? CircleAvatar(
                      radius: 30,
                      backgroundImage: FileImage(value.fileimage!),
                    )
                  : value.img != ""
                      ? InkWell(
                          onTap: () {
                            value.showBottomSheet(context);
                          },
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(value.img),
                          ),
                        )
                      : CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.grey,
                          child: InkWell(
                              onTap: () {
                                value.showBottomSheet(context);
                              },
                              child: Icon(
                                Icons.account_circle,
                                size: 40,
                                color: Colors.white,
                              ))),
              Padding(
                padding: EdgeInsets.all(15),
                child: Consumer<MainProvider>(builder: (context, value, child) {
                  return TextFormField(
                    controller: value.nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                      hintText: 'Enter Your Name',
                    ),
                  );
                }),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Consumer<MainProvider>(builder: (context, value, child) {
                  return TextFormField(
                    controller: value.passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                  );
                }),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 60,
                width: 330,
                child: TextFormField(
                  controller: value.phoneController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Mobile number',
                    hintText: 'Enter mobile number',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  value.sendotp();
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.orange[100])),
                child: Text(
                  "Verify Mobile number",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 60,
                width: 330,
                child: TextFormField(
                  controller: value.otpController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter OTP',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        value.verifyOtp(value.otpController.text);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.orange[100])),
                      child: Text(
                        "Verify OTP",
                        style: TextStyle(color: Colors.black),
                      )),
                  SizedBox(
                    width: 60,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      value.getcarouselInfo();
                      value.getcategoryInfo();
                      value.getproductInfo();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>BottomNavigation(),
                          ));
                      value.addUser(from, oldid);
                      value.getInfo();
                      value.clearField();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AmazonhomeScreen(),
                          ));
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.orange[100])),
                    child: Text(
                      "sign in",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              // Consumer<Providerclass>(
              //     builder: (context,value,child) {
              //       return ElevatedButton(onPressed: (){
              //         value.getInfo();
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                builder: (context) => DisplayScreen(),
              //             ));
              //       },
              //           style: ButtonStyle(
              //               backgroundColor: MaterialStatePropertyAll(Colors.orange[100])
              //           ),child: Text("User info",style: TextStyle(color: Colors.black),));
              //     }
              // )
            ],
          ),
        );
      }),
    );
  }
}
