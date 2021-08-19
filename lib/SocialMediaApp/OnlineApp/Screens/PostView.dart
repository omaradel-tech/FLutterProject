import 'package:application/Models/PostInfo.dart';
import 'package:application/Models/UsersInfo.dart';
import 'package:application/SocialMediaApp/Services/FireStore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class PostView extends StatefulWidget{
  @override
  _PostViewState createState() => _PostViewState();
  Users user;
  Map _postMap;String DocID;
  PostView(this.user,this._postMap,this.DocID);
}
var x;
class _PostViewState extends State<PostView> {
  @override
  database _db=database();
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;
    double ScreenHeight = MediaQuery.of(context).size.width;
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat.yMd().add_jm();
    String formatted = formatter.format(now);
    x=widget.user.email.toString().split('@');
    // TODO: implement build
    return widget._postMap ==null?SizedBox():  Column(
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
                        Text(widget._postMap['puplishername']),
                        Text(widget._postMap['Date'])
                      ],
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(
                      vertical: 10, horizontal: 15),
                  child: Text(widget._postMap['Text'],
                    style:
                    TextStyle(fontSize: 20),

                  ),
                ),
                /*if(file !=null)
                                              Container(child: Image.network())
                                                  else
                                                Container(),*/
                Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        child: Row(
                          children: [
                            Text(widget._postMap['totalLike'].toString()+" "+"Likes",style: TextStyle(fontSize: 16),),
                            // Text(""),
                          ],
                        )
                    ),
                    Container(
                        child: Row(
                          children: [
                            Text(widget._postMap['totalComments'].toString()+" "+'Comment',style: TextStyle(fontSize: 16),)
                          ],
                        )),
                    Container(
                        child: Row(
                          children: [
                            Text(widget._postMap['totalShare'].toString()+" "+'Share',style: TextStyle(fontSize: 14),)
                          ],
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        padding:EdgeInsets.all(10),
                        child: Row(
                          children: [
                            IconButton(icon: Icon(Icons.thumb_up_outlined),onPressed: (){
                              // to get id of cocument     print(snap.data.docs[index].id);
                              setState(() {
                                int like=widget._postMap['${x[0]}Like']!=null?widget._postMap['${x[0]}Like']==0?1:0:1;
                                int totallike;
                                if(like==0 && widget._postMap['totalLike']>0){
                                  totallike=widget._postMap['totalLike']-1;
                                }
                                else{
                                  totallike=widget._postMap['totalLike']+1;
                                }
                                _db.updateLike(Posts(like:like,totalLike:totallike,PostID:widget.DocID),widget.user.email.toString());
                              }
                              );
                            },color:widget._postMap['${x[0]}Like']!=null?widget._postMap['${x[0]}Like']==0?Colors.black:Colors.blue:Colors.black,),
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
  }
}