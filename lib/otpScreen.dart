import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mainproviderClass.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<MainProvider>(builder: (context, value, child) {
        return Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Consumer<MainProvider>(builder: (context, value, child) {
              return TextFormField(
                controller: value.nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                  hintText: 'Enter Your Name',
                ),
              );
            }),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: value.phoneController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone number',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                value.sendotp();
              },
              child: Text("Send OTP"),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: value.otpController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter OTP',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                value.verifyOtp(value.otpController.text);
              },
              child: Text("Verify OTP"),
            ),
          ],
        );
      }),
    );
  }
}
