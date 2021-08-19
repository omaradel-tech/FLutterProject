import 'package:application/SocialMediaApp/Services/FireStore.dart';
import 'package:flutter/material.dart';
import 'package:application/Database/DatabaseHelper.dart';
import 'package:application/Models/UsersInfo.dart';
import 'package:application/Models/friends.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';

class SearchScreen extends StatefulWidget {
  static final routName='searchScreen';
  Users user;
  @override
  _SearchScreenState createState() => _SearchScreenState();
  SearchScreen(this.user);
}

class _SearchScreenState extends State<SearchScreen> {
 //late DatabaseHelper _databaseHelper;
 database _db= new database();
  @override
/*  void initState() {
    // TODO: implement initState
    super.initState();
    _databaseHelper = DatabaseHelper();
  }*/

  final _keyForm = GlobalKey<FormState>();

 Map? current={};
  TextEditingController _text = TextEditingController();
  String txt="ADD friend";
  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;
    double ScreenHeight = MediaQuery.of(context).size.width;
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat.yMd().add_jm();
    String formatted = formatter.format(now);

    return Scaffold(
      body: Container(
        width: ScreenWidth,
        child: Column(
          children: [
            Container(
              width: ScreenWidth,
              child: Form(key: _keyForm,child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Container(
                width: ScreenWidth *0.68,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: Colors.indigo, width: 1)),
                child: Padding(
                  padding: EdgeInsets.only(left: ScreenWidth * 0.08),
                  child: TextFormField(
                    controller: _text,
                    validator: (val) {
                      if (val!.isEmpty == true)
                        return "pls enter text";
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Text"),
                  ),
                ),
              ),
                SizedBox(
                  width: ScreenHeight * 0.05,
                ),
                  MaterialButton(
                    onPressed: () async {

                      setState(() {
                        if (_keyForm.currentState!.validate()) {
                          _db.GetUserData(_text.text).then((snap){
                            print(snap.data());
                            current=snap.data();
                          });
                        }


                      });

                    },color: Colors.lightBlue,
                    child: Text("Search"),
                  ),
                ]
              ),),

            ),
            Container(
              width: ScreenWidth,
              height: ScreenHeight,
              child: Padding(
                  padding: const EdgeInsets.all( 10),
                  child: Container(
                    width: ScreenWidth,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),border:Border.all(color: Colors.black45)),
                    child: Column(
                      children: [
                        Text( "Name:"+current!['name']!),SizedBox(height: 5,),
                        Text( current!['gender']!),
                        MaterialButton(onPressed: () async {
                        },color: Colors.lightBlue,
                          child: Text(txt),)
                      ],
                    )
                  ),
                ),

            ),
          ],
        ),
      ),
    );
  }
}
