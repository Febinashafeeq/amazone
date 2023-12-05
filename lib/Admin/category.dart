import 'package:amazonui/Admin/addCategory.dart';
import 'package:amazonui/mainproviderClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Category extends StatelessWidget {

  const Category({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

      ),
      body: Consumer<MainProvider>(builder: (context, value, child) {
        return value.categorylist.isEmpty
             ? CircularProgressIndicator()
        // Center(child: Text("List is empty"))
            : Container(
          child: Center(
            child: ListView.builder(
              // scrollDirection: Axis.horizontal,
              itemCount: value.categorylist.length,
              itemBuilder: (context, index) {
                var item = value.categorylist[index];

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
                              value.deletecategory(value.categorylist[index].categoryid);
                              Navigator.of(context).pop();
                              value.getcategoryInfo();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Category deleted successfully ")),
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
                                          AddCategory(from: "EDIT",oldid:value.categorylist[index].categoryid ),
                                    ));
                                value.editcategory(value.categorylist[index].categoryid);



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

                        value.categorylist[index].Photo == "" ?
                        CircleAvatar(
                          radius: 40,
                          child:
                          Image.asset("assets/img.png"),
                        )
                            :
                        CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(value
                                .categorylist[index].Photo
                            )
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(" ${value.categorylist[index].name}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            Text(" ${value.categorylist[index].categoryid}",
                                style: TextStyle(
                                    fontSize: 15,
                                )),

                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      }),
      floatingActionButton:  FloatingActionButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(45)
        ),
        backgroundColor: Colors.black,
        child: Icon(Icons.add,),
        onPressed: () {

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddCategory(from: "NEW", oldid: ""),
              ));

        },


      ),
    );
  }
}
