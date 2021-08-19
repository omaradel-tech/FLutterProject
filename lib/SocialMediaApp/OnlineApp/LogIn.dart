import 'package:application/SocialMediaApp/OnlineApp/RegistrationPage.dart';
import 'package:application/SocialMediaApp/OnlineApp/Screens/HomePageScreen.dart';
import 'package:application/SocialMediaApp/Services/FireStore.dart';
import 'package:flutter/material.dart';
import 'package:application/Draw/Drawer.dart';
import 'package:application/Models/UsersInfo.dart';
import 'package:application/SocialMediaApp/Services/Auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  Auth _auth =new Auth();
  final _keyForm = GlobalKey<FormState>();
  bool isChecked = false;

  final _formkey = GlobalKey<FormState>();
  late SharedPreferences _preferences;
  saveData() async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.setStringList('currentAccount', [_email.text, _password.text]);
  }
/*  getData()async{
    _preferences = await SharedPreferences.getInstance();
    List accountData = _preferences.get('currentAccount') as List;
    if(accountData.isNotEmpty){
      setState(() {
        _email.text = accountData[0];
        _password.text = accountData[1];
        isChecked = true;
      });
    }
  }*/
  database _db = new database();

  @override
  Widget build(BuildContext context) {
    double scrwidth = MediaQuery.of(context).size.width;
    double scrheight = MediaQuery.of(context).size.height;
    if(_email.text.isEmpty){
      //getData();
    }
    // TODO: implement build
    return Scaffold(
        body: SingleChildScrollView(
        child:Column(
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
                              controller: _email,
                              validator: (val) {
                                if (val!.isEmpty == true || val == null)
                                  return "Pls enter your Email";
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: "Email"),
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
                  MaterialButton(
                    onPressed: () async{

                      if (_keyForm.currentState!.validate()) {

                         await _auth.SignIn(_email.text,_password.text).then((value){
                            if(value==true){
                              Map current;
                              Users user = new Users();
                              user.email=_email.text as String;
                             _db.GetUserData(_email.text).then((snap){
                               print(snap.data());
                               current=snap.data();
                               user.name=current['name'];
                             });
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("success")));
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePageScreen(user)));
                            }
                            else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Fail")));
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
                                return RegistrationPage();
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
        ))
    );
  }
}
