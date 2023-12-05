import 'package:amazonui/Admin/addCarousel.dart';
import 'package:amazonui/mainproviderClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Carousel extends StatelessWidget {

  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

      ),
      body: Consumer<MainProvider>(builder: (context, value, child) {
        return value.carousellist.isEmpty
            ? Center(child: Text("List is empty"))
            : Container(
          // color: Colors.yellow[100],
          child: Center(
            child: ListView.builder(
              // scrollDirection: Axis.horizontal,
              itemCount: value.carousellist.length,
              itemBuilder: (context, index) {
                var item = value.carousellist[index];

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
                              value.deletecarousel(value.carousellist[index].id);
                              Navigator.of(context).pop();
                              value.getcarouselInfo();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Carousel deleted successfully ")),
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
                                          AddCarousel(from: "EDIT",oldid:value.carousellist[index].id ),
                                    ));
                                value.editcarousel(value.carousellist[index].id);



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

                        value.carousellist[index].Photo == "" ?
                        CircleAvatar(
                          radius: 40,
                          child:
                          Image.asset("assets/img.png"),
                        )
                            :
                        CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(value
                                .carousellist[index].Photo
                            )
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [


                            Text(" ${value.carousellist[index].id}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),

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
                builder: (context) => AddCarousel(from: "NEW", oldid: ""),
              ));

        },


      ),
    );
  }
}
