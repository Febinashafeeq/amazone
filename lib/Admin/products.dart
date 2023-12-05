import 'package:amazonui/Admin/addproductScreen.dart';
import 'package:amazonui/mainproviderClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    MainProvider provider = Provider.of<MainProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("# Products"),
      ),
      body: Container(
        // color: Colors.yellow[100],
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Consumer<MainProvider>(builder: (context, value, child) {
              return value.productlist.isEmpty
                  ? CircularProgressIndicator()
                  : ListView.builder(

                      itemCount: value.productlist.length,
                      itemBuilder: (context, index) {
                        var item = value.productlist[index];

                        return InkWell(
                          onLongPress: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("Alert !!!!"),
                                content: const Text(
                                    "Do you want to  delete? or edit"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      provider.deleteproduct(
                                          value.productlist[index].productid);
                                      Navigator.of(context).pop();
                                      provider.getproductInfo();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Product deleted successfully ")),
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
                                                  AddproductScreen(
                                                      from: "EDIT",
                                                      oldid: value
                                                          .productlist[index]
                                                          .productid),
                                            ));
                                        provider.editproduct(
                                            value.productlist[index].productid);
                                      },
                                      child: Container(
                                        child: Text("Edit"),
                                      ))
                                ],
                              ),
                            );
                          },
                          child: Container(
                            height: 100,
                            // width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white30,
                                shape: BoxShape.rectangle,
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                value.productlist[index].photo == ""
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: CircleAvatar(
                                          radius: 40,
                                          child: Image.asset("assets/img.png"),
                                        ),
                                      )
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: CircleAvatar(
                                            radius: 35,
                                            backgroundImage: NetworkImage(value
                                                .productlist[index].photo)),
                                      ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(" ${value.productlist[index].name}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      " ${value.productlist[index].discription}",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      "₹ ${value.productlist[index].price}",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.redAccent),
                                    ),
                                    Text(
                                      "ProId: ${value.productlist[index].productid}",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      "CatId: ${value.productlist[index].categoryid}",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
            }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddproductScreen(from: "NEW", oldid: ""),
              ));
        },
      ),
    );
  }
}
