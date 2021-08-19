import 'package:flutter/cupertino.dart';

class Account{
  int? accountNum;
  double? Amount;
  String? password,name,username;
  Account({this.username, @required this.name,this.Amount:0.0,this.password}){

  }
}