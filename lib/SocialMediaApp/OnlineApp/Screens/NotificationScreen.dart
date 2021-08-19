import 'package:application/Models/UsersInfo.dart';
import 'package:application/SocialMediaApp/Services/FireStore.dart';
import 'package:application/SocialMediaApp/Services/NotificationService.dart';
import 'package:flutter/material.dart';

class NotificationScreenPage extends StatefulWidget {
  static final routName = 'notificationScreen';
  Users user;
  NotificationScreenPage(this.user);
  @override
  _NotificationScreenPageState createState() => _NotificationScreenPageState();
}

class _NotificationScreenPageState extends State<NotificationScreenPage> {
  NotificationService notificationService = NotificationService();
  database _db = new database();
  // ignore: non_constant_identifier_names
  late Stream NotifyStream;

  // ignore: non_constant_identifier_names
  GetNotify(){
    _db.GetNotfications(widget.user.email.toString()).then((snap){
     setState(() {
       NotifyStream=snap;
       notificationService.Initialize();
     });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   GetNotify();
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
              child: StreamBuilder(
                  stream: NotifyStream,
                  builder: (context, AsyncSnapshot snap) {
                    if (snap.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snap.connectionState == ConnectionState.active ||
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
                                notificationService.InstanceNotification(_postMap['name'],_postMap['Text']);
                                return Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                      width: ScreenWidth,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(22),
                                          border: Border.all(
                                              color: Colors.indigo, width: 1)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            child: Text(
                                          "${_postMap['name']}" +
                                              " " +
                                              "his Account" +
                                              "(${_postMap['Sender']})" +
                                              "${_postMap['Text']} AT ${_postMap['Date']}",
                                          style: TextStyle(fontSize: 15),
                                        ))
                                        ,
                                      )),
                                );
                              }),
                        );
                      }
                    } else {
                      return Text('Error');
                    }
                  }),
            ))));
  }
}
