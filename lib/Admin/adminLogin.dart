import 'package:amazonui/Admin/addproductScreen.dart';
import 'package:amazonui/Admin/products.dart';
import 'package:amazonui/displayUser.dart';
import 'package:amazonui/displayproduct.dart';
import 'package:amazonui/mainproviderClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'addCategory.dart';
import 'carousel.dart';
import 'category.dart';

class AdminLogin extends StatelessWidget {
  const AdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    MainProvider provider = Provider.of<MainProvider>(context);

    return Scaffold(

      appBar: AppBar(
        title: Text("#Admin Login",style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.orange[100],
      ),

      body: Consumer<MainProvider>(
          builder: (context,value,child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Consumer<MainProvider>(
                      builder: (context,value,child) {
                        return SizedBox(
                          height: 50,
                          width: 330,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: TextFormField(
                              controller: value.nameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'User Name',
                                hintText: 'Enter Your Name',
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: 330,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: TextFormField(
                        keyboardType:TextInputType.number ,
                        controller: value.phoneController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone number',

                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      value.sendotp();
                    },style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.orange[100])
                  ),
                    child: Text("Send OTP",style: TextStyle(color: Colors.black),),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                 SizedBox(
                   height: 50,
                   width: 330,
                   child:  Padding(
                     padding: const EdgeInsets.only(left: 15.0),
                     child: TextFormField(
                       keyboardType:TextInputType.number ,
                       controller: value.otpController,
                       decoration: InputDecoration(
                         border: OutlineInputBorder(),
                         labelText: 'Enter OTP',

                       ),
                     ),
                   ),
                 ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      value.verifyOtp(value.otpController.text);
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.orange[100])
                    ),

                    child: Text("Verify OTP",style: TextStyle(color: Colors.black),),

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                         builder: (context) =>Products(),

                                      ));
                      provider.getproductInfo();


                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.orange[100])
                    ),

                    child: Text("Products",style: TextStyle(color: Colors.black),),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                         builder: (context) =>Category(),
                                      ));
                      provider.getcategoryInfo();

                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.orange[100])
                    ),

                    child: Text("Category",style: TextStyle(color: Colors.black),),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                         builder: (context) =>Carousel(),
                                      ));
                      provider.getcarouselInfo();

                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.orange[100])
                    ),

                    child: Text("Carousel",style: TextStyle(color: Colors.black),),
                  ),

ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                         builder: (context) =>DisplayScreen(),
                                      ));

                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.orange[100])
                    ),

                    child: Text("UserInfo",style: TextStyle(color: Colors.black),),
                  ),


                ],
              ),
            );
          }
      ),

    );
  }
}
