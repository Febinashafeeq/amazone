import 'dart:io';

import 'package:amazonui/mainproviderClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCarousel extends StatelessWidget {
  String oldid;
  String from;
  AddCarousel({super.key, required this.from, required this.oldid});

  @override
  Widget build(BuildContext context) {
    MainProvider provider = Provider.of<MainProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[100],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Consumer<MainProvider>(builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Center(
              child: Column(
                children: [
                  value.fileimagecaro != null
                      ? CircleAvatar(
                          radius: 45,
                          backgroundImage:
                              FileImage(value.fileimagecaro! as File),
                          child: InkWell(
                            onTap: () {
                              value.getImageGallerycaro();
                            },
                          ))
                      : CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.cyan,
                          child: InkWell(
                              onTap: () {
                                value.getImageGallerycaro();
                              },
                              child: Icon(
                                Icons.branding_watermark,
                                size: 40,
                                color: Colors.white,
                              ))),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      value.addcarousel(from, oldid);
                      value.getcarouselInfo();
                      value.clearFieldcaro();
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                              "Carousel image added successfully ",
                              style: TextStyle(color: Colors.black),
                            ),
                            backgroundColor: Colors.yellow),
                      );
                    },
                    child: Text("Save"),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
