import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:application/SocialMediaApp/OnlineApp/Screens/PostView.dart';
import 'package:application/SocialMediaApp/Services/FireStore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:application/Models/PostInfo.dart';
import 'package:application/Models/UsersInfo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';


class HomePageProfile extends StatefulWidget {
  static final routName = 'mainScreen';
  Users user;

  HomePageProfile(this.user);
  @override
  _HomePageProfileState createState() => _HomePageProfileState();
}

class _HomePageProfileState extends State<HomePageProfile> {
  var colo = Colors.black;
  final _keyForm = GlobalKey<FormState>();
  TextEditingController _text = TextEditingController();
  int count = 0,length=0;
  String txt="ADD";

  var likecolor= Colors.black;
  database _db= new database();
  // ignore: non_constant_identifier_names
  //late Future<List> Friends;
  late Stream<QuerySnapshot>? postStream;
  List list=[];
 /* getPost(){
    _db.getPosts(widget.user.email.toString()).then((snap){
      setState(() {
        print(snap);
        postStream=snap;
        print(postStream);
      });
    });
  }*/


getPosts()async{
    _db.getPosts(widget.user.email.toString()).then((snapshots) {
         setState((){
            postStream = snapshots;
         });
    });

    return postStream;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPosts();
  }
  // ignore: non_constant_identifier_names
  var x;
  // to get image from device
  //final _picker=ImagePicker();
 // pickedFile?image;
 /* PickedFile? image;
  var file;*/
 /* getImage() async {
    await Permission.photos.request();
    var status= await Permission.photos.status;

    if(status.isGranted){
        image =await _picker.getImage(source: ImageSource.camera);
        file= File(image!.path);
        setState(() {

        });
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Fail")));
    }
  }*/
  /*uploadImage()async{
    final _FirebaseStorage=FirebaseStorage.instance;
    if(image!=null){
    //  await _FirebaseStorage.ref("Images/${TextFieldNAme}").putFile(file).whenComplete((){
      //  });
    }
  }*/
  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;
    double ScreenHeight = MediaQuery.of(context).size.width;
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat.yMd().add_jm();
    String formatted = formatter.format(now);
    x=widget.user.email.toString().split('@');
    return Scaffold(
      body:SingleChildScrollView(
      child:Container(
          width: ScreenWidth,
          child: Column(
            children: [
              Form(
                key: _keyForm,
                child: Row(
                  children: [
                    Container(
                      width: ScreenWidth*0.7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(color: Colors.indigo, width: 2)),
                      child: Padding(
                        padding: EdgeInsets.only(left: ScreenWidth * 0.08),
                        child: TextFormField(
                          controller: _text,
                          validator: (val) {
                            if (val!.isEmpty == true || val==null)
                              return "Pls enter  Text";
                          },
                          decoration: InputDecoration(hintText: "Text"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ScreenHeight * 0.02,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        if (_keyForm.currentState!.validate()) {
                          _db.savePost(Posts(puplishername: widget.user.name,time: formatted,Text: _text.text,PostID: widget.user.email));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success")));
                        }
                        setState(() {

                        });
                      },color: Colors.lightBlue,
                      child: Text("ADD POST"),
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
              // ignore: unnecessary_null_comparison
             Container(
                height: ScreenHeight,
                width: ScreenWidth,
                child:FutureBuilder(
                 future : _db.getPosts(widget.user.email.toString()),
                  builder: (context,AsyncSnapshot snap){
                   postStream=snap.data;
                        return StreamBuilder<QuerySnapshot>(stream: postStream,builder: (context,AsyncSnapshot snapshot){
                                      if(snapshot.connectionState==ConnectionState.waiting){
                                      return Center(child: SizedBox(child: CircularProgressIndicator(),width:100 ,height: 100,));
                                      }else if(snapshot.connectionState==ConnectionState.active||snapshot.connectionState==ConnectionState.done){
                                        if(snapshot.hasError){
                                          return Text("Error");
                                        }else if(snapshot.hasData==false){
                                          return Text("Empty");
                                        }else{
                                          return Expanded (child: ListView.builder(itemCount:snapshot.data.docs.length,
                                              itemBuilder: (BuildContext contex, int index) {
                                                Map _postMap=snapshot.data.docs[index].data();
                                                print(snapshot.data.docs.length);
                                                return PostView(widget.user,_postMap,snapshot.data.docs[index].id);
                                              })
                                          );
                                        }
                                      }else{
                                        return Text("Error");
                                      }
                        });
                   }
                   ,
                ),
              ),
            ],
          )),
    ))
    ;


  }


  }





