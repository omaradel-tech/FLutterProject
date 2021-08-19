import 'package:flutter/material.dart';
import 'package:application/Database/DatabaseHelper.dart';
import 'package:application/Draw/Drawer.dart';
import 'package:application/Models/UsersInfo.dart';
import 'package:application/SocialMediaApp/LocalApp/HomePage.dart';
import 'package:application/SocialMediaApp/LocalApp/RegistrationPage.dart';
import 'package:application/SocialMediaApp/Services/Auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  Auth? _auth;
  final _keyForm = GlobalKey<FormState>();
   DatabaseHelper _databaseHelper = DatabaseHelper();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _databaseHelper = DatabaseHelper();
  }

  bool isChecked = false;

  final _formkey = GlobalKey<FormState>();
  late SharedPreferences _preferences;
  saveData() async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.setStringList('currentAccount', [_username.text, _password.text]);
  }
  getData()async{
    _preferences = await SharedPreferences.getInstance();
    List accountData = _preferences.get('currentAccount') as List;
    if(accountData.isNotEmpty){
      setState(() {
        _username.text = accountData[0];
        _password.text = accountData[1];
        isChecked = true;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    double scrwidth = MediaQuery.of(context).size.width;
    double scrheight = MediaQuery.of(context).size.height;
    if(_username.text.isEmpty){
      getData();
    }
    // TODO: implement build
    return Scaffold(
        body: Column(
      children: [
        Container(width: scrwidth,height: scrheight*0.25,
          child: CustomPaint(
            painter: drawer(),
          ),),
        Container(
          width: scrwidth * 0.9,
          height: scrheight * 0.75,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: Colors.indigo, width: 1)),
          child: Column(
            children: [
              Text(
                "LogIn",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: scrheight * 0.04,
              ),
              Form(key:_keyForm,
                child: Column(
                  children: [
                    Container(
                      width: scrwidth * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(color: Colors.indigo, width: 1)),
                      child: Padding(
                        padding: EdgeInsets.only(left: scrwidth * 0.08),
                        child: TextFormField(
                          controller: _username,
                          validator: (val) {
                            if (val!.isEmpty == true || val == null)
                              return "Pls enter your username";
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "UserName"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: scrheight * 0.05,
                    ),
                    Container(
                      width: scrwidth * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(color: Colors.indigo, width: 2)),
                      child: Padding(
                        padding: EdgeInsets.only(left: scrwidth * 0.08),
                        child: TextFormField(
                          controller: _password,
                          obscureText: true,
                          validator: (val) {
                            if (val!.isEmpty == true)
                              return "Pls enter your Password";
                          },
                          decoration: InputDecoration(hintText: "Password"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: scrheight * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value as bool;
                      });
                    },
                  ),
                  Text('Remember me'),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              RaisedButton(
                onPressed: () async{

                        if (_keyForm.currentState!.validate()) {
                        _databaseHelper.getAccount(_username.text, _password.text).then((value) async {
                          if(!value.isEmpty){
                             if(isChecked)
                               await saveData();
                             Map currentAccount=value[0];
                             Users us = Users(
                               pk: currentAccount['PK'],
                               name: currentAccount['name'],
                               email: currentAccount['username'],
                               phonenumber:currentAccount['phoneNumber'] ,
                               password:currentAccount['password'],
                               gender: currentAccount['gender'],
                             );
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(us)));
                          }
                          else{

                          }
                        });


                  }
                },
                child: Text("Login"),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("You dont have an Account ?"),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Registration();
                      }));
                    },
                    child: Text(
                      "Sign up now",
                      style: TextStyle(color: Colors.indigoAccent),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
