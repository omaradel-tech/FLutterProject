import 'package:application/SocialMediaApp/OnlineApp/Screens/HomePageProfile.dart';
import 'package:application/SocialMediaApp/OnlineApp/Screens/NotificationScreen.dart';
import 'package:application/SocialMediaApp/OnlineApp/Screens/ContactPage.dart';
import 'package:application/SocialMediaApp/Services/userdata.dart';
import 'package:flutter/material.dart';
import 'package:application/Models/UsersInfo.dart';
import 'package:application/SocialMediaApp/OnlineApp/Screens/SearchScreenPage.dart';

class HomePageScreen extends StatefulWidget {
  Users user;
  HomePageScreen(this.user);
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}
class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text('SocialApp',style: TextStyle(color: Colors.blue,fontSize: 35),),
            bottom: TabBar(
              tabs: [
                Tab(icon:Icon(Icons.home,color: Colors.black54,)),
                Tab(icon: Icon(Icons.notifications_none_sharp,color: Colors.black54),),
                Tab(icon:Icon(Icons.group,color: Colors.black54)),
                Tab(icon:Icon(Icons.search,color: Colors.black54))
              ],
            ),
          ),
          body:TabBarView(
            children: [
              HomePageProfile(widget.user),
              NotificationScreenPage(widget.user),
              ContactsScreen(widget.user),
              SearchScreenPage(widget.user),
            ],

          )

      ),
    );
  }
}
