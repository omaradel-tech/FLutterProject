
import 'package:flutter/material.dart';

class Calc extends StatefulWidget {
  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  Calculations c = new Calculations();
  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;
    double ScreenHeight = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        width: ScreenWidth,
        child: Column(
          children: [
            Expanded(
                child: Container(
                  width: ScreenWidth,
                  height: ScreenHeight * 0.38,
                  color: Colors.black54,
                  child: Center(
                    child: Text(
                      c.res,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                )),
            Container(
              width: ScreenWidth,
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              c.Clr();
                            });
                          },
                          child: Container(
                            width: ScreenWidth / 4,
                            height: ScreenHeight * 0.13,
                            color: Colors.deepOrange,
                            child: Center(
                              child: Text(
                                "C",
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              c.remove();
                            });
                          },
                          child: Container(
                            width: ScreenWidth / 4,
                            height: ScreenHeight * 0.13,
                            color: Colors.deepOrange,
                            child: Center(
                              child: Text(
                                "x",
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              c.num1 = double.parse(c.res);
                              c.res = "";
                              c.state = 1;
                              c.op = 4;
                            });
                          },
                          child: Container(
                            width: ScreenWidth / 4,
                            height: ScreenHeight * 0.13,
                            color: Colors.deepOrange,
                            child: Center(
                              child: Text(
                                "%",
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              c.num1 = double.parse(c.res);
                              c.res = "";
                              c.state = 1;
                              c.op = 3;
                            });
                          },
                          child: Container(
                            width: ScreenWidth / 4,
                            height: ScreenHeight * 0.13,
                            color: Colors.deepOrange,
                            child: Center(
                              child: Text(
                                "/",
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              c.res += "7";
                              if (c.state == 0)
                                c.num1 = double.parse(c.res);
                              else
                                c.num2 = double.parse(c.res);
                            });
                          },
                          child: Container(
                            width: ScreenWidth / 4,
                            height: ScreenHeight * 0.13,
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                "7",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white),
                              ),
                            ),
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              c.res += "8";
                              if (c.state == 0)
                                c.num1 = double.parse(c.res);
                              else
                                c.num2 = double.parse(c.res);
                            });
                          },
                          child: Container(
                            width: ScreenWidth / 4,
                            height: ScreenHeight * 0.13,
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                "8",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white),
                              ),
                            ),
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              c.res += "9";
                              if (c.state == 0)
                                c.num1 = double.parse(c.res);
                              else
                                c.num2 = double.parse(c.res);
                            });
                          },
                          child: Container(
                            width: ScreenWidth / 4,
                            height: ScreenHeight * 0.13,
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                "9",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white),
                              ),
                            ),
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              //op 0 add 1 sub 2 mul 3 div
                              c.num1 = double.parse(c.res);
                              c.res = "";
                              c.state = 1;
                              c.op = 2;
                            });
                          },
                          child: Container(
                            width: ScreenWidth / 4,
                            height: ScreenHeight * 0.13,
                            color: Colors.deepOrange,
                            child: Center(
                              child: Text(
                                "*",
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              c.res += "4";
                              if (c.state == 0)
                                c.num1 = double.parse(c.res);
                              else
                                c.num2 = double.parse(c.res);
                            });
                          },
                          child: Container(
                            width: ScreenWidth / 4,
                            height: ScreenHeight * 0.13,
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                "4",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white),
                              ),
                            ),
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              c.res += "5";
                              if (c.state == 0)
                                c.num1 = double.parse(c.res);
                              else
                                c.num2 = double.parse(c.res);
                            });
                          },
                          child: Container(
                            width: ScreenWidth / 4,
                            height: ScreenHeight * 0.13,
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                "5",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white),
                              ),
                            ),
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              c.res += "6";
                              if (c.state == 0)
                                c.num1 = double.parse(c.res);
                              else
                                c.num2 = double.parse(c.res);
                            });
                          },
                          child: Container(
                            width: ScreenWidth / 4,
                            height: ScreenHeight * 0.13,
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                "6",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white),
                              ),
                            ),
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              c.num1 = double.parse(c.res);
                              c.res = "";
                              c.state = 1;
                              c.op = 1;
                            });
                          },
                          child: Container(
                            width: ScreenWidth / 4,
                            height: ScreenHeight * 0.13,
                            color: Colors.deepOrange,
                            child: Center(
                              child: Text(
                                "-",
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              c.res += "1";
                              if (c.state == 0)
                                c.num1 = double.parse(c.res);
                              else
                                c.num2 = double.parse(c.res);
                            });
                          },
                          child: Container(
                            width: ScreenWidth / 4,
                            height: ScreenHeight * 0.13,
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                "1",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white),
                              ),
                            ),
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              c.res += "2";
                              if (c.state == 0)
                                c.num1 = double.parse(c.res);
                              else
                                c.num2 = double.parse(c.res);
                            });
                          },
                          child: Container(
                            width: ScreenWidth / 4,
                            height: ScreenHeight * 0.13,
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                "2",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white),
                              ),
                            ),
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              c.res += "3";
                              if (c.state == 0)
                                c.num1 = double.parse(c.res);
                              else
                                c.num2 = double.parse(c.res);
                            });
                          },
                          child: Container(
                            width: ScreenWidth / 4,
                            height: ScreenHeight * 0.13,
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                "3",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white),
                              ),
                            ),
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              c.num1 = double.parse(c.res);
                              c.res = "";
                              c.state = 1;
                              c.op = 0;
                            });
                          },
                          child: Container(
                            width: ScreenWidth / 4,
                            height: ScreenHeight * 0.13,
                            color: Colors.deepOrange,
                            child: Center(
                              child: Text(
                                "+",
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              c.res += "0";
                              if (c.state == 0)
                                c.num1 = double.parse(c.res);
                              else
                                c.num2 = double.parse(c.res);
                            });
                          },
                          child: Container(
                            width: ScreenWidth / 2,
                            height: ScreenHeight * 0.13,
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                "0",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white),
                              ),
                            ),
                          )),
                      GestureDetector(
                          onTap: () {setState(() {
                            c.res += ".";
                            if (c.state == 0)
                              c.num1 = double.parse(c.res);
                            else
                              c.num2 = double.parse(c.res);
                          });},
                          child: Container(
                            width: ScreenWidth / 4,
                            height: ScreenHeight * 0.13,
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                ".",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white),
                              ),
                            ),
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              if (c.state == 1) {
                                if (c.op == 0) {
                                  //op 0 add 1 sub 2 mul 3 div
                                  c.Add();
                                  c.state = 0;
                                } else if (c.op == 1) {
                                  //op 0 add 1 sub 2 mul 3 div
                                  c.Sub();
                                  c.state = 0;
                                } else if (c.op == 2) {
                                  //op 0 add 1 sub 2 mul 3 div
                                  c.Mul();
                                  c.state = 0;
                                } else if (c.op == 3) {
                                  //op 0 add 1 sub 2 mul 3 div
                                  c.Div(context);
                                  c.state = 0;
                                } else if (c.op == 4) {
                                  //op 0 add 1 sub 2 mul 3 div
                                  c.Mod();
                                  c.state = 0;
                                }
                                c.num2=0;
                                c.num1=0;
                              }
                            });
                          },
                          child: Container(
                            width: ScreenWidth / 4,
                            height: ScreenHeight * 0.13,
                            color: Colors.deepOrange,
                            child: Center(
                              child: Text(
                                "=",
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Calculations {
  double num1 = 0;
  double num2 = 0;
  int op = 0;
  String res = "";
  int state = 0;

  //op 0 add 1 sub 2 mul 3 div 4 mod
  Add() {
    res = (num1 + num2).toString();
  }

  Sub() {
    res = (num1 - num2).toString();
  }

  Mul() {
    res = (num1 * num2).toString();
  }

  Div(context) {
    if(num2!=0)
      res=(num1/num2).toString();
    else{
      showDialog(context: context,builder: (context){
        Clr();
        return AlertDialog(
          title: Text("Alert Message",style: TextStyle(color: Colors.red,fontSize: 22),),
          content: Text("Cant divide by zero",style: TextStyle(color: Colors.black87,fontSize: 25),),
          actions: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text("Got it"))
          ],
        );
      });
    }
  }

  Mod() {
    res = (num1 % num2).toString();
  }

  Clr() {
    res = "";
    state = 0;
    num1 = 0;
    num2 = 0;
    op = 0;
  }

  remove() {
    if ( !res.isEmpty && (num2!=0 ||num1!=0) ) {
      res = res.substring(0, res.length - 1);
    } else
      Clr();
  }
}
