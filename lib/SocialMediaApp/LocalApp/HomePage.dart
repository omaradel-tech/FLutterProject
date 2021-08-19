import 'package:application/SocialMediaApp/LocalApp/Screens/NotificationScreen.dart';
import 'package:application/SocialMediaApp/LocalApp/Screens/SearchScreen.dart';
import 'package:application/SocialMediaApp/LocalApp/Screens/VideosScreen.dart';
import 'package:application/SocialMediaApp/LocalApp/Screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:application/Models/UsersInfo.dart';
class HomePage extends StatefulWidget {
  Users user;
  HomePage(this.user);
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

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
          body: TabBarView(
            children: [
              MainScreen(widget.user),
              NotificationScreen(),
              VideosScreen(),
              SearchScreen(widget.user)
            ],

          )
      ),
    );
  }
}
