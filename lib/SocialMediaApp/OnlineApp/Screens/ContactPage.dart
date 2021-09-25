import 'package:application/Models/NotifyModel.dart';
import 'package:application/SocialMediaApp/Services/NotificationService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:application/SocialMediaApp/Services/FireStore.dart';
import 'package:flutter/material.dart';
import 'package:application/Models/PostInfo.dart';
import 'package:application/Models/UsersInfo.dart';

// ignore: must_be_immutable
class ContactsScreen extends StatefulWidget {
  static final routName = 'videoScreen';
  Users user;

  ContactsScreen(this.user);
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  database _db = new database();
  late Stream<QuerySnapshot>? ContactStream;
  NotificationService notificationService = NotificationService();

  @override
  void initState() {
    // TODO: implement initState
    notificationService.Initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;
    double ScreenHeight = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
            width: ScreenWidth,
            child: SingleChildScrollView(
                child: Container(
              width: ScreenWidth,
              height: ScreenHeight,
              child: FutureBuilder(
                future: _db.getFriendsReq(widget.user.email.toString()),
                builder: (context, AsyncSnapshot snap) {
                  ContactStream = snap.data;
                  return StreamBuilder(
                      stream: ContactStream,
                      builder: (context, AsyncSnapshot snap) {
                        if (snap.connectionState == ConnectionState.waiting) {
                          return Center(
                              child: SizedBox(
                            child: CircularProgressIndicator(),
                            width: 100,
                            height: 100,
                          ));
                        } else if (snap.connectionState ==
                                ConnectionState.active ||
                            snap.connectionState == ConnectionState.done) {
                          if (snap.hasError) {
                            return Text('Error!');
                          } else if (snap.hasData == false) {
                            return Text('Empty Data');
                          } else {
                            return Expanded(
                              child: ListView.builder(
                                  itemCount: snap.data.docs.length,
                                  itemBuilder: (context, index) {
                                    Map _postMap = snap.data.docs[index].data();
                                    notificationService.InstanceNotification(
                                        _postMap['name'],
                                        "has Send You Friend Request");
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                        width: ScreenWidth,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(22),
                                            border: Border.all(
                                                color: Colors.indigo,
                                                width: 1)),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(1.0),
                                                  child: Container(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text("Name: " +
                                                            _postMap['name']),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text("Email: " +
                                                            _postMap['email'])
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(3.0),
                                                  child: Container(
                                                    child: Column(
                                                      children: [
                                                        Text("Time: " +
                                                            _postMap['Date']),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text("gender: " +
                                                            _postMap['gender'])
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    child: Row(
                                                      children: [
                                                        MaterialButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              _db.AddFriend(
                                                                  widget.user
                                                                      .email
                                                                      .toString(),
                                                                  _postMap[
                                                                      'email'],
                                                                  1);
                                                              _db.AddFriend(
                                                                  _postMap[
                                                                      'email'],
                                                                  widget.user
                                                                      .email
                                                                      .toString(),
                                                                  1);
                                                              _db.DeleteFriendReq(
                                                                  _postMap[
                                                                          'email']
                                                                      .toString(),
                                                                  widget.user
                                                                      .email
                                                                      .toString());
                                                              _db.SaveNotification(Notify(
                                                                  Sender: widget
                                                                      .user
                                                                      .email
                                                                      .toString(),
                                                                  Reciever:
                                                                      _postMap[
                                                                          'email'],
                                                                  name: widget
                                                                      .user
                                                                      .name,
                                                                  Text:
                                                                      "has been accepted Your friend Request You can now call each others"));
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                          content:
                                                                              Text("Success")));
                                                            });
                                                          },
                                                          child: Text("ADD"),
                                                          color:
                                                              Colors.lightBlue,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    child: Row(
                                                      children: [
                                                        MaterialButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              _db.DeleteFriendReq(
                                                                  _postMap[
                                                                          'email']
                                                                      .toString(),
                                                                  widget.user
                                                                      .email
                                                                      .toString());
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                          content:
                                                                              Text("Success")));
                                                            });
                                                          },
                                                          child: Text("Remove"),
                                                          color:
                                                              Colors.lightBlue,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            );
                          }
                        } else {
                          return Text('Error');
                        }
                      });
                },
              ),
            ))));
  }

/*  getFreidnReq()async => _db.getFriendReq(widget.user.email.toString()).then((snap){
    print(snap);
    postStream=snap;
    print(postStream);
  });*/
}
