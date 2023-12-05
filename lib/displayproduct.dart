import 'package:amazonui/mainproviderClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Admin/addproductScreen.dart';

class DisplayProduct extends StatelessWidget {
  const DisplayProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

        body: Consumer<MainProvider>(builder: (context, value, child) {
          return value.productlist.isEmpty
              ? Center(child: Text("List is empty"))
              : Container(
            color: Colors.yellow[100],
            child: ListView.builder(
               scrollDirection: Axis.horizontal,
              itemCount: value.productlist.length,
              itemBuilder: (context, index) {
                var item = value.productlist[index];

                return InkWell(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Alert !!!!"),
                        content:
                        const Text("Do you want to  delete?"),
                        actions: <Widget>[

                          TextButton(
                            onPressed: () {
                              value.deleteproduct(value.productlist[index].productid);
                              Navigator.of(context).pop();
                              value.getproductInfo();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Product deleted successfully ")),
                              );

                            },
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              child: const Text("Delete"),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AddproductScreen(from: "EDIT",oldid:value.productlist[index].productid ),
                                    ));
                                value.editproduct(value.productlist[index].productid);



                              }, child: Container(
                            child: Text("Edit"),
                          ))
                        ],
                      ),
                    );
                  },
                  child: Container(

                    height: 160,
                     // width: 50,
                    decoration: BoxDecoration(color: Colors.white30,
                        shape: BoxShape.rectangle,
                        ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        value.productlist[index].photo == "" ?
                            CircleAvatar(
                          radius: 40,
                          child:
                          Image.asset("assets/img.png"),
                        )
                            :
                            CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(value
                                .productlist[index].photo
                            )
                            ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(" ${value.productlist[index].name}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,color: Colors.red)),

                            Text(" ${value.productlist[index].discription}",
                              style: TextStyle(
                                fontSize: 15,
                              ),),
                            Text("₹ ${value.productlist[index].price}",
                              style: TextStyle(
                                fontSize: 15,color: Colors.yellow
                              ),),Text("₹ ${value.productlist[index].productid}",
                              style: TextStyle(
                                fontSize: 15,color: Colors.yellow
                              ),),

                          ],
                        ),
                        
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }));
  }
}
