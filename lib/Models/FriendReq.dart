import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
class FriendRequest{
  String? Sender,Reciever,Date;
  int Friend;

  FriendRequest({this.Friend:0, this.Sender,this.Reciever}){
    Date=getDate();
  }
  Map<String,dynamic> toMap(){
    Map<String,dynamic>m={
      'Sender':this.Sender,
      'Reciver':this.Reciever,
      'Friend':this.Friend==0?'No':'Yes',
      'Date':getDate()
    };
    return m;
  }
 String getDate(){
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat.yMd().add_jm();
    String formatted = formatter.format(now);
    return formatted;
  }

}