import 'package:amazonui/Admin/products.dart';
import 'package:amazonui/mainproviderClass.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'User/showproductUser.dart';

class AmazonhomeScreen extends StatelessWidget {
  const AmazonhomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    MainProvider provider = Provider.of<MainProvider>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan[100],
          title: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            //color: Colors.white,
            height: 40,
            width: 300,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Search Amazon.in",
                //labelText: "Search Amazon.in",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black)),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                suffixIcon: Icon(Icons.camera_alt_outlined),
              ),
            ),
          ),
          actions: [
            Icon(
              Icons.mic_none_sharp,
              color: Colors.black,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Consumer<MainProvider>(builder: (context, value, child) {
            return Column(children: [
              Container(
                color: Color(0xff42f5f2),
                child: Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Select a location to see product availability",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                        onTap: () {},
                        child: Icon(
                          (Icons.keyboard_arrow_down),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 70,
                  width: 500,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.categorylist.length,
                    itemBuilder: (context, index) {
                      var item = value.categorylist[index];

                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                value.getproductadmindata(
                                    value.categorylist[index].categoryid);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ShowproductUser(),
                                    ));
                              },
                              child: Column(
                                children: [
                                  Container(
                                      height: 40,
                                      child: Image.network(value
                                          .categorylist[index].Photo
                                          .toString())),

                                  // CircleAvatar(
                                  //     radius: 25,
                                  //     backgroundImage: NetworkImage(value
                                  //         .categorylist[index].Photo
                                  //         .toString())),
                                  Text(" ${value.categorylist[index].name}",
                                      style: TextStyle(
                                        fontSize: 10,
                                      )),
                                ],
                              ),
                            ),
                            // SizedBox(
                            //   width: 10,
                            // ),
                          ],
                        ),
                      );
                    },
                  )),
              Consumer<MainProvider>(builder: (context, value, child) {
                return Container(
                    height: 200,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Container(
                          child: CarouselSlider.builder(
                            itemCount: value.carousellist.length,
                            itemBuilder: (context, index, realIndex) {
                              final image = value.carousellist[index].Photo;
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                child: ClipRRect(
                                  child: Image.network(
                                    image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                                // clipBehavior: Clip.antiAliasWithSaveLayer,
                                height: 200,
                                autoPlay: true,
                                // pageSnapping: true,
                                enlargeStrategy:
                                    CenterPageEnlargeStrategy.height,
                                enlargeCenterPage: true,
                                // autoPlayInterval: const Duration(seconds: 1),
                                onPageChanged: (index, reason) {
                                  value.activeIndex(index);
                                }),
                          ),
                        ),
                        Positioned(
                            top: 180,
                            left: 130,
                            child: buildIndiCator(value.carousellist.length,
                                context, value.Activeindex))
                      ],
                    ));
              }),
              Consumer<MainProvider>(builder: (context, value, child) {
                return SizedBox(
                  height: 180,
                  child: ListView.builder(
                      itemCount: value.showimage.length,
                      padding: EdgeInsets.all(8),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          height: 120,
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                value.showtext[index],
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                              Image.asset(value.showimage[index],
                                  fit: BoxFit.fill),
                            ],
                          ),
                        );
                      }),
                );
              }),
              Consumer<MainProvider>(builder: (context, value2, child) {
                return Container(
                  height:230,
                  width: width,
                  // color: Colors.red,
                  child: Column(
                    children: [
                      const Text(
                          "Starting ₹166 | Deals on fashion,beauty,kitchen & more ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      value2.dealsImage != ""
                          ? SizedBox(
                              width: 160,
                              height: 160,
                              child: Image.asset(
                                value2.dealsImage,
                                fit: BoxFit.fill,
                              ))
                          : Image.asset("assets/lap.png")
                    ],
                  ),
                );
              }),
              Consumer<MainProvider>(builder: (context, value2, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        value2.dealsSelection("assets/lap.png");
                      },
                      child: Container(
                        height: 90,
                        width: 80,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/lap.png"),
                          ),
                          border: Border.all(color: Colors.black12, width: 2),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        value2.dealsSelection("assets/mask.png");
                      },
                      child: Container(
                        height: 90,
                        width: 80,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage("assets/mask.png"),
                            ),
                            border:
                                Border.all(color: Colors.black12, width: 2)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        value2.dealsSelection("assets/mob.png");
                      },
                      child: Container(
                        height: 90,
                        width: 80,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage("assets/mob.png"),
                            ),
                            border:
                                Border.all(color: Colors.black12, width: 2)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        value2.dealsSelection("assets/fasion.png");
                      },
                      child: Container(
                        height: 90,
                        width: 80,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage("assets/fasion.png"),
                            ),
                            border:
                                Border.all(color: Colors.black12, width: 2)),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                );
              }),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 4,
                color: Colors.black12,
              ),
              SizedBox(
                height: 450,
                child: Consumer<MainProvider>(builder: (context, value, child) {
                  return Expanded(
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: value.showimage.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .85,
                          crossAxisSpacing: 1.0,
                          mainAxisSpacing: .20),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 3, color: Colors.black12)),
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                child: Image.asset(
                                  value.showimage[index],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
            ]);
            // floatingActionButton:
            // FloatingActionButton(
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(45)),
            //   backgroundColor: Colors.black,
            //   child: Icon(
            //     Icons.mic_none,
            //   ),
            //   onPressed: () {},
            // );
          }),
        ));
  }

  buildIndiCator(int count, BuildContext context, int activeindex) {
    // print(activeIndex.toString()+"dpddoopf");
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: AnimatedSmoothIndicator(
          activeIndex: activeindex,
          count: count,
          effect: const JumpingDotEffect(
              dotWidth: 7,
              dotHeight: 7,
              activeDotColor: Colors.teal,
              dotColor: Color(0xffaba17c)),
        ),
      ),
    );
  }
}
