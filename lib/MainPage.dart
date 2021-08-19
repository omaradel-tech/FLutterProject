import 'package:flutter/material.dart';
import 'package:application/Calculator/Calculator.dart';
import 'package:application/OurApp.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;
    double ScreenHeight = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: ScreenHeight*0.4,
            child: Center(
              child: Text("Flutter Training",style: TextStyle(color: Colors.deepPurple,fontSize: 22),),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: ScreenHeight*0.7,
            child: Image(image: AssetImage('assets/images/image1.png'),),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(20),
          child: GestureDetector(

            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return OurApp();
              }));
            },
            child: Container(
              width: 300,
              height: ScreenHeight*0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.deepPurple,
              ),
              child: Center(
                child: Text("Get Started",style: TextStyle(color: Colors.white,fontSize: 15),),
              ),
            ),
          ),
        )
      ],),
    );
  }

}

