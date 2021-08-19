import 'package:application/SocialMediaApp/OnlineApp/Screens/HomePageScreen.dart';
import 'package:application/SocialMediaApp/Services/FireStore.dart';
import 'package:flutter/material.dart';
import 'package:application/Draw/Drawer.dart';
import 'package:application/Models/UsersInfo.dart';
import 'package:application/SocialMediaApp/Services/Auth.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _keyForm = GlobalKey<FormState>();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _name = new TextEditingController();
  TextEditingController _phoneNumber = new TextEditingController();
  Auth _auth= new Auth();
  int? _groupValue;
  database _db= new database();
  String txt="ADD";
  @override
  Widget build(BuildContext context) {
    double scrwidth = MediaQuery.of(context).size.width;
    double scrheight = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
        body: SingleChildScrollView(
        child:Column(children: [
          Container(width: scrwidth,height: scrheight*0.16,
            child: CustomPaint(
              painter: drawer(),
            ),),
          Container(
            width: scrwidth * 0.9,

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: Colors.indigo, width: 1)),
            child: Column(
              children: [
                Text(
                  "Sign UP",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: scrheight * 0.04,
                ),
                Form(
                  key: _keyForm,
                  child: Column(
                    children: [
                      Container(
                        width: scrwidth * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(color: Colors.indigo, width: 2)),
                        child: Padding(
                          padding: EdgeInsets.only(left: scrwidth * 0.08),
                          child: TextFormField(
                            validator: (val) {
                              if (val!.isEmpty == true)
                                return "Pls enter your Name";
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "Name"),
                            controller: _name,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: scrwidth * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(color: Colors.indigo, width: 2)),
                        child: Padding(
                          padding: EdgeInsets.only(left: scrwidth * 0.08),
                          child: TextFormField(
                            validator: (val) {
                              if (val!.isEmpty == true)
                                return "Pls enter your UserName";
                            },
                            decoration: InputDecoration(hintText: "UserName"),
                            controller: _email,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: scrwidth * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(color: Colors.indigo, width: 2)),
                        child: Padding(
                          padding: EdgeInsets.only(left: scrwidth * 0.08),
                          child: TextFormField(
                            obscureText: true,
                            validator: (val) {
                              if (val!.isEmpty == true)
                                return "Pls enter your Password";
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "Password"),
                            controller: _password,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: scrwidth * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(color: Colors.indigo, width: 2)),
                        child: Padding(
                          padding: EdgeInsets.only(left: scrwidth * 0.08),
                          child: TextFormField(
                            validator: (val) {
                              if (val!.isEmpty == true)
                                return "Pls enter your PhoneNumber";
                            },
                            decoration: InputDecoration(hintText: "PhoneNumber"),
                            controller: _phoneNumber,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                  Text(
                    "Gender : ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Radio(
                            value: 0,
                            groupValue: _groupValue,
                            onChanged: (value) {
                              setState(() {
                                _groupValue = value as int;
                              });
                            }),
                        Text("Male"),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Radio(
                            value: 1,
                            groupValue: _groupValue,
                            onChanged: (value) {
                              setState(() {
                                _groupValue = value as int;
                              });
                            }),
                        Text("Female"),
                      ],
                    ),
                  ),
                ]),
                MaterialButton(
                  onPressed: () async {
                    if (_keyForm.currentState!.validate()) {
                      //TODO create new account
                      await _auth.Sigup(_email.text,
                          _password.text)
                          .then((value) {
                        if (value == true) {
                          _db.SaveAccount(Users(
                              email: _email.text,
                              phonenumber: int.parse(_phoneNumber.text),
                              name: _name.text,
                              gender: _groupValue));

                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Success")));
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePageScreen(Users(name: _name.text,email: _email.text,phonenumber: int.parse(_phoneNumber.text),gender: _groupValue))));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("failed")));
                        }
                      });
                    }



                  },
                  color: Colors.lightBlueAccent,
                  child: Text("Sign up"),
                ),
              ],
            ),
          ),
        ],)
        )

    );
  }
}
