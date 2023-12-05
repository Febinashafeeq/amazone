// import 'dart:collection';
// import 'dart:developer';
// import 'dart:io';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:image_picker/image_picker.dart';
//
// import 'bottomnavigationbar.dart';
// import 'modelclass.dart';
// import 'modelcls.dart';
// import 'otplogin.dart';
// class providerclass extends  ChangeNotifier {
//   int Activeindex = 0;
//   Reference ref = FirebaseStorage.instance.ref("IMAGE URL");
//
//
//   List <String>images = [
//     "assets/mobile.jpg",
//     "assets/minitv.png",
//     "assets/home.jpg",
//     "assets/grocery.webp",
//     "assets/essentials.jpg",
//     "assets/fashion.jpg",
//     "assets/electronics.jpg",
//     "assets/deals.jpg",
//     "assets/books,toys.webp",
//     "assets/beauty.jpg",
//     "assets/appliances.webp"
//   ];
//   List<String>text = [
//     "Mobile",
//     "Mini tv",
//     "Home",
//     "Grocery",
//     "Essentials",
//     "Fashion",
//     "Electronics",
//     "Deals",
//     "Book,Toys",
//     "Beauty",
//     "Appliances"
//   ];
//
//   List <String> img22 = [
//     "assets/img1.jpg",
//     "assets/img2.jpg",
//     "assets/img3.jpg",
//     "assets/img4.jpg",
//     "assets/img5.jpg",
//     "assets/img6.jpg",
//     "assets/img7.jpg",
//     "assets/img8.jpg"
//   ];
//
//
//
//   void activeIndex(int index) {
//     Activeindex = index;
//   }
//
//   List<String> select = [
//     "assets/primedayimg3,1.jpg",
//     "assets/mobile3,2.jpg",
//     "assets/fashionandbeauty3.jpg",
//     "assets/fridge3,4.jpg",
//     "assets/img3,7.jpg",
//     "assets/img3,11.jpg",
//     "assets/img3,12.jpg",
//     "assets/img3,5.jpg",
//     "assets/img3,10.jpg",
//     "assets/img3,8.jpg",
//   ];
//
//   List<String> amazonecart = [
//     "assets/cart1.jpg",
//     "assets/cart2.jpg",
//     "assets/cart3.jpg",
//     "assets/cart4.jpg",
//     "assets/cart5.jpg",
//     "assets/cart6.jpg",
//   ];
//   List<String> carttext = [
//     "Swiss Beauty pure Stick.peaches n cream",
//     "Lakme to 5 matte.powder",
//     "Swiss beauty powder.Shades",
//     "Swiss beauty hd matte Stick.athena ",
//     "Derma Essential  Cream.100 gram",
//     "Swiss beauty Liquid ",
//   ];
//   List<String> cartrate = [
//     "â‚¹171.00",
//     "â‚¹402.00",
//     "â‚¹201.00",
//     "â‚¹209.00",
//     "â‚¹299.00",
//     "â‚¹171.00",
//
//   ];
//   List<String>buyagainimg = [
//     "assets/cart5.jpg",
//     "assets/cart3.jpg",
//     "assets/cart2,5.jpg",
//     "assets/cart2,3.jpg",
//     "assets/cart6.jpg",
//
//   ];
//   List<String>buyagainimgtxt = [
//     "Derma Essential  Cream.100 gram",
//     "Swiss beauty powder.Shades",
//     "AmazonBasics TrueWireless in-Ear",
//     "Dell USB Wireless Keyboardand Mouse",
//     "Swiss beauty Liquid ",
//   ];
//   List<String>bgrate = [
//     "â‚¹299.00",
//     "â‚¹201.00",
//     "â‚¹849.00",
//     "â‚¹699.00",
//     "â‚¹171.00",
//   ];
//
//   List<String> amazonecart2 = [
//     "assets/cart2,1.jpg",
//     "assets/cart2,2.jpg",
//     "assets/cart2,3.jpg",
//     "assets/cart2,4.jpg",
//     "assets/cart2,5.jpg",
//     "assets/cart2,6.jpg",
//   ];
//
//   List<String> carttext2 = [
//     "Boult Audio FXCharge Wireless Ear Bluetooth",
//     "Zebronics Zeb-Ban Wireless BT Headphone",
//     "Dell USB Wireless Keyboardand Mouse",
//     "TP-Link USB Bluetooth Adapter",
//     "AmazonBasics TrueWireless in-Ear",
//     "boAt Rockerz Bluetooth On EarHeadphones With Mic",
//   ];
//   List<String> cartrate2 = [
//     "â‚¹999.00",
//     "â‚¹699.00",
//     "â‚¹1,331.00",
//     "â‚¹599.00",
//     "â‚¹849.00",
//     "1225.00",
//
//   ];
//
//   List<String>menu = [
//     "assets/menu1.jpeg",
//     "assets/menu2.jpeg",
//     "assets/menu3.jpeg",
//     "assets/menu4.jpeg",
//     "assets/menu5.jpeg",
//     "assets/menu6.jpeg",
//     "assets/menu7.jpeg",
//     "assets/menu8.jpeg",
//     "assets/menu9.jpeg",
//     "assets/menu10.jpeg",
//     "assets/menu11.jpeg",
//     "assets/menu12.jpeg",
//     "assets/menu13.jpeg",
//     "assets/menu14.jpeg",
//     "assets/menu15.jpeg",
//     "assets/menu16.jpeg",
//     "assets/menu17.jpeg",
//     "assets/menu18.jpeg",
//   ];
//   List<String>menutext = [
//     "Prime",
//     "Deals and Saving",
//     "Mobile & Electronic Device ",
//     "Fashion & Beauty",
//     "Groceries & pet Supplies",
//     "Health & personal Care",
//     "Home,furniture & Appliance",
//     "Music,video & GAMES",
//     "FunZon & Inspiration",
//     "Book and Education",
//     "Toys,Children &Baby",
//     "Payments and Bookings",
//     "Automotive",
//     "Office & Professional",
//     "Sports,Outdoor & travel",
//     "Gifting",
//     "Sell on amazon",
//     "Your Thing",
//
//   ];
//
//   List<String> primeimg = [
//     "assets/prime1.jpg",
//     "assets/prime2.jpg",
//   ];
//   List<String> primetext = [
//     "Prime videp",
//     "Prime  Music",
//   ];
//   List<String> dealsimg = [
//     "assets/deals.jpg",
//     "assets/deals2.png",
//     "assets/deals3.jpg",
//     "assets/deals4.png",
//     "assets/deals5.png",
//     "assets/deals6.png",
//   ];
//
//   List<String> dealstext = [
//     "Today's Deals",
//     "Rewards",
//     "Amazon Coupons",
//     "Clearance Store",
//     "Amazon Renewed",
//     "Subscribe & Save",
//   ];
//
//   List<String>Deviceimg = [
//     "assets/mobile.jpg",
//     "assets/mobile2.jpg",
//     "assets/mobile3.jpg",
//     "assets/mobile4.jpg",
//     "assets/appliances.webp",
//     "assets/mobile5.png",
//     "assets/mobile6.png",
//     "assets/mobile7.png",
//   ];
//   List<String> Devicetxt = [
//     "Mobile Phones & Accessories",
//     "Amazon Business",
//     "Electronics",
//     "Computer & Accessories",
//     "Tvs & Appliances",
//     "Kindle E-readers",
//     "Amazon Launchpad",
//     "Local Shops on Amazon"
//   ];
//   List<String> Fashionimg = [
//     "assets/f1.jpg",
//     "assets/f2.jpg",
//     "assets/f3.jpg",
//     "assets/cart1.jpg",
//     "assets/f4.jpg",
//     "assets/img4,2.jpg",
//     "assets/img4,3.jpg",
//     "assets/f5.png",
//     "assets/mobile7.png",
//   ];
//   List<String> fashiontext = [
//     "Women's Fashion",
//     "Men's Fashion",
//     "Kids Fashion",
//     "Beauty",
//     "Shoes & Footwear",
//     "Watches",
//     "Bags ,Wallets & Luggage",
//     "Handloom & Handicrafts",
//     "Local Shops on Amazon"
//   ];
//   List<String> suppliesimg = [
//     "assets/g1.jpg",
//     "assets/g2.jpg",
//     "assets/g3.jpg",
//     "assets/g4.jpg",
//     "assets/deals6.png",
//   ];
//   List<String>suppliestext = [
//     "Grocery & Gourmet Food",
//     "Amazon Fresh",
//     "Daily Essentials",
//     "Pet Supplies",
//     "Subscribe & save"
//   ];
//   List<String> careimg = [
//     "assets/c1.jpg",
//     "assets/c2.jpg",
//     "assets/cart1.jpg",
//     "assets/c3.jpg",
//     "assets/g3.jpg",
//     "assets/deals6.png",
//   ];
//   List<String> caretext = [
//     "Grooming & Wellness Device",
//     "Health & Household supplies",
//     "Beauty",
//     "Amazon Pharmacy",
//     "Daily Essentials",
//     "Subscribe & Save",
//   ];
//   List<String> Applianceimg = [
//     "assets/home.jpg",
//     "assets/a1.jpg",
//     "assets/mobile4.jpg",
//     "assets/f5.png",
//     "assets/mobile7.png",
//     "assets/c2.jpg",
//   ];
//   List<String> Appliancetxt = [
//     "Home & Kitchen",
//     "Furniture",
//     "TVs & Appliance",
//     "Handloom & Handicraft",
//     "Local Shops on Amazon",
//     "Health & Household Spplies",
//   ];
//   List<String>gamingimg = [
//     "assets/v1.jpg",
//     "assets/v2.jpg",
//     "assets/minitv.jpg",
//     "assets/prime1.jpg",
//     "assets/prime2.jpg",
//   ];
//   List<String>gamingtxt = [
//     "Video Games",
//     "Musical Instrument",
//     "Amazon miniTV",
//     "Prime Video",
//     "Prime Music",
//   ];
//   List<String>funzoneimg = [
//     "assets/f1.png",
//     "assets/fz2.jpg",
//   ];
//   List<String>funzonetxt = [
//     "Amazon Live",
//     "Funzone",
//   ];
//   List<String>booksimg = [
//     "assets/mobile5.png",
//   ];
//   List<String>bookstxt = [
//     "Kindle E-readers"
//   ];
//   List<String>toys = [
//     "assets/t1.jpg",
//     "assets/f3.jpg",
//     "assets/t2.png"
//   ];
//   List<String>toystxt = [
//     "Toys & Games",
//     "Kid's Fashion",
//     "Baby Wishlist",
//   ];
//   List<String>paymentimg = [
//     "assets/amazonpay.png",
//     "assets/deals2.png",
//     "assets/p3.jpg",
//     "assets/p5.png",
//     "assets/p4.jpg",
//     "assets/p7.png",
//   ];
//   List<String>paymenttxt = [
//     "Amazon Pay",
//     "Rewards",
//     "Mobile Recharge",
//     "Travel Tickets",
//     "Movie Tickets",
//     "Car & bike insurance",
//   ];
//   List<String> automotiveimg = [
//     "assets/p7.png",
//   ];
//   List<String> automotivetxt = [
//     "Insurance",
//   ];
//   List<String>officeimg = [
//     "assets/mobile4.jpg",
//     "assets/mobile2.jpg",
//   ];
//   List<String>officetxt = [
//     "Computer & Accessories",
//     "Amazon Business",
//   ];
//   List<String>sportsimg = [
//     "assets/p5.png",
//     "assets/img4,3.jpg",
//   ];
//   List<String>sportstxt = [
//     "Travel Tickets",
//     "Bags ,Wallets & Luggage",
//   ];
//   List<String>giftimg = [
//     "assets/gt1.png",
//     "assets/f5.png",
//     "assets/mobile6.png",
//   ];
//   List<String>gifttxt = [
//     "Gift Cards",
//     "Handloom & Handicraft",
//     "Amazon Launchpad",
//   ];
//   List<String>sellimg = [
//     "assets/sell.jpeg"
//   ];
//   List<String>selltxt = [
//     "Sell on Amazon"
//   ];
//   List<String>yourthngimg = [
//     "assets/thing1.jpeg",
//     "assets/thing2.jpeg",
//     "assets/thing3.jpeg",
//     "assets/thing4.jpeg",
//     "assets/thing5.jpeg",
//     "assets/thing6.jpeg"
//   ];
//   List<String>yourthngtxt = [
//     "Your Orders",
//     "Buy Again",
//     "Your List",
//     "your Account",
//     "Your Transactions",
//     "Your Recmmendations",
//   ];
//   List<String>allimg = [
//     "assets/tabimgw1.jpeg",
//     "assets/tabimgh1.jpeg",
//     "assets/tabimgm1.jpeg",
//     "assets/tabkimgw2.jpeg",
//     "assets/tabimg2.jpeg",
//     "assets/tabimgw3.jpeg",
//     "assets/tabimgh2.jpeg",
//     "assets/tabimg3.jpeg",
//     "assets/tabimgh3.jpeg",
//     "assets/tabimg4.jpeg",
//   ];
//   List<String>alltext = [
//     "Rashi Shrivastava",
//     "new style",
//     "kunal sharma",
//     "Khushi soni",
//     "Styleonair",
//     "Reena t",
//     "#stylesnap",
//     "sameer",
//     "new styles",
//     "Irshad",
//   ];
//   List<String>alltabp = [
//     "assets/tabimgw1.jpeg",
//     "assets/tabimgh1.jpeg",
//     "assets/tabimgm1.jpeg",
//     "assets/tabkimgw2.jpeg",
//     "assets/tabimg2.jpeg",
//     "assets/tabimgw3.jpeg",
//     "assets/tabimgh2.jpeg",
//     "assets/tabimg3.jpeg",
//
//     "assets/tabimgh3.jpeg",
//     "assets/tabimg4.jpeg",
//   ];
//   List<String>womenimg = [
//     "assets/tabimgw1.jpeg",
//     "assets/tabkimgw2.jpeg",
//     "assets/tabimgw3.jpeg",
//   ];
//   List<String>womentext = [
//     "Rashi Shrivastava",
//     "Khushi soni",
//     "Styleonair",
//
//   ];
//   List<String>womenimgp = [
//     "assets/tabimgw1.jpeg",
//     "assets/tabkimgw2.jpeg",
//     "assets/tabimgw3.jpeg",
//   ];
//   List<String>menimg = [
//     "assets/tabimgm1.jpeg",
//     "assets/tabimg2.jpeg",
//     "assets/tabimg3.jpeg",
//     "assets/tabimg4.jpeg",
//   ];
//   List<String>mentext = [
//     "kunal sharma",
//     "Styleonair",
//     "sameer",
//     "Irshad"
//   ];
//   List<String>menimgp = [
//     "assets/tabimgm1.jpeg",
//     "assets/tabimg2.jpeg",
//     "assets/tabimg3.jpeg",
//     "assets/tabimg4.jpeg",
//   ];
//   List<String>homeimg = [
//     "assets/tabimgh1.jpeg",
//     "assets/tabimgh2.jpeg",
//     "assets/tabimgh3.jpeg"
//   ];
//
//   List<String>hometext = [
//     "new style",
//     " #stylesnap",
//     "new styles",
//   ];
//   List<String>homeimgp = [
//     "assets/tabimgh1.jpeg",
//     "assets/tabimgh2.jpeg",
//     "assets/tabimgh3.jpeg"
//   ];
//   List<String>account = [
//     "Your Addresses",
//     "Top-up your Amazon Pay balance",
//     "ManageYour Profiles",
//     "View Amazon Pay balanace statement",
//     "Amazon Pay UPI",
//     "Subscribe & Save"
//
//   ];
//   List<String>listl = [
//     "assets/tabimgw1.jpeg",
//     "assets/listimg.jpg",
//   ];
//   List<String>listltxt = [
//     "Istyle can dress for women soild belted wrap dress bishop sleeves surplice",
//     "Minimalist 10% vitamin C face serum for  glowing skin highly stable & effective skin",
//   ];
//   List<String>listltxt2 = [
//     "by istyle",
//     "by minimalist (health  and beauty)",
//   ];
//   List<String>listlrate = [
//     "â‚¹849.00",
//     "â‚¹664.00",
//   ];
//   List<String>listl3 = [
//     "FREE Delivary",
//     "FREE Delivary"
//
//   ];
//
//
//   List<String>yourlistr = [
//     "assets/tabimgw1.jpeg",
//     "assets/listimg2.png",
//
//   ];
//   List<String>yourlistrtxt = [
//     "Shopping \n list",
//     "Alexa List",
//
//   ];
//   List<String>dressimg = [
//     "assets/Dress1.jpeg",
//     "assets/dress2.jpeg",
//     "assets/dress3.jpeg",
//     "assets/dress4.jpeg",
//     "assets/tabimgw1.jpeg",
//     "assets/tabkimgw2.jpeg",
//     "assets/tabimgw3.jpeg",
//   ];
//   List<String>dressimg2 = [
//     "assets/Dress1.jpeg",
//     "assets/dress2.jpeg",
//     "assets/dress4.jpeg",
//     "assets/tabimgw1.jpeg",
//     "assets/tabkimgw2.jpeg",
//     "assets/tabimgw3.jpeg",
//   ];
//   List<String>dresstxt2 = [
//     "â‚¹849.00",
//     "â‚¹649.00",
//     "â‚¹749.00",
//     "â‚¹649.00",
//     "â‚¹849.00",
//     "â‚¹549.00",
//   ];
//
//
//   File? fileImage;
//   String imageurl = "";
//   File? categoryfileimg;
//   String img = "";
//   File? productfileimg;
//   String imges="";
//   File? productfileimg2;
//   File? productfileimg3;
//   String imgs="";
//   String Imgs="";
//
//
//
//   int selectedIndex = 0;
//
//   void onItemTapped(int index) {
//     selectedIndex = index;
//     notifyListeners();
//   }
//
//   String checkvalue = "";
//
//   void ordertype(String? val) {
//     checkvalue = val!;
//     notifyListeners();
//   }
//
//   String checkvalue2 = "";
//
//   void ordertypes(String? val) {
//     checkvalue = val!;
//     notifyListeners();
//   }
//
//   TextEditingController namecontroller = TextEditingController();
//   TextEditingController phnnocontroller = TextEditingController();
//   TextEditingController emailidcontroller = TextEditingController();
//   TextEditingController passwordcontroller = TextEditingController();
//   TextEditingController loginphnnumber = TextEditingController();
//   TextEditingController loginpassword = TextEditingController();
//
//
//   // ImagePicker picker = ImagePicker();
//   List<category>categoryimg=[];
//   List<products>productdetails=[];
//   final FirebaseFirestore db = FirebaseFirestore.instance;
//
//   Future<void> addData() async {
//     String id = DateTime
//         .now()
//         .millisecondsSinceEpoch
//         .toString();
//     HashMap<String, Object> map = HashMap();
//     map["Emailid"] = emailidcontroller.text;
//     map["Name"] = namecontroller.text;
//     map["Phnno"] = phnnocontroller.text;
//     map["password"] = passwordcontroller.text;
//
//     if (fileImage != null) {
//       String photoId = DateTime
//           .now()
//           .millisecondsSinceEpoch
//           .toString();
//       ref = FirebaseStorage.instance.ref().child(photoId);
//       await ref.putFile(fileImage!).whenComplete(() async {
//         await ref.getDownloadURL().then((value) {
//           map["PHOTO"] = value;
//           map["ID_PHOTO"] = photoId;
//           // editMap['IMAGE_URL'] = value;
//           notifyListeners();
//         });
//         notifyListeners();
//       });
//       notifyListeners();
//     }
//     else {
//       map['PHOTO'] = imageurl;
//       // editMap['IMAGE_URL'] = imageUrl;
//     }
//
//     db.collection("details").doc(id).set(map);
//     notifyListeners();
//   }
//
//   void setImage(File image) {
//     fileImage = image;
//     notifyListeners();
//   }
//
//
//   Future getImage() async {
//     final imagePicker = ImagePicker();
//     final pickedImage = await imagePicker.pickImage(
//         source: ImageSource.gallery);
//
//     if (pickedImage != null) {
//       setImage(File(pickedImage.path));
//     } else {
//       print('No image selected.');
//     }
//   }
//
//   //login
//
//   void loginpage (BuildContext context) {
//     db.collection("details").where("Phnno", isEqualTo: loginphnnumber.text)
//         .where("password", isEqualTo: loginpassword.text).get().then((value) {
//       if (value.docs.isNotEmpty) {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => BottomNav()));
//       }
//       else {
//
//
//       }
//     });
//   }
//   //admin page
//
//
//   TextEditingController categorynamecontroller = TextEditingController();
//
//   Future<void> adddata2() async {
//     String id = DateTime
//         .now()
//         .millisecondsSinceEpoch
//         .toString();
//     HashMap<String, Object> categorymap = HashMap();
//     categorymap["String id"] = id;
//     categorymap["categoryname"] = categorynamecontroller.text;
//
//
//     if (categoryfileimg != null) {
//       String photoId = DateTime
//           .now()
//           .millisecondsSinceEpoch
//           .toString();
//       ref = FirebaseStorage.instance.ref().child(photoId);
//       await ref.putFile(categoryfileimg!).whenComplete(() async {
//         await ref.getDownloadURL().then((value) {
//           categorymap["photo"] = value;
//           categorymap["id photo"] = photoId;
//           // editMap['IMAGE_URL'] = value;
//           notifyListeners();
//         });
//         notifyListeners();
//       });
//       notifyListeners();
//     }
//     else {
//       categorymap['photo'] = img;
//       // editMap['IMAGE_URL'] = imageUrl;
//     }
//
//     db.collection("Category").doc(id).set(categorymap);
//     notifyListeners();
//   }
//
//   void setImage2(File image) {
//     categoryfileimg = image;
//     notifyListeners();
//   }
//
//
//   Future getImage2() async {
//     final imagePicker2 = ImagePicker();
//     final pickedImage2 = await imagePicker2.pickImage(
//         source: ImageSource.gallery);
//
//     if (pickedImage2 != null) {
//       setImage2(File(pickedImage2.path));
//     } else {
//       print('No image selected.');
//     }
//     void Clear (){
//       categorynamecontroller.clear();
//
//     }
//   }
//   TextEditingController productnamecontroller=TextEditingController();
//   TextEditingController colorcontroller = TextEditingController();
//   TextEditingController pricecontroller = TextEditingController();
//   TextEditingController discountcontroller = TextEditingController();
//
//   Future<void> addproduct() async {
//     String id = DateTime
//         .now()
//         .millisecondsSinceEpoch
//         .toString();
//     HashMap<String, Object> productmap = HashMap();
//     productmap["string id"] = id;
//     productmap["product name"] = productnamecontroller.text;
//     productmap["color"] = colorcontroller.text;
//     productmap["price"] = pricecontroller.text;
//     productmap["discount"] = discountcontroller.text;
//
//     if (productfileimg != null) {
//       String photoId = DateTime
//           .now()
//           .millisecondsSinceEpoch
//           .toString();
//       ref = FirebaseStorage.instance.ref().child(photoId);
//       await ref.putFile(productfileimg!).whenComplete(() async {
//         await ref.getDownloadURL().then((value) {
//           productmap["photo"] = value;
//           productmap["id photo"] = photoId;
//           // editMap['IMAGE_URL'] = value;
//           notifyListeners();
//         });
//         notifyListeners();
//       });
//       notifyListeners();
//     }
//     else {
//       productmap['photo'] = imges;
//       // editMap['IMAGE_URL'] = imageUrl;
//     }
//     //img2
//     if (productfileimg2 !=null){
//       String photoId = DateTime.now().millisecondsSinceEpoch.toString();
//       ref = FirebaseStorage.instance.ref().child(photoId);
//       await ref.putFile(productfileimg2!).whenComplete(() async {
//         await ref.getDownloadURL().then((value){
//           productmap["Photo2"]=value;
//           productmap["id photo2"]=photoId;
//           notifyListeners();
//         });
//         notifyListeners();
//       });
//       notifyListeners();
//     }
//     else{
//       productmap["photo2"]=imgs;
//     }
//     if (productfileimg3 !=null){
//       String photoId = DateTime.now().millisecondsSinceEpoch.toString();
//       ref = FirebaseStorage.instance.ref().child(photoId);
//       await ref.putFile(productfileimg3!).whenComplete(() async {
//         await ref.getDownloadURL().then((value){
//           productmap["Photo3"]=value;
//           productmap["id photo3"]=photoId;
//           notifyListeners();
//         });
//         notifyListeners();
//       });
//       notifyListeners();
//     }
//     else{
//       productmap["photo3"]=Imgs;
//     }
//
//
//     db.collection("Product").doc(id).set(productmap);
//     notifyListeners();
//   }
//
//   void setImage3(File image) {
//     productfileimg = image;
//     notifyListeners();
//   }
//
//
//   Future getimg() async {
//     final imagePick = ImagePicker();
//     final pickedImg = await imagePick.pickImage(
//         source: ImageSource.gallery);
//
//     if (pickedImg != null) {
//       setImage3(File(pickedImg.path));
//     } else {
//       print('No image selected.');
//     }
//   }
//   void setImage4(File image) {
//     productfileimg2 = image;
//     notifyListeners();
//   }
//
//
//   Future Getimg() async {
//     final imagePick1 = ImagePicker();
//     final pickedImg1 = await imagePick1.pickImage(
//         source: ImageSource.gallery);
//
//     if (pickedImg1 != null) {
//       setImage4(File(pickedImg1.path));
//     } else {
//       print('No image selected.');
//     }
//   }
//
//   void setImage5(File image) {
//     productfileimg3 = image;
//     notifyListeners();
//   }
//
//
//   Future getimges() async {
//     final imagePick2 = ImagePicker();
//     final pickedImg2 = await imagePick2.pickImage(
//         source: ImageSource.gallery);
//
//     if (pickedImg2 != null) {
//       setImage5(File(pickedImg2.path));
//     } else {
//       print('No image selected.');
//     }
//   }
//
//   void Clear() {
//     productnamecontroller.clear();
//     colorcontroller.clear();
//     pricecontroller.clear();
//     discountcontroller.clear();
//   }
//   void getcategorydata(){
//     db.collection("Category").get().then((value) {
//       if(value.docs.isNotEmpty){
//         categoryimg.clear();
//         for(var element in value.docs){
//           Map<dynamic,dynamic> map=element.data();
//           categoryimg.add(category(
//               map["String id"].toString(),
//               map["photo"].toString(),
//               map["categoryname"].toString()));
//           notifyListeners();
//         }
//       }
//       notifyListeners();
//     });
//   }
//
//
//   void getproductdata(){
//     db.collection("Product").get().then((value) {
//       if(value.docs.isNotEmpty){
//         productdetails.clear();
//         for(var elements in value.docs){
//           Map<String, dynamic> productmap =elements.data();
//           productdetails.add(products(
//               productmap["string id"].toString(),
//               productmap["photo"].toString(),
//               productmap["Photo2"].toString(),
//               productmap["Photo3"].toString(),
//               productmap["color"].toString(),
//               productmap["product name"].toString(),
//               productmap["discount"].toString(),
//               productmap["price"].toString()));
//           notifyListeners();
//         }
//       }
//       notifyListeners();
//     });
//   }
//
//   //otp
//
//
//   String VerificationId ="";
//   TextEditingController otp_verify =TextEditingController();
//   FirebaseAuth auth =FirebaseAuth.instance;
//
//   void sendotp(BuildContext context)async{
//     await auth.verifyPhoneNumber(
//       phoneNumber: "+91${loginphnnumber.text}",
//       verificationCompleted: (PhoneAuthCredential credential)async{
//         await auth.signInWithCredential(credential);
//       },
//       verificationFailed: (FirebaseAuthException e){
//         if(e.code == "invalid-phone-number"){
//           print("provided phone number is invalid");
//         }
//       },
//       codeSent: (String verificationId , int ? resendToken){
//         VerificationId = verificationId;
//         Navigator.pushReplacement(context,
//             MaterialPageRoute(builder: (context) => Otplogin(),));
//         log("Verification Id : $verificationId");
//       },
//       codeAutoRetrievalTimeout: (String verificationId){},
//       timeout: const Duration(seconds: 60),
//     );
//   }
//
//   void verify(BuildContext context)async{
//     PhoneAuthCredential credential =
//     PhoneAuthProvider.credential(verificationId: VerificationId, smsCode:otp_verify.text);
//     await auth.signInWithCredential(credential).then((value) {
//       if(value.user != null){
//         Navigator.pushReplacement(context,
//             MaterialPageRoute(builder: (context) => BottomNav(),));
//
//       }else{if (kDebugMode) {
//         print("6546");
//       }}
//     });
//   }
//
//
//
//
// }
//
//
//
//
//
//
//
//
