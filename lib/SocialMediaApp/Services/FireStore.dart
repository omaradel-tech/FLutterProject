
import 'package:application/Models/FriendReq.dart';
import 'package:application/Models/NotifyModel.dart';
import 'package:application/Models/PostInfo.dart';
import 'package:application/Models/UsersInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

// ignore: camel_case_types
class database{
  CollectionReference AccountRef=FirebaseFirestore.instance.collection("Accounts");
  CollectionReference PostsRef=FirebaseFirestore.instance.collection("Posts");
  CollectionReference FriendReqRef = FirebaseFirestore.instance.collection("FriendReq");
  CollectionReference NotfiyRef=FirebaseFirestore.instance.collection("Notifications");


  // ignore: non_constant_identifier_names
  SaveAccount(Users user)async{
    print(user);
    await AccountRef.doc(user.email).set(user.toMap());
  }
  savePost(Posts post)async{
    await PostsRef.doc().set(post.toMap());
  }

   getPosts(String email)async{
   late List list=[];
   await getFriendsList(email).then((snap){
     list=  snap as List;
    });
   list.add(email);
    return await PostsRef.where('Owner',whereIn:list).snapshots();
  }

  updateLike(Posts post,String email){
    var x= email.split('@');
    PostsRef.doc(post.PostID).update({
      '${x[0]}Like':post.like,
      'totalLike':post.totalLike,
    });
  }

  GetUserData(String email) async {
    return await AccountRef.doc(email).get();
  }

  AddFriend(String Sender,String Reciever,int friend)async{
    GetUserData(Reciever).then((snap){
      Map current=snap.data();
      Map<String,dynamic>Friend={
        'friend':friend,
        'email':current['email'],
        'gender':current['gender'],
        'name':current['name'],
        'phonenumber':current['phonenumber']
      };
      AccountRef.doc(Sender).collection('Friends').doc(Reciever).set(Friend);
    });


  }

 FriendREq(FriendRequest FriendReq){
    GetUserData(FriendReq.Sender.toString()).then((snap){
      Map current=snap.data();
      Map<String,dynamic>Friend={
        'Date':FriendReq.Date,
        'email':current['email'],
        'gender':current['gender'],
        'name':current['name'],
        'phonenumber':current['phonenumber']
      };
      FriendReqRef.doc(FriendReq.Reciever).collection('FriendsList').doc(FriendReq.Sender).set(Friend);
    });
 }
 getFriendsReq(String email)async{
    return FriendReqRef.doc(email).collection('FriendsList').snapshots();
 }
 getFriendsList(String email)async{
    List list=[];
  await AccountRef.doc(email).collection('Friends').get().then((snap){
     snap.docs.forEach((element) {
       list.add(element.id);
     });
   });
   return   list;
 }

  DeleteFriendReq(String Sender,String Reciver)async{
    return FriendReqRef.doc(Reciver).collection('FriendsList').doc(Sender).delete();
  }
  SaveNotification(Notify _notify)async{
    NotfiyRef.doc().set(_notify.ToMap());
  }


  GetNotfications(String email)async{
    return NotfiyRef.where('Reciever',isEqualTo: email.toString()).snapshots();
  }

  MakeLikes(String owner,String Liker)async{

  }

}