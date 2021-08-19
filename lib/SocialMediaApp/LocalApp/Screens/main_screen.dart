import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:application/Database/DatabaseHelper.dart';
import 'package:application/Models/PostInfo.dart';
import 'package:application/Models/UsersInfo.dart';
import 'package:intl/intl.dart';


class MainScreen extends StatefulWidget {
  static final routName = 'mainScreen';
 Users user;
  MainScreen(this.user);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
 late DatabaseHelper _databaseHelper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _databaseHelper = DatabaseHelper();
  }
  var colo = Colors.black;
  List exampleList=[];
  final _keyForm = GlobalKey<FormState>();
  TextEditingController _text = TextEditingController();
  int count = 1;
  int? count2;
  String txt="ADD";
  List current=[];
  var likecolor= Colors.black;

  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;
    double ScreenHeight = MediaQuery.of(context).size.width;

      DateTime now = DateTime.now();
      DateFormat formatter = DateFormat.yMd().add_jm();
      String formatted = formatter.format(now);

    _databaseHelper.get_posts(widget.user.pk as int).then((value){
      setState(() {
         exampleList=value;
      });
    });

    if(!exampleList.isEmpty){
      count2= exampleList.length;
      current=exampleList;
    }
    return Scaffold(
      body:  Container(
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
                        OutlineButton(
                          onPressed: () async {
                            if (_keyForm.currentState!.validate()) {
                            int num = await _databaseHelper.add_post(
                              Posts(Text: _text.text,userID: widget.user.pk,time: formatted)
                            );
                            txt=num.toString();
                            _text.text="";
                            }
                            setState(() {

                            });
                          },
                          child: Text("ADD POST"),
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                  Container(
                      width:ScreenWidth,
                      height:ScreenWidth,
                      child:  ListView.builder(itemCount: count2,
                          itemBuilder: (BuildContext contex, int index) {
                        if(current.isEmpty) {
                          return Text(" ");
                        }
                        else
                            return Column(
                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(width: ScreenWidth,
                                  margin: EdgeInsets.all(5),
                                  child: Card(
                                    elevation: 5,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.circle,size: 50,),
                                            SizedBox(width: 10,),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text("${widget.user.email}"),
                                                Text('${current[index]['time']}')
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 15),
                                          child: Text("${current[index]['text']}",
                                            style:
                                            TextStyle(fontSize: 20),

                                          ),
                                        ),
                                        if(current[index]['image']=='')
                                          Container()
                                        else
                                          Container(child: Image.network(current[index]['image'])),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                                padding:EdgeInsets.all(10),
                                                child: Row(
                                                  children: [
                                                    IconButton(icon: Icon(Icons.thumb_up_outlined),onPressed: (){
                                                      setState(() {
                                                        int like=current[index]['like']==0?1:0;
                                                        int pk =current[index]['PK'];
                                                       _databaseHelper.update(like,pk);
                                                      });
                                                    },color:current[index]['like']==0?Colors.black:Colors.blue,),
                                                    Text('Like',style: TextStyle(fontSize: 16),),
                                                   // Text(""),
                                                  ],



                                                )
                                            ),
                                            Container(
                                                padding:EdgeInsets.all(10),
                                                child: Row(
                                                  children: [
                                                    IconButton(icon: Icon(Icons.comment),onPressed: (){},color: Colors.black,),
                                                    Text('Comment',style: TextStyle(fontSize: 16),)
                                                  ],
                                                )),
                                            Container(
                                                padding:EdgeInsets.all(10),
                                                child: Row(
                                                  children: [
                                                    IconButton(icon: Icon(Icons.share),onPressed: (){},color: Colors.black,),
                                                    Text('Share',style: TextStyle(fontSize: 14),)
                                                  ],
                                                ))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          })
                  )
                ],
              )),

    );


  }

}
