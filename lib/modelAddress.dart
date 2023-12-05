import 'package:flutter/cupertino.dart';

class AddressModel extends ChangeNotifier{
  String id;
  String name;
  String country;
  String mobile;
  String building;
  String landmark;
  String town;
  AddressModel({required this.id,required this.name,required this.country,required this.mobile,
  required this.building,required this.landmark,required this.town});

}