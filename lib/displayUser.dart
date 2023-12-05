import 'package:amazonui/mainproviderClass.dart';
import 'package:amazonui/User/userLogin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisplayScreen extends StatelessWidget {
  const DisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_rounded)),
        title: Text("Display user Details"),
      ),
        body: Consumer<MainProvider>(builder: (context, value, child) {
          return value.newList.isEmpty
              ? Center(child: Text("List is empty"))
              : Container(
            color: Colors.yellow[100],
            child: ListView.builder(
              itemCount: value.newList.length,
              itemBuilder: (context, index) {
                var item = value.newList[index];

                return InkWell(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text("Alert !!!!"),
                        content:
                        const Text("Do you want to edit or delete?"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UserLogin(from: "EDIT",oldid:value.newList[index].id ),
                                  ));
                              value.editInfo(value.newList[index].id);
                              // Navigator.of(ctx).pop();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              child: const Text("Edit"),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              value.delete(value.newList[index].id);
                              Navigator.of(ctx).pop();
                              value.getInfo();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              child: const Text("Delete"),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.black12)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        value.newList[index].Photo == ""
                            ? CircleAvatar(
                          radius: 25,
                          child:
                          Image.asset("assets/img.png"),
                        )
                            : InkWell(onTap: (){
                          value.showBottomSheet(context);
                        },
                          child: CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(value
                                  .newList[index].Photo
                                  .toString())),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Name :${value.newList[index].name}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                  "Password :${value.newList[index].Password}"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 28.0),
                              child:
                              Text("Id:${value.newList[index].id}"),
                            ),Padding(
                              padding: const EdgeInsets.only(left: 28.0),
                              child:
                              Text("Phone:${value.newList[index].phone}"),
                            ),
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
