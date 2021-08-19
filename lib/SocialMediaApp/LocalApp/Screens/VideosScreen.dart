import 'package:flutter/material.dart';

class VideosScreen extends StatefulWidget {
  static final routName='videoScreen';
  @override
  _VideosScreenState createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;
    double ScreenHeight = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: ScreenWidth,
        child: Text("hello"),

      )
    );
  }
}
