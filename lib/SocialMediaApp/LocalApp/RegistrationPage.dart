import 'package:flutter/material.dart';
import 'package:application/Database/DatabaseHelper.dart';
import 'package:application/Draw/Drawer.dart';
import 'package:application/Models/UsersInfo.dart';
import 'package:application/SocialMediaApp/Services/Auth.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _keyForm = GlobalKey<FormState>();
  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _name = new TextEditingController();
  TextEditingController _phoneNumber = new TextEditingController();
  Auth? _auth;
  int? _groupValue;
   DatabaseHelper _databaseHelper= new DatabaseHelper();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _databaseHelper = DatabaseHelper();
  }
String txt="ADD";
  @override
  Widget build(BuildContext context) {
    double scrwidth = MediaQuery.of(context).size.width;
    double scrheight = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      body: Column(children: [
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
                          controller: _username,
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
              RaisedButton(
                onPressed: () async {

                  _databaseHelper.createDatabase();
                  if (_keyForm.currentState!.validate()) {

                    int user_pk=await _databaseHelper.create_account(
                      Users(name: _name.text,email: _username.text,gender: _groupValue,password: _password.text,phonenumber:int.parse(_phoneNumber.text))
                    );
                    txt=user_pk.toString();
                  }
                  _name.text=" ";
                  _password.text="";
                  _phoneNumber.text=" ";
                  _username.text=" ";
                  _groupValue=null;

                },
                child: Text("Sign up"),
              ),
            ],
          ),
        ),
      ],)

    );
  }
}
