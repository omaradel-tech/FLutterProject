import 'package:application/Models/FriendReq.dart';
import 'package:application/Models/NotifyModel.dart';
import 'package:application/SocialMediaApp/Services/FireStore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:application/Models/UsersInfo.dart';
import 'package:intl/intl.dart';

class SearchScreenPage extends StatefulWidget {
  static final routName='searchScreen';
 Users user;
  SearchScreenPage(this.user);
  @override
  _SearchScreenPageState createState() => _SearchScreenPageState();

}

class _SearchScreenPageState extends State<SearchScreenPage> {
  database _db= new database();

  final _keyForm = GlobalKey<FormState>();

  TextEditingController _text = TextEditingController();
  String txt="ADDfriend";
  Map? current={};
  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;
    double ScreenHeight = MediaQuery.of(context).size.width;
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat.yMd().add_jm();
    String? formatted = formatter.format(now);

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

                          if (_keyForm.currentState!.validate()) {
                            _db.GetUserData(_text.text).then((snap){
                              print(snap.data());
                              setState(() {
                                current=snap.data();
                              });


                            });
                          }


                      },color: Colors.lightBlue,
                      child: Text("Search"),
                    ),
                  ]
              ),),

            ),
            if(current!.isEmpty== true || _text.text==widget.user.email.toString())
              Text(" ")
            else
            Container(
              width: ScreenWidth,
              child: Padding(
                padding: const EdgeInsets.all( 10),
                child: Container(
                    width: ScreenWidth,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),border:Border.all(color: Colors.black45)),
                    child: Column(
                      children: [
                        Text( "Name:"+current!['name']),SizedBox(height: 5,),
                        Text( current!['gender']),
                        MaterialButton(onPressed: () {
                           setState(() {
                             if(txt=="Unfriend"){
                               txt="ADDFriend";
                               _db.DeleteFriendReq(widget.user.email.toString(),_text.text);
                             }
                             else{
                               txt="Unfriend";
                               _db.FriendREq(FriendRequest(Sender: widget.user.email.toString(),Reciever: _text.text));
                               _db.SaveNotification(Notify(Sender:widget.user.email.toString(),Reciever:_text.text ,Text:"Has Send You Friend Request",name: widget.user.name.toString()));
                             }

                             //_db.AddFriend(widget.user.email.toString(), _text.text,0);
                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Request has been ADD")));
                             // ignore: unnecessary_statements

                           });

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
