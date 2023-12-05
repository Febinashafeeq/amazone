import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../mainproviderClass.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),),
          //color: Colors.white,
          height: 40,
          width: 300,
          child: Text("Wishlist",style: TextStyle(fontSize: 25),),
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Consumer<MainProvider>(builder: (context, value, child) {
              return SizedBox(
                width: 2500,
                height: 1200,
                child:
                ListView.builder(
                     scrollDirection: Axis.vertical,
                    itemCount: value.wishlist.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(color: Colors.grey)),
                                height: 100,
                                width:130,
                                child: Center(
                                  child: Image.network(value.wishlist[index].photo,
                                      fit: BoxFit.fill),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                value.wishlist[index].name,
                                style: TextStyle(color: Colors.cyan,fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            Center(
                              child: Text(
                                value.wishlist[index].price,
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 18.0),
                              child: Row(crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color:Colors.yellow  ),
                                      height: 35,
                                      width: 100,
                                      child: Center(child: Text("Add to cart"))),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 68.0),
                                    child: Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color:Colors.yellow  ),
                                        height: 35,
                                        width: 100,
                                        child: Center(child: Text("Remove"))),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              );
            }),
          ],
        ),
      ),
    );
  }
}
