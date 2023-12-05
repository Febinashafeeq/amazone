import 'dart:collection';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

import 'modelAddress.dart';
import 'modelCarousel.dart';
import 'modelCart.dart';
import 'modelCategory.dart';
import 'modelProduct.dart';
import 'modelUserlogin.dart';
import 'modelWishlist.dart';

class MainProvider extends ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  Reference ref = FirebaseStorage.instance.ref("IMAGE URL");
  FirebaseAuth auth = FirebaseAuth.instance;

  // #userlogin

  String VerificationId = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  String img = "";

  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<UserloginModel> newList = [];

  Future sendotp() async {
    await auth.verifyPhoneNumber(
      phoneNumber: "+91${phoneController.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == "invalid-phone-number") {
          print("provided phone number is invalid");
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        VerificationId = verificationId;
        log("Verification Id : $verificationId");
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
    );
  }

  Future<void> verifyOtp(String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: VerificationId,
      smsCode: otp,
    );

    try {
      await auth.signInWithCredential(credential);
      // Handle authenticated user here, if needed.
    } catch (e) {
      // Handle verification failure here, if needed.
      print("Verification Failed: ${e.toString()}");
    }
  }

  Future<void> addUser(String from, String oldid) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    Map<String, dynamic> dataMap = HashMap();
    dataMap["Name"] = nameController.text;
    dataMap["Password"] = passwordController.text;
    dataMap["Phone"] = phoneController.text;

    if (fileimage != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(fileimage!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          dataMap["Photo"] = value;
        });
      });
    } else {
      dataMap["Photo"] = img;
    }
    if (from == "EDIT") {
      db.collection("User").doc(oldid).update(dataMap);
    } else {
      db.collection("User").doc(id).set(dataMap);
    }
  }

  void editInfo(String id) {
    db.collection('User').doc(id).get().then((value) {
      Map<dynamic, dynamic> dataMap = value.data() as Map;
      if (value.exists) {
        nameController.text = dataMap["Name"].toString();
        passwordController.text = dataMap["Password"].toString();
        img = dataMap["Photo"];
      }
      notifyListeners();
    });
    notifyListeners();
  }

  void getInfo() {
    db.collection('User').get().then((value) {
      newList.clear();
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          Map<String, dynamic> map = element.data();
          newList.add(UserloginModel(
            name: map["Name"].toString(),
            Password: map["Password"].toString(),
            Photo: map["Photo"].toString(),
            phone: map["Phone"].toString(),
            id: element.id,
          ));
          notifyListeners();
        }
      }
    });
  }

  void delete(String id) {
    db.collection("User").doc(id).delete();
    notifyListeners();
  }

  void clearField() {
    nameController.clear();
    passwordController.clear();
    fileimage = null;
    img = "";
    phoneController.clear();
    notifyListeners();
  }

  File? fileimage;

  void setImage(File image) {
    fileimage = image;
    notifyListeners();
  }

  Future getImageGallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setImage(File(pickedImage.path));
    }
  }

  Future getImageCamera() async {
    final imagePicker = ImagePicker();

    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setImage(File(pickedImage.path));
    }
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        )),
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                  leading: Icon(
                    Icons.camera_enhance_sharp,
                  ),
                  title: const Text(
                    'Camera',
                  ),
                  onTap: () => {getImageCamera(), Navigator.pop(context)}),
              ListTile(
                  leading: Icon(
                    Icons.photo,
                  ),
                  title: const Text(
                    'Gallery',
                  ),
                  onTap: () => {getImageGallery(), Navigator.pop(context)}),
            ],
          );
        });
    // ImageSource
  }

// #AddProduct

  TextEditingController pronameController = TextEditingController();
  TextEditingController discripController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController procategoryController = TextEditingController();

  String proimg = "";

  File? fileimagepro;

  void setImagepro(File image) {
    fileimagepro = image;
    notifyListeners();
  }

  void clearFieldpro() {
    pronameController.clear();
    fileimagepro = null;
    proimg = "";
    discripController.clear();
    priceController.clear();
    procategoryController.clear();
    notifyListeners();
  }

  Future getImageGallerypro() async {
    final imagePicker1 = ImagePicker();
    final pickedImage =
        await imagePicker1.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setImagepro(File(pickedImage.path));
    }
  }

  List<ModelClass1> productlist = [];

  Future<void> addproduct(String from, String oldid) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    Map<String, dynamic> dataMap = HashMap();
    dataMap["Name"] = pronameController.text;
    dataMap["Discription"] = discripController.text;
    dataMap["Price"] = priceController.text;
    dataMap["Id"] = id;
    dataMap["CategoryId"] = categoryid;

    if (fileimagepro != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(fileimagepro!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          dataMap["Photo"] = value;
        });
      });
    } else {
      dataMap["Photo"] = img;
    }

    if (from == "EDIT") {
      db.collection("Product").doc(oldid).update(dataMap);
    } else {
      db.collection("Product").doc(id).set(dataMap);
    }
  }

  void getproductInfo() {
    db.collection('Product').get().then((value) {
      if (value.docs.isNotEmpty) {
        productlist.clear();
        for (var element in value.docs) {
          // Map<String, dynamic> map = element.data() ;
          // print( map["CategoryId"].toString()+"adsj");

          productlist.add(ModelClass1(
            // id: element.id,
            productid: element.get("Id").toString(),
            name: element.get("Name").toString(),
            price: element.get("Price").toString(),
            discription: element.get("Discription").toString(),

            photo: element.get("Photo").toString(),
            categoryid: element.get("CategoryId").toString(),
          ));
          notifyListeners();
        }
      }
    });
  }

  void deleteproduct(String id) {
    db.collection("Product").doc(id).delete();
    notifyListeners();
  }

  void editproduct(String id) {
    db.collection('Product').doc(id).get().then((value) {
      Map<dynamic, dynamic> dataMap1 = value.data() as Map;
      if (value.exists) {
        pronameController.text = dataMap1["Name"].toString();
        discripController.text = dataMap1["Discription"].toString();
        priceController.text = dataMap1["Price"].toString();
        proimg = dataMap1["Photo"];
      }
      notifyListeners();
    });
    notifyListeners();
  }

  void getproductadmindata(String categoryid) {
    db
        .collection("Product")
        .where("CategoryId", isEqualTo: categoryid)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        productlist.clear();
        for (var elements in value.docs) {
          Map<String, dynamic> productmap = elements.data();
          productlist.add(ModelClass1(
            productid: productmap["Id"].toString(),
            name: productmap["Name"].toString(),
            price: productmap["Price"].toString(),
            discription: productmap["Discription"].toString(),
            photo: productmap["Photo"].toString(),
            categoryid: productmap["categoryId"].toString(),
          ));
          notifyListeners();
        }
      }
      notifyListeners();
    });
  }

//#Add category

  TextEditingController catnameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  String categoryid = "";
  String catimg = "";

  File? fileimagecat;

  void setImagecat(File image) {
    fileimagecat = image;
    notifyListeners();
  }

  void clearFieldcat() {
    catnameController.clear();
    fileimagecat = null;
    catimg = "";
    notifyListeners();
  }

  Future getImageGallerycat() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setImagecat(File(pickedImage.path));
    }
  }

  Future<void> addcategory(String from, String oldid) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    Map<String, dynamic> dataMap = HashMap();
    dataMap["Name"] = nameController.text;
    dataMap["Id"] = id;

    if (fileimagecat != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(fileimagecat!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          dataMap["Photo"] = value;
        });
      });
    } else {
      dataMap["Photo"] = catimg;
    }

    if (from == "EDIT") {
      db.collection("Category").doc(oldid).update(dataMap);
    } else {
      db.collection("Category").doc(id).set(dataMap);
    }
  }

  List<CategoryModel> categorylist = [];

  void getcategoryInfo() {
    db.collection('Category').get().then((value) {
      categorylist.clear();
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          Map<String, dynamic> map = element.data();
          categorylist.add(CategoryModel(
            categoryid: map["Id"].toString(),
            name: map["Name"].toString(),
            Photo: map["Photo"].toString(),
          ));
          notifyListeners();
        }
      }
    });
  }

  void deletecategory(String id) {
    db.collection("Category").doc(id).delete();
    notifyListeners();
  }

  void editcategory(String id) {
    db.collection('Category').doc(id).get().then((value) {
      Map<dynamic, dynamic> dataMap = value.data() as Map;
      if (value.exists) {
        catnameController.text = dataMap["Name"].toString();

        catimg = dataMap["Photo"];
      }
      notifyListeners();
    });
    notifyListeners();
  }

//  #Addcarousel

  TextEditingController caronameController = TextEditingController();
  TextEditingController carouselController = TextEditingController();

  String carouselid = "";
  String caroimg = "";

  File? fileimagecaro;

  void setImagecaro(File image) {
    fileimagecaro = image;
    notifyListeners();
  }

  void clearFieldcaro() {
    caronameController.clear();
    fileimagecaro = null;
    caroimg = "";
    notifyListeners();
  }

  Future getImageGallerycaro() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setImagecaro(File(pickedImage.path));
    }
  }

  Future<void> addcarousel(String from, String oldid) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    Map<String, dynamic> dataMap = HashMap();
    dataMap["Id"] = id;

    if (fileimagecaro != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(fileimagecaro!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          dataMap["Photo"] = value;
        });
      });
    } else {
      dataMap["Photo"] = caroimg;
    }

    if (from == "EDIT") {
      db.collection("Carousel").doc(oldid).update(dataMap);
    } else {
      db.collection("Carousel").doc(id).set(dataMap);
    }
  }

  List<CarouselModel> carousellist = [];

  void getcarouselInfo() {
    db.collection('Carousel').get().then((value) {
      carousellist.clear();
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          Map<String, dynamic> map = element.data();
          carousellist.add(CarouselModel(
            // id: element.id,
            id: map["Id"].toString(),
            Photo: map["Photo"].toString(),
          ));
          notifyListeners();
        }
      }
    });
  }

  void deletecarousel(String id) {
    db.collection("Carousel").doc(id).delete();
    notifyListeners();
  }

  void editcarousel(String id) {
    db.collection('Carousel').doc(id).get().then((value) {
      Map<dynamic, dynamic> dataMap1 = value.data() as Map;
      if (value.exists) {
        caronameController.text = dataMap1["Name"].toString();

        caroimg = dataMap1["Photo"];
      }
      notifyListeners();
    });
    notifyListeners();
  }

  int Activeindex = 0;
  void activeIndex(int index) {
    Activeindex = index;
    notifyListeners();
  }

  void sharepop() {
    Share.share("Messages");
  }

//  # product list
  List<String> productimage = [
    "assets/deal1.png",
    "assets/deal2.png",
    "assets/deal3.png",
    "assets/deal4.png",
    "assets/deal5.png",
  ];

//  #CART

  void Addcart(String name, price, photo, BuildContext context) {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> addcartmap = HashMap();
    addcartmap["Cartid"] = id;
    addcartmap["Name"] = name;
    addcartmap["Price"] = price;
    // addcartmap["ProductId"] = productid;
    addcartmap["Photo"] = photo;

    db.collection("Cart").doc(id).set(addcartmap);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Product added to cart"),
      backgroundColor: Colors.blue,
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(5),
    ));
    notifyListeners();
  }

  List<CartModel> cartlist = [];

  void getcartinfo() {
    db.collection("Cart").get().then((value) {
      cartlist.clear();
      {
        cartlist.clear();
        if (value.docs.isNotEmpty) {
          for (var elements in value.docs) {
            Map<String, dynamic> addcartmap = elements.data();
            cartlist.add(CartModel(
              cartid: addcartmap["Id"].toString(),
              name: addcartmap["Name"].toString(),
              photo: addcartmap["Photo"].toString(),
              price: addcartmap["Price"].toString(),
              productid: addcartmap["ProductId"].toString(),
              // quantity: addcartmap["Quantity"]
            ));
            notifyListeners();
          }
        }
        notifyListeners();
      }
    });
  }

  void deletecart(String id) {
    db.collection("Cart").doc(id).delete();
    notifyListeners();
  }

  int counter = 0;

  // void addCount(cartid) {
  //   cartlist[cartid].quantity++;
  //
  //   // notifyListeners();
  // }

  void removeCount() {
    if (counter > 0) {
      counter--; // Decrement the counter only if it's greater than 0
    }

    notifyListeners();
  }

  List<WishModel> wishlist = [];
  void Addwishlist(String name, price, photo, BuildContext context) {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> addwishmap = HashMap();
    addwishmap["Id"] = id;
    addwishmap["Name"] = name;
    addwishmap["Price"] = price;
    addwishmap["Photo"] = photo;
    db.collection("Wishlist").doc(id).set(addwishmap);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Product added to wishlist"),
      backgroundColor: Colors.blue,
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(5),
    ));
    notifyListeners();
  }

  void getwishlistinfo() {
    db.collection("Wishlist").get().then((value) {
      wishlist.clear();
      if (value.docs.isNotEmpty) {
        for (var elements in value.docs) {
          Map<String, dynamic> addwishmap = elements.data();
          wishlist.add(WishModel(
              id: addwishmap["Id"].toString(),
              name: addwishmap["Name"].toString(),
              photo: addwishmap["Photo"].toString(),
              price: addwishmap["Price"].toString()));

          notifyListeners();
        }
      }
      notifyListeners();
    });
  }
  List<String> showimage = [
    "assets/handbag.png",
    "assets/homeapl.png",
    "assets/fasion.png",
    "assets/mask.png"
  ];
  List<String> showtext = [
    "Keep shoping for",
    "Keep browsing",
    "Continue browsing",
    "Browse similar"
  ];
  String dealsImage ="";

  void dealsSelection(String image){
    dealsImage = image;
    notifyListeners();
  }
  TextEditingController cnamecontroller = TextEditingController();
  TextEditingController countrycontroller = TextEditingController();
  TextEditingController mobcontroller = TextEditingController();
  TextEditingController buildcontroller = TextEditingController();
  TextEditingController landcontroller = TextEditingController();
  TextEditingController towncontroller = TextEditingController();

  List<AddressModel> addresslist = [];
  void addAddress(){
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    Map<String, dynamic> addressMap = HashMap();
    addressMap["Name"] = cnamecontroller.text;
    addressMap["Country"] = countrycontroller.text;
    addressMap["Mobile"] = mobcontroller.text;
    addressMap["Building"] = buildcontroller.text;
    addressMap["Landmark"] = landcontroller.text;
    addressMap["Town"] = towncontroller.text;
    db.collection("Address").doc(id).set(addressMap);
  }
  void getaddressInfo() {
    db.collection('Address').get().then((value) {
      addresslist.clear();
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          Map<String, dynamic> addmap = element.data();
          addresslist.add(AddressModel(
              id: element.id,
            name: addmap["Name"].toString(),
            country: addmap["Country"].toString(),
            mobile: addmap["Mobile"].toString(),
            building: addmap["Building"].toString(),
            landmark: addmap["Landmark"].toString(),
            town: addmap["Town"].toString(),

          ));
          notifyListeners();
        }
      }
    });
  }

}
