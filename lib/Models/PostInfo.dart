import 'package:application/Models/UsersInfo.dart';
import 'package:application/SocialMediaApp/OnlineApp/CurrentUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Posts {
  String? puplishername,Text,time,email;
  Color? likecolor;
  String? image;
  int? totalLike,userID,like,totalComments,totalShare;
  String? PostID;


  Posts({
    this.PostID,
    this.totalLike:0,
    this.Text,
    this.puplishername,
    this.time,
    this.likecolor :Colors.black,
    this.image :'',
    this.like:0,
    this.userID:0,
    this.email,
    this.totalComments:0,
    this.totalShare:0,
  });

  change(){
    if(likecolor==Colors.black)
      like=0;
    else
      like=1;
  }
  Map<String,dynamic> toMap(){
    Map<String,dynamic> m={
      // 'gender':this.gender==0?'Male':'Female',
      'puplishername':this.puplishername,
      'Text':this.Text,
      'Date':this.time,
      'totalLike':this.totalLike,
      'Owner':this.PostID,
      'totalComments':this.totalComments,
      'totalShare':this.totalShare,
    };
    return m;
  }
}
