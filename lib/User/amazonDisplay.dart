import 'package:amazonui/Admin/adminLogin.dart';
import 'package:amazonui/User/userLogin.dart';
import 'package:amazonui/bottomNavigationScreen.dart';
import 'package:amazonui/bottomNvgbr.dart';
import 'package:amazonui/mainproviderClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class AmazonHome extends StatelessWidget {
  String from;
  String oldid;
  AmazonHome({super.key, required this.from, required this.oldid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[100],
      ),
      body: Consumer<MainProvider>(builder: (context, value, child) {
        return Center(
          child: Container(
            height: 700,
            width: 360,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Column(
              children: [
                Image.asset("assets/amazonlogo.png"),
                Text(
                  "Sign in to your account",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AdminLogin(),
                              ));
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.orange[100]),),
                        child: Text(
                          "Admin Sign in",
                          style: TextStyle(color: Colors.black),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UserLogin(from: "New", oldid: ""),
                              ));
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.orange[100])),
                        child: Text(
                          "User Sign in",
                          style: TextStyle(color: Colors.black),
                        )),
                  ],
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
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.orange[100]),
                    ),
                    child: Text(
                      "Skip sign in",
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ),
          ),
        );
      }),
    );
  }
}
