import 'package:amazonui/accountScreen.dart';
import 'package:amazonui/amazonhomeScreen.dart';
import 'package:amazonui/cartScreen.dart';
import 'package:amazonui/menuScreen.dart';
import 'package:amazonui/viewCartScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mainproviderClass.dart';

class BottomNvgbr extends StatefulWidget {
  const BottomNvgbr({super.key});

  @override
  State<BottomNvgbr> createState() => _BottomNvgbrState();
}

class _BottomNvgbrState extends State<BottomNvgbr> {
  int pageIndex = 0;
  var screens=[
    AmazonhomeScreen(),
    AccountScreen(),
    Cartscreen(),
    MenuScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    MainProvider provider = Provider.of<MainProvider>(context);
    return Scaffold(
      body:screens[pageIndex] ,

      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0 ? const Icon(
                Icons.home_outlined,
                color: Colors.greenAccent,
                size: 20,
              )
                  : const Icon(
                Icons.home_outlined,
                color: Colors.black,
                size: 30,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? const Icon(
                Icons.account_box_outlined,
                color: Colors.greenAccent,
                size: 30,
              )
                  : const Icon(
                Icons.account_box_outlined,
                color: Colors.black,
                size: 20,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                  provider.getcartinfo();

                });
              },
              icon: pageIndex == 2
                  ? const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.greenAccent,
                size: 20,
              )
                  : const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
                size: 20,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: pageIndex == 3
                  ? Column(
                    children: [
                      const Icon(
                Icons.menu,
                color: Colors.greenAccent,
                size: 20,
              ),Text("Menu",style: TextStyle(fontSize: 10),),
                    ],
                  )
                  : Column(
                    children: [
                      const Icon(
                Icons.menu,
                color: Colors.black,
                size: 20,
              ),
              Text("Menu",style: TextStyle(fontSize: 10),),


          ],
                  ),
            ),



          ],
        ),
      ),
      floatingActionButton:  FloatingActionButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(45)
        ),
        backgroundColor: Colors.black,
        child: Icon(Icons.mic_none,),
        onPressed: () {},


      ),
    );
  }
}
