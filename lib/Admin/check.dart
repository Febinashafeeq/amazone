// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../constants/my_colors.dart';
// import '../constants/my_text.dart';
//
// class CoordinatorsScreen extends StatelessWidget {
//   String from,uid,assembly,panchayath,club;
//   CoordinatorsScreen({super.key,required this.from,required this.uid,required this.assembly,required this.panchayath,required this.club});
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body:SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 45,
//             ),
//             Padding(
//               padding:
//               const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                     child: Image.asset(
//                       "assets/logoimg.png",
//                       scale: 3.5,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 15.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(17),
//                         color: white,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Color(0x26000000),
//                             blurRadius: 6.0, // soften the shadow
//                             spreadRadius: 2.0, //extend the shadow
//                           ),
//                         ],
//                       ),
//                       width: MediaQuery.of(context).size.width * .60,
//                       height: 50,
//                       child: TextFormField(
//                         decoration: InputDecoration(
//                           // filled: true,
//                           labelText: "Search coordinators",
//                           labelStyle: TextStyle(
//                               fontSize: 13.64, fontFamily: "Montserrat"),
//                           fillColor: Colors.white.withOpacity(.30),
//                           suffixIcon: Icon(Icons.search),
//
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(17),
//                               borderSide: BorderSide.none),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                   horizontal: 18.0, vertical: 18.0),
//               child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Text(
//                     "Coordinators",
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w700,
//                         fontFamily: "Montserrat"),
//                   ),
//
//                   SizedBox(
//                     width: 40,
//                   ),
//                   Container(
//                     height: 32,
//                     width: 107,
//                     decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [myblue3, myblue2, myblue1],
//                           begin: Alignment.topCenter,
//                         ),
//                         borderRadius: BorderRadius.circular(12.78)),
//                     child: Center(
//                         child: Text(
//                           "Add Coordinator",
//                           style: TextStyle(
//                               fontSize: 11.3,
//                               fontFamily: "Montserrat",
//                               fontWeight: FontWeight.w600,
//                               color: white),
//                         )),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: height,
//               child: ListView.builder(
//                 itemCount: 10,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 20.0, vertical: 5.0),
//                     child: Container(
//                       height: 130,
//                       width: width,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15.8),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Color(0x26000000),
//                             blurRadius: 6.0, // soften the shadow
//                             spreadRadius: 2.0, //extend the shadow
//                           ),
//                         ],
//                       ),
//                       child: Container(
//                         width: 200,
//                         child: Row(
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 10.0, vertical: 18.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Salmanul Faris",
//                                     style:
//                                     TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w700,
//                                         fontFamily: "Montserrat"),
//                                   ),
//                                   SizedBox(
//                                     height: 5.0,
//                                   ),
//                                   Text(
//                                       "Teacher",
//                                       style: myStyle1
//                                   ),
//                                   Text(
//                                       "Membership ID: 167456001546",
//                                       style:myStyle1
//                                   ),
//                                   Text(
//                                       "Blood Groud : AB+",
//                                       style:myStyle1
//                                   ),
//                                   SizedBox(
//                                     height: 15.0,
//                                   ),
//                                   Row(
//                                     children: [
//                                       Container(
//                                         width: 87,
//                                         height: 25,
//                                         decoration: BoxDecoration(
//                                             border: Border.all(
//                                                 color: Colors.blueAccent),
//                                             borderRadius:
//                                             BorderRadius.circular(25)),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                           children: [
//                                             Image.asset(
//                                               "assets/whatsappicon.png",
//                                               scale: 2.5,
//                                             ),
//                                             Text(
//                                               "Whatsapp",
//                                               style: TextStyle(
//                                                   fontSize: 9.0,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: myblue1,
//                                                   fontFamily: "Montserrat"),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 10,
//                                       ),
//                                       Container(
//                                         width: 61,
//                                         height: 25,
//                                         decoration: BoxDecoration(
//                                             border: Border.all(
//                                                 color: Colors.blueAccent),
//                                             borderRadius:
//                                             BorderRadius.circular(15)),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                           children: [
//                                             Image.asset(
//                                               "assets/callicon.png",
//                                               scale: 2.5,
//                                             ),
//                                             Text(
//                                               "Call",
//                                               style: TextStyle(
//                                                   fontSize: 9.0,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: myblue1,
//                                                   fontFamily: "Montserrat"),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               width: 40,
//                             ),
//                             Container(
//                               width: 80,
//                               height: 95,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15),
//                                 image: DecorationImage(
//                                   image: AssetImage("assets/memberimage.png"),
//                                   scale: 3,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
