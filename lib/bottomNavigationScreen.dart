

import 'package:amazonui/accountScreen.dart';
import 'package:amazonui/amazonhomeScreen.dart';
import 'package:amazonui/mainproviderClass.dart';
import 'package:amazonui/menuScreen.dart';
import 'package:amazonui/viewCartScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});


  @override
  Widget build(BuildContext context) {
    final pages = [AmazonhomeScreen(), AccountScreen(), Cartscreen(), MenuScreen()];
    MainProvider provider = Provider.of<MainProvider>(context, listen: true);
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  provider.onItemTapped(0);
                },
                icon: Icon(Icons.home_outlined)),
            IconButton(

                onPressed: () {
                  provider.onItemTapped(1);
                },
                icon: Icon(Icons.person_2_outlined)),
            IconButton(
              // enableFeedback: false,
                onPressed: () {
                  provider.onItemTapped(2);
                  provider.getcartinfo();
                },
                icon: Icon(Icons.shopping_cart_outlined)),
            IconButton(
                onPressed: () {
                  provider.onItemTapped(3);
                },
                icon: Icon(Icons.menu))
          ],
        ),
      ),
      body: pages[provider.selectedIndex],
    );
  }
}
