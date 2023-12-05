import 'dart:io';

import 'package:amazonui/mainproviderClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class AddCategory extends StatelessWidget {
  String from;
  String oldid;

   AddCategory({super.key,required this.from,required this.oldid});

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
          return SingleChildScrollView(
            child: Column(
              children: [
                value.fileimagecat != null
                    ? CircleAvatar(
                    radius: 45,
                    backgroundImage: FileImage(value.fileimagecat! as File),
                    child: InkWell(
                      onTap: () {
                        value.getImageGallerycat();
                      },
                    ))
                    : CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.cyan,
                    child: InkWell(
                        onTap: () {
                          value.getImageGallerycat();
                        },
                        child: Icon(
                          Icons.branding_watermark,size: 40,
                          color: Colors.white,
                        ))),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: value.nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Category ',
                  ),
                ),


                ElevatedButton(
                  onPressed: () {
                    value.addcategory(from, oldid);
                    value.getcategoryInfo();
                    value.clearField();
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(

                      const SnackBar(content: Text("Category added successfully ",style: TextStyle(color: Colors.black),),backgroundColor: Colors.yellow ),
                    );
                  },
                  child: Text("Save"),
                ),

              ],
            ),
          );
        }),
      ),

    );
  }
}
