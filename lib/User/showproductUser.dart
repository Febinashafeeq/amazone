import 'package:amazonui/User/shoppingPage.dart';
import 'package:amazonui/mainproviderClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowproductUser extends StatelessWidget {
  const ShowproductUser({super.key});

  @override
  Widget build(BuildContext context) {
    MainProvider provider = Provider.of<MainProvider>(context);

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        backgroundColor: Colors.teal.shade200,
        title: Container(
          width: width,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.only(top: 4),
                hintText: 'Search Amazon.in',
                hintStyle: const TextStyle(fontSize: 17),
                suffixIcon: InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const AmazonLens(),
                      //     ));
                    },
                    child: const Icon(Icons.document_scanner_outlined))),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Container(
                width: width,
                height: 40,
                color: Colors.orange[100],
                child: const Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Select a location to see product availbility",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 2000,
                child: Consumer<MainProvider>(builder: (context, value, child) {
                  return GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: value.productlist.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .85,
                        crossAxisSpacing: 1.0,
                        mainAxisSpacing: .20),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 200,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Colors.black12)),
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              width: 100,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ShoppingPage(
                                          image: value.productlist[index].photo,
                                          price: value.productlist[index].price,
                                          name: value.productlist[index].name,
                                        ),
                                      ));
                                },
                                child: Image.network(
                                  value.productlist[index].photo,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Text(value.productlist[index].name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),

                            Text(value.productlist[index].price,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                )),

                            const Text("Free delivery by Amazon",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal)),
                          ],
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
