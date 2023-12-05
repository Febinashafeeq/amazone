import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> Images = [
      "assets/primee.png",
      "assets/deal.png",
      "assets/deal.png",
      "assets/pd.png",
      "assets/pd.png",
      "assets/pd.png",
      "assets/pd.png",
      "assets/fasion.png",
      //"assets/fasion.png",
    ];
    List<String> Texts = [
      "Prime",
      "Deals and savings",
      "Deals and savings",
      "Mob and Electronic Devices",
      "Mob and Electronic Devices",
      "Mob and Electronic Devices",
      "Mob and Electronic Devices",
      "Fasion and Beauty"
      //"Fasion and Beauty"
    ];
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Container(
                height: 105,
                width: 340,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, top: 10, right: 4),
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.orangeAccent,
                                border: Border.all(color: Colors.grey)),
                            child: Image.asset(
                              ("assets/pay.png"),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text("Amazon pay"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 4.0,
                        top: 10,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.orange,
                                border: Border.all(color: Colors.grey)),
                            child: Image.asset(("assets/mntv.png")),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text("Amazon miniTV")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 500,
              child: GridView.builder(
                // scrollDirection: Axis.vertical,

                itemCount: Images.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 7.0,
                    mainAxisSpacing: 7.0),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 165,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.black26),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0, left: 12.0),
                        ),
                        Text(Texts[index].toString()),
                        Image.asset(
                          Images[index],
                          scale: 2,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
        backgroundColor: Colors.black,
        child: Icon(
          Icons.mic_none,
        ),
        onPressed: () {},
      ),
    );
  }
}
