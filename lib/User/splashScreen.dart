import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bottomNavigationScreen.dart';
import '../mainproviderClass.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    MainProvider provider = Provider.of<MainProvider>(context, listen: false);
    Timer(const Duration(seconds: 3), () {
      provider.getcategoryInfo();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNavigation(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset("assets/amazonlogo.png")),
    );
  }
}
