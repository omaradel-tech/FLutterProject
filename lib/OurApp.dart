import 'package:application/BankAccount/SignInPage.dart';
import 'package:application/CalCulator/Calculator.dart';
import 'package:application/SocialMediaApp/LocalApp/LoginPage.dart';
import 'package:application/SocialMediaApp/OnlineApp/LogIn.dart';
import 'package:application/Tasks/Task1List.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OurApp extends StatefulWidget {
  @override
  _OurAppState createState() => _OurAppState();
}

class _OurAppState extends State<OurApp> {
  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;
    double ScreenHeight = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 100,
              child: Center(
                child: Text(
                  "Our App",
                  style: TextStyle(color: Colors.deepOrange, fontSize: 30),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return Calc();
                          }));
                        },
                        child: Container(
                          height: 50,
                          width: ScreenWidth / 2,
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30))),
                          child: Center(
                              child: Text(
                                "Calculator",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ),
                      Positioned(
                          top: -10,
                          left: 140,
                          child: Container(
                              width: 40,
                              height: 40,
                              child: Image(
                                  image:
                                  AssetImage('assets/images/calc.png')))),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ToDoList()));
                        },
                        child: Container(
                          height: 50,
                          width: ScreenWidth / 2,
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30))),
                          child: Center(
                              child: Text(
                                "Task1",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ),
                      Positioned(
                          top: -5,
                          child: Container(
                              width: 30,
                              height: 30,
                              child: Image(
                                  image:
                                  AssetImage('assets/images/task.png')))),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return SignIn();
                          }));
                        },
                        child: Container(
                          height: 50,
                          width: ScreenWidth / 2,
                          decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30))),
                          child: Center(
                              child: Text(
                                "BankAccount",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ),
                      Positioned(
                        top: -10,
                        left: 140,
                        child: Container(
                            width: 40,
                            height: 50,
                            child: Container(
                                decoration: BoxDecoration(shape: BoxShape.circle,image: DecorationImage(image: AssetImage('assets/images/bank.jpg'),fit:BoxFit.cover),

                                ))),)
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: ScreenWidth / 2,
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30))),
                          child: Center(
                              child: Text(
                                "Task2",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ),
                      Positioned(
                          top: -5,
                          child: Container(
                              width: 30,
                              height: 30,
                              child: Image(
                                  image:
                                  AssetImage('assets/images/task.png')))),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return Login();
                          }));
                        },
                        child: Container(
                          height: 50,
                          width: ScreenWidth / 2,
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30))),
                          child: Center(
                              child: Text(
                                "SocialMediaAppLocal",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ),
                      Positioned(
                          top: -10,
                          left: 140,
                          child: Container(
                              width: 40,
                              height: 40,
                              child: Image(
                                  image:
                                  AssetImage('assets/images/calc.png')))),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: ScreenWidth / 2,
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30))),
                          child: Center(
                              child: Text(
                                "Task2",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ),
                      Positioned(
                          top: -5,
                          child: Container(
                              width: 30,
                              height: 30,
                              child: Image(
                                  image:
                                  AssetImage('assets/images/task.png')))),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return LoginPage();
                          }));
                        },
                        child: Container(
                          height: 50,
                          width: ScreenWidth / 2,
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30))),
                          child: Center(
                              child: Text(
                                "SocialMediaAppOnline",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ),
                      Positioned(
                          top: -10,
                          left: 140,
                          child: Container(
                              width: 40,
                              height: 40,
                              child: Image(
                                  image:
                                  AssetImage('assets/images/calc.png')))),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: ScreenWidth / 2,
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30))),
                          child: Center(
                              child: Text(
                                "Task2",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ),
                      Positioned(
                          top: -5,
                          child: Container(
                              width: 30,
                              height: 30,
                              child: Image(
                                  image:
                                  AssetImage('assets/images/task.png')))),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
