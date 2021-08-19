import 'package:flutter/material.dart';


class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  TextEditingController _money = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double scwidth = MediaQuery.of(context).size.width;
    double scheight = MediaQuery.of(context).size.height;

    DisplayDialog(context, bool action) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Center(
                  child: Text(
                    action == true ? "Withdraw" : "Deposit",
                    style: TextStyle(color: Colors.indigo),
                  )),
              content: Container(height: scheight*0.1,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(action == true
                        ? "Please enter the withdraw amount"
                        : "Please enter the deposit amount"),
                    TextField(
                      controller: _money,
                      decoration: InputDecoration(
                          hintText: action == true
                              ? "Withdraw amount"
                              : "Deposit amount"),
                    ),
                  ],
                ),
              ),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child:
                    Text("Cancel", style: TextStyle(color: Colors.indigo))),
                FlatButton(
                    onPressed: () async{
                    },
                    child: Text("Confirm",
                        style: TextStyle(color: Colors.indigo))),
              ],
            );
          });
    }

    return Scaffold(
      body: Container(
        width: scwidth,
        height: scheight,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.indigo, Colors.blue])),
        child: Padding(
          padding: EdgeInsets.only(top: scheight * 0.1),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    " Your Balance is : 5000 \$",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  DisplayDialog(context, true);
                },
                child: Padding(
                  padding: EdgeInsets.only(top: scheight * 0.18),
                  child: Container(
                    width: scwidth * 0.6,
                    height: scheight * 0.2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22)),
                    child: Center(
                        child: Text(
                          "Withdraw",
                          style: TextStyle(color: Colors.indigo, fontSize: 25),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: scheight * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  DisplayDialog(context, false);
                },
                child: Container(
                  width: scwidth * 0.6,
                  height: scheight * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22)),
                  child: Center(
                      child: Text(
                        "Deposit",
                        style: TextStyle(color: Colors.indigo, fontSize: 25),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
