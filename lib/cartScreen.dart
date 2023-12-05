// import 'package:amazonui/mainproviderClass.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10), color: Colors.white),
//           //color: Colors.white,
//           height: 40,
//           width: 300,
//           child: TextFormField(
//             decoration: InputDecoration(
//               hintText: "Search Amazon.in",
//               //labelText: "Search Amazon.in",
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: const BorderSide(color: Colors.black),
//               ),
//               focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: const BorderSide(color: Colors.black)),
//               prefixIcon: const Icon(
//                 Icons.search,
//                 color: Colors.black,
//               ),
//               suffixIcon: Icon(Icons.camera_alt_outlined),
//             ),
//           ),
//         ),
//         actions: [
//           Icon(
//             Icons.mic_none_sharp,
//             color: Colors.black,
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 45,
//               width: 400,
//               color: Colors.lightBlue,
//               child: Row(
//                 children: [
//                   SizedBox(
//                     width: 5,
//                   ),
//                   Icon(Icons.location_on_outlined),
//                   SizedBox(
//                     width: 4,
//                   ),
//                   Text(
//                     "Deliver to Shafeeq-Perinthalmanna...",
//                     style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
//                   ),
//                   Icon(
//                     (Icons.keyboard_arrow_down),
//                   ),
//                 ],
//               ),
//             ),
//
//             // Padding(
//             //   padding: const EdgeInsets.only(left: 8.0),
//             //   child: Row(
//             //     children: [
//             //       Container(
//             //         height: 110,
//             //         width: 110,
//             //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(200),color: Colors.black12),
//             //         child: Image.asset(("assets/cartt.png"),scale: 2.5,),
//             //       ),
//             //       SizedBox(
//             //         width: 20,
//             //       ),
//             //       Column(
//             //         children: [
//             //           Text("Your Amazon Cart is empty"),
//             //           SizedBox(
//             //             height: 11,
//             //           ),
//             //           Text("Pick up where you left off",style: TextStyle(color: Colors.green),)
//             //         ],
//             //       ),
//             //
//             //     ],
//             //   ),
//             // ),
//             // SizedBox(
//             //   height: 20,
//             // ),
//             // Container(
//             //   height: 80,
//             //   width: 370,
//             //   color: Colors.orange[100],
//             //   child: Row(
//             //     crossAxisAlignment: CrossAxisAlignment.start,
//             //     children: [
//             //       Center(
//             //           child: Padding(
//             //         padding: const EdgeInsets.only(left: 10.0),
//             //         child: Image.asset(
//             //           "assets/cal.png",
//             //           scale: 4,
//             //         ),
//             //       )),
//             //       SizedBox(
//             //         width: 35,
//             //       ),
//             //       Column(
//             //         children: [
//             //           Text("Amazon Pay Later | Get instant "),
//             //           Text("credit up to 10,000"),
//             //           Text(
//             //             "Activate & get rewards of 600>",
//             //             style: TextStyle(fontWeight: FontWeight.bold),
//             //           )
//             //         ],
//             //       ),
//             //     ],
//             //   ),
//             // ),
//             // SizedBox(
//             //   height: 15,
//             // ),
//             Text(
//               "Subtotal",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             Consumer<MainProvider>(builder: (context, value, child) {
//               return SizedBox(
//                 width: 2500,
//                 height: 220,
//                 child:ListView.builder(
//                     itemCount: value.cartlist.length,
//                     itemBuilder: (context, index) {
//                       return Card(
//                         child: Column(
//                           children: [
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   height: 130,
//                                   width: 130,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     border: Border.all(
//                                       color: Colors.black26,
//                                     ),
//                                   ),
//                                   child: Image.network(value.cartlist[index].photo,
//                                       fit: BoxFit.fill),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Column(
//                                   children: [
//                                     Text(
//                                       value.cartlist[index].name,
//                                       style: TextStyle(fontWeight: FontWeight.bold),
//                                     ),
//                                     SizedBox(
//                                       height: 4,
//                                     ),
//                                     Row(
//                                       children: [
//                                         Text("₹"),
//                                         Text(value.cartlist[index].price),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 25,
//                                     ),
//                                     Container(
//                                       height: 30,
//                                       width: 100,
//                                       color: Colors.yellow,
//                                       child: Center(child: Text("Add to cart")),
//                                     )
//                                   ],
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       );
//                     }),
//                 ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: value.cartlist.length,
//                     itemBuilder: (context, index) {
//                       // var item = value.cartlist[index];
//                       return Container(
//                         height: 130,
//                         // width: 100,
//                         color: Colors.white,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               height: 100,
//                               child: Image.network(value.cartlist[index].photo,
//                                   fit: BoxFit.fill),
//                             ),
//                             Text(
//                               value.cartlist[index].name,
//                               style: TextStyle(color: Colors.cyan),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 8.0),
//                               child: Row(
//                                 children: [
//                                   Icon(
//                                     Icons.star,
//                                     color: Colors.orangeAccent,
//                                     size: 19,
//                                   ),
//                                   Icon(
//                                     Icons.star,
//                                     color: Colors.orangeAccent,
//                                     size: 19,
//                                   ),
//                                   Icon(
//                                     Icons.star,
//                                     color: Colors.orangeAccent,
//                                     size: 19,
//                                   ),
//                                   Icon(
//                                     Icons.star,
//                                     color: Colors.orangeAccent,
//                                     size: 19,
//                                   ),
//                                   // Icon(Icons.star,color: Colors.orangeAccent,size: 19,),
//                                   Icon(
//                                     Icons.star_outline,
//                                     color: Colors.orangeAccent,
//                                     size: 18,
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 8.0),
//                               child: Text(
//                                 value.cartlist[index].price,
//                                 style: TextStyle(color: Colors.red),
//                               ),
//                             ),
//                             Consumer<MainProvider>(
//                                 builder: (context, value, child) {
//                               return Padding(
//                                 padding: const EdgeInsets.only(top: 8.0),
//                                 child: Container(
//                                     height: 27,
//                                     width: 90,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(10),
//                                         color: Colors.grey),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         InkWell(
//                                             onTap: () {
//                                               // value.removeCount();
//                                             },
//                                             child: Icon(Icons.remove)),
//                                         Container(
//                                           height: 30,
//                                           width: 23,
//                                           decoration: BoxDecoration(
//                                               shape: BoxShape.rectangle,
//                                               color: Colors.white,
//                                               border: Border.all()),
//                                           // child: Center(child: Text(value.cartlist[index].quantity.toString()))
//                                         ),
//                                         InkWell(
//                                             onTap: () {
//                                               // value.addCount(
//                                               //     value.cartlist[index].cartid);
//                                             },
//                                             child: Icon(Icons.add)),
//                                       ],
//                                     )),
//                               );
//                             }),
//                           ],
//                         ),
//                       );
//
//                       // Container(
//                       //   height: 90,
//                       //   width: 80,
//                       //   decoration: BoxDecoration(
//                       //     borderRadius: BorderRadius.circular(10),
//                       //     border: Border.all(
//                       //       color: Colors.black26,
//                       //     ),
//                       //   ),
//                       //   child: Image.network(value.cartlist[index].photo,
//                       //       fit: BoxFit.fill),
//                       // );
//                     }),
//               );
//             }),
//             Container(
//               height: 2,
//               color: Colors.grey,
//             ),
//
//             SizedBox(
//               width: 500,
//               child: Container(
//                 height: 330,
//                 width: 200,
//                 color: Colors.white,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(18.0),
//                           child: Text(
//                             "Recommendations for all products:",
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 23,
//                         ),
//                         Icon(Icons.more_vert)
//                       ],
//                     ),
//                     SizedBox(
//                       height: 250,
//                       width: 500,
//                       child: Container(
//                         child: ListView(
//                           scrollDirection: Axis.horizontal,
//                           children: [
//                             Row(
//                               children: [
//                                 Container(
//                                   height: 200,
//                                   width: 100,
//                                   color: Colors.white,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Image.asset("assets/hbag.png"),
//                                       Text(
//                                         "Hand bag women ......",
//                                         style: TextStyle(color: Colors.cyan),
//                                       ),
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           // Icon(Icons.star,color: Colors.orangeAccent,size: 19,),
//                                           Icon(
//                                             Icons.star_outline,
//                                             color: Colors.orangeAccent,
//                                             size: 18,
//                                           )
//                                         ],
//                                       ),
//                                       Text(
//                                         "₹250.00",
//                                         style: TextStyle(color: Colors.red),
//                                       ),
//                                       Container(
//                                         height: 31,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                           color: Colors.yellow,
//                                           border:
//                                               Border.all(color: Colors.white),
//                                         ),
//                                         child:
//                                             Center(child: Text("Add to Cart")),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Container(
//                                   height: 200,
//                                   width: 100,
//                                   color: Colors.white,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Image.asset("assets/mask.png"),
//                                       Text(
//                                         "Mask unisex ......",
//                                         style: TextStyle(color: Colors.cyan),
//                                       ),
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star_outline,
//                                             color: Colors.orangeAccent,
//                                             size: 18,
//                                           ),
//                                           Icon(
//                                             Icons.star_outline,
//                                             color: Colors.orangeAccent,
//                                             size: 18,
//                                           )
//                                         ],
//                                       ),
//                                       Text(
//                                         "₹150.00",
//                                         style: TextStyle(color: Colors.red),
//                                       ),
//                                       Container(
//                                         height: 31,
//                                         width: 100,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                           color: Colors.yellow,
//                                           border:
//                                               Border.all(color: Colors.white),
//                                         ),
//                                         child:
//                                             Center(child: Text("Add to Cart")),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Container(
//                                   height: 200,
//                                   width: 100,
//                                   color: Colors.white,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Image.asset("assets/lap.png"),
//                                       Text(
//                                         "Lenovo Laptop i5 11 th generation ......",
//                                         style: TextStyle(color: Colors.cyan),
//                                       ),
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           // Icon(Icons.star,color: Colors.orangeAccent,size: 19,),
//                                           Icon(
//                                             Icons.star_outline,
//                                             color: Colors.orangeAccent,
//                                             size: 18,
//                                           )
//                                         ],
//                                       ),
//                                       Text(
//                                         "₹54350.00",
//                                         style: TextStyle(color: Colors.red),
//                                       ),
//                                       Container(
//                                         height: 31,
//                                         // width: 80,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                           color: Colors.yellow,
//                                           border:
//                                               Border.all(color: Colors.white),
//                                         ),
//
//                                         child:
//                                             Center(child: Text("Add to Cart")),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Container(
//                                   height: 200,
//                                   width: 100,
//                                   color: Colors.white,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Image.asset("assets/pd.png"),
//                                       Text(
//                                         "SandDisk Pendriive ......",
//                                         style: TextStyle(color: Colors.cyan),
//                                       ),
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           // Icon(Icons.star,color: Colors.orangeAccent,size: 19,),
//                                           Icon(
//                                             Icons.star_outline,
//                                             color: Colors.orangeAccent,
//                                             size: 18,
//                                           )
//                                         ],
//                                       ),
//                                       Text(
//                                         "₹950.00",
//                                         style: TextStyle(color: Colors.red),
//                                       ),
//                                       Container(
//                                         height: 31,
//                                         width: 80,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                           color: Colors.yellow,
//                                           border:
//                                               Border.all(color: Colors.white),
//                                         ),
//                                         child:
//                                             Center(child: Text("Add to Cart")),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   height: 200,
//                                   width: 100,
//                                   color: Colors.white,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Image.asset("assets/hbag.png"),
//                                       Text(
//                                         "Hand bag women ......",
//                                         style: TextStyle(color: Colors.cyan),
//                                       ),
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           // Icon(Icons.star,color: Colors.orangeAccent,size: 19,),
//                                           Icon(
//                                             Icons.star_outline,
//                                             color: Colors.orangeAccent,
//                                             size: 18,
//                                           )
//                                         ],
//                                       ),
//                                       Text(
//                                         "₹750.00",
//                                         style: TextStyle(color: Colors.red),
//                                       ),
//                                       Container(
//                                         height: 30,
//                                         width: 80,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                           color: Colors.yellow,
//                                           border:
//                                               Border.all(color: Colors.white),
//                                         ),
//                                         child:
//                                             Center(child: Text("Add to Cart")),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   height: 200,
//                                   width: 100,
//                                   color: Colors.white,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Image.asset("assets/hbag.png"),
//                                       Text(
//                                         "Hand bag women ......",
//                                         style: TextStyle(color: Colors.cyan),
//                                       ),
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           // Icon(Icons.star,color: Colors.orangeAccent,size: 19,),
//                                           Icon(
//                                             Icons.star_outline,
//                                             color: Colors.orangeAccent,
//                                             size: 18,
//                                           )
//                                         ],
//                                       ),
//                                       Text(
//                                         "₹750.00",
//                                         style: TextStyle(color: Colors.red),
//                                       ),
//                                       Container(
//                                         height: 30,
//                                         width: 80,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                           color: Colors.yellow,
//                                           border:
//                                               Border.all(color: Colors.white),
//                                         ),
//                                         child:
//                                             Center(child: Text("Add to Cart")),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 500,
//               child: Container(
//                 height: 300,
//                 width: 200,
//                 color: Colors.white,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             "Deals on frequently repurchased items",
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 23,
//                         ),
//                         Icon(Icons.more_vert)
//                       ],
//                     ),
//                     SizedBox(
//                       height: 200,
//                       width: 500,
//                       child: Container(
//                         child: ListView(
//                           scrollDirection: Axis.horizontal,
//                           children: [
//                             Row(
//                               children: [
//                                 Container(
//                                   height: 200,
//                                   width: 100,
//                                   color: Colors.white,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Image.asset("assets/hbag.png"),
//                                       Text(
//                                         "Hand bag women ......",
//                                         style: TextStyle(color: Colors.cyan),
//                                       ),
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           // Icon(Icons.star,color: Colors.orangeAccent,size: 19,),
//                                           Icon(
//                                             Icons.star_outline,
//                                             color: Colors.orangeAccent,
//                                             size: 18,
//                                           )
//                                         ],
//                                       ),
//                                       Text(
//                                         "₹250.00",
//                                         style: TextStyle(color: Colors.red),
//                                       ),
//                                       Container(
//                                         height: 31,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                           color: Colors.yellow,
//                                           border:
//                                               Border.all(color: Colors.white),
//                                         ),
//                                         child:
//                                             Center(child: Text("Add to Cart")),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Container(
//                                   height: 200,
//                                   width: 100,
//                                   color: Colors.white,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Image.asset("assets/mask.png"),
//                                       Text(
//                                         "Mask unisex ......",
//                                         style: TextStyle(color: Colors.cyan),
//                                       ),
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star_outline,
//                                             color: Colors.orangeAccent,
//                                             size: 18,
//                                           ),
//                                           Icon(
//                                             Icons.star_outline,
//                                             color: Colors.orangeAccent,
//                                             size: 18,
//                                           )
//                                         ],
//                                       ),
//                                       Text(
//                                         "₹150.00",
//                                         style: TextStyle(color: Colors.red),
//                                       ),
//                                       Container(
//                                         height: 31,
//                                         width: 100,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                           color: Colors.yellow,
//                                           border:
//                                               Border.all(color: Colors.white),
//                                         ),
//                                         child:
//                                             Center(child: Text("Add to Cart")),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Container(
//                                   height: 200,
//                                   width: 100,
//                                   color: Colors.white,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Image.asset("assets/lap.png"),
//                                       Text(
//                                         "Lenovo Laptop i5 11 th generation ......",
//                                         style: TextStyle(color: Colors.cyan),
//                                       ),
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           // Icon(Icons.star,color: Colors.orangeAccent,size: 19,),
//                                           Icon(
//                                             Icons.star_outline,
//                                             color: Colors.orangeAccent,
//                                             size: 18,
//                                           )
//                                         ],
//                                       ),
//                                       Text(
//                                         "₹54350.00",
//                                         style: TextStyle(color: Colors.red),
//                                       ),
//                                       Container(
//                                         height: 31,
//                                         // width: 80,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                           color: Colors.yellow,
//                                           border:
//                                               Border.all(color: Colors.white),
//                                         ),
//
//                                         child:
//                                             Center(child: Text("Add to Cart")),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Container(
//                                   height: 200,
//                                   width: 100,
//                                   color: Colors.white,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Image.asset("assets/pd.png"),
//                                       Text(
//                                         "SandDisk Pendriive ......",
//                                         style: TextStyle(color: Colors.cyan),
//                                       ),
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           // Icon(Icons.star,color: Colors.orangeAccent,size: 19,),
//                                           Icon(
//                                             Icons.star_outline,
//                                             color: Colors.orangeAccent,
//                                             size: 18,
//                                           )
//                                         ],
//                                       ),
//                                       Text(
//                                         "₹950.00",
//                                         style: TextStyle(color: Colors.red),
//                                       ),
//                                       Container(
//                                         height: 31,
//                                         width: 80,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                           color: Colors.yellow,
//                                           border:
//                                               Border.all(color: Colors.white),
//                                         ),
//                                         child:
//                                             Center(child: Text("Add to Cart")),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   height: 200,
//                                   width: 100,
//                                   color: Colors.white,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Image.asset("assets/hbag.png"),
//                                       Text(
//                                         "Hand bag women ......",
//                                         style: TextStyle(color: Colors.cyan),
//                                       ),
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           // Icon(Icons.star,color: Colors.orangeAccent,size: 19,),
//                                           Icon(
//                                             Icons.star_outline,
//                                             color: Colors.orangeAccent,
//                                             size: 18,
//                                           )
//                                         ],
//                                       ),
//                                       Text(
//                                         "₹750.00",
//                                         style: TextStyle(color: Colors.red),
//                                       ),
//                                       Container(
//                                         height: 30,
//                                         width: 80,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                           color: Colors.yellow,
//                                           border:
//                                               Border.all(color: Colors.white),
//                                         ),
//                                         child:
//                                             Center(child: Text("Add to Cart")),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   height: 200,
//                                   width: 100,
//                                   color: Colors.white,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Image.asset("assets/hbag.png"),
//                                       Text(
//                                         "Hand bag women ......",
//                                         style: TextStyle(color: Colors.cyan),
//                                       ),
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           Icon(
//                                             Icons.star,
//                                             color: Colors.orangeAccent,
//                                             size: 19,
//                                           ),
//                                           // Icon(Icons.star,color: Colors.orangeAccent,size: 19,),
//                                           Icon(
//                                             Icons.star_outline,
//                                             color: Colors.orangeAccent,
//                                             size: 18,
//                                           )
//                                         ],
//                                       ),
//                                       Text(
//                                         "₹750.00",
//                                         style: TextStyle(color: Colors.red),
//                                       ),
//                                       Container(
//                                         height: 30,
//                                         width: 80,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                           color: Colors.yellow,
//                                           border:
//                                               Border.all(color: Colors.white),
//                                         ),
//                                         child:
//                                             Center(child: Text("Add to Cart")),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
//         backgroundColor: Colors.black,
//         child: Icon(
//           Icons.mic_none,
//         ),
//         onPressed: () {},
//       ),
//     );
//   }
// }
