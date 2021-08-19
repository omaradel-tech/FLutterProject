import 'package:flutter/material.dart';
import 'package:application/Draw/Drawer.dart';
class LetsDraw extends StatefulWidget{
  @override
  _LetsDrawState createState() => _LetsDrawState();
}

class _LetsDrawState extends State<LetsDraw> {
  @override
  Widget build(BuildContext context) {
    double scrwidth= MediaQuery.of(context).size.width;
    double scrheight= MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      body: Container(
        width: scrwidth,
        height: scrheight/2,
        child: CustomPaint(painter: drawer(),child: Text(""),),
      ),
    );
  }
}


