import 'dart:io';
import 'package:amazonui/Admin/products.dart';
import 'package:amazonui/modelCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../displayproduct.dart';
import '../mainproviderClass.dart';

class AddproductScreen extends StatelessWidget {
  String from;
  String oldid;
  AddproductScreen({super.key, required this.from, required this.oldid});

  @override
  Widget build(BuildContext context) {
    MainProvider provider = Provider.of<MainProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[100],
        iconTheme: IconThemeData(color: Colors.black),
      ),
         body: SingleChildScrollView(
           child: Column(
            children: [
              provider.fileimagepro != null
                  ? CircleAvatar(
                      radius: 45,
                      backgroundImage: FileImage(provider.fileimagepro! as File),
                      child: InkWell(
                        onTap: () {
                          provider.getImageGallerypro();
                        },
                      ))
                  : CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.cyan,
                      child: InkWell(
                          onTap: () {
                            provider.getImageGallerypro();
                          },
                          child: Icon(
                            Icons.branding_watermark,size: 40,
                            color: Colors.white,
                          ))),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: provider.pronameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Product Name',
                ),
              ),
              TextFormField(
                controller: provider.discripController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Add Description',
                ),
              ),
              TextFormField(
                controller: provider.priceController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Price',
                ),
              ),
              SizedBox(
                width: 300,
                child: Autocomplete<CategoryModel>(
                  optionsBuilder:
                      (TextEditingValue textEditingValue) {
                    return provider.categorylist
                        .where((CategoryModel item) =>
                        item.name
                            .toLowerCase()
                            .contains(
                            textEditingValue.text.toLowerCase()))
                        .toList();
                  },
                  displayStringForOption: (CategoryModel option) =>
                  option.name,
                  fieldViewBuilder: (BuildContext context,
                      TextEditingController
                      fieldTextEditingController,
                      FocusNode fieldFocusNode,
                      VoidCallback onFieldSubmitted) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      fieldTextEditingController.text =
                      provider.categoryController.text;
                    });

                    return SizedBox(
                      child: TextFormField(
                        maxLines: null,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 14),
                          hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontFamily: "PoppinsMedium",
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                          fillColor: Colors.white,
                          filled: true,
                          border: const UnderlineInputBorder(
                            // borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                width: 2, color: Colors.grey),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            // borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 2)),
                          enabledBorder: const UnderlineInputBorder(
                            // borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                width: 2, color: Colors.grey),
                          ),
                          hintText: "Select a category",
                          suffixIcon: const Icon(
                            Icons.keyboard_arrow_down_sharp,
                            size: 25,
                            color: Colors.black38,
                          ),
                        ),

                        onChanged: (txt) {
    provider.categoryController.text = txt;
                        },
                        controller: fieldTextEditingController,
                        focusNode: fieldFocusNode,
                      ),
                    );
                  },
                  onSelected: (CategoryModel selection) {
    provider.categoryController.text = selection.name;
    provider.categoryid = selection.categoryid;
                  },
                  optionsViewBuilder: (BuildContext context,
                      AutocompleteOnSelected<CategoryModel> onSelected,
                      Iterable<CategoryModel> options) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Material(
                        child: Container(
                          width: 200,
                          height: 300,
                          color: Colors.white,
                          child: ListView.builder(
                            padding: const EdgeInsets.all(10.0),
                            itemCount: options.length,
                            itemBuilder:
                                (BuildContext context, int index) {
                              final CategoryModel option =
                              options.elementAt(index);

                              return GestureDetector(
                                onTap: () {
                                  onSelected(option);
                                },
                                child: Container(
                                  color: Colors.white,
                                  height: 50,
                                  width: 200,
                                  child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(option.name,
                                            style: const TextStyle(
                                                fontWeight:
                                                FontWeight.bold)),
                                        const SizedBox(height: 10)
                                      ]),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                 ),


              ),
              ElevatedButton(
                onPressed: () {
                  provider.addproduct(from, oldid);
                  provider.getproductInfo();
                  provider.clearFieldpro();
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(

                    const SnackBar(content: Text("Product added successfully ",style: TextStyle(color: Colors.black),),backgroundColor: Colors.yellow ),
                  );
                },
                child: Text("Save"),
              ),

            ],),
         )
        );
      }

  }

