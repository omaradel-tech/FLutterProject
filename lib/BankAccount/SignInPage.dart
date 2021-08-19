import 'package:flutter/material.dart';
import 'package:application/BankAccount/Menu.dart';
import 'package:application/BankAccount/SignUpPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget{
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formkey=GlobalKey<FormState>();
 late SharedPreferences _preferences;
  svarDate() async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.setStringList('accountData', []);
  }
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    double scrwidth= MediaQuery.of(context).size.width;
    double scrheight= MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      body:
      Padding(
        padding:  EdgeInsets.only(top: scrheight*0.2,left: scrwidth*0.05),
        child: Container(
          width:scrwidth*0.9,
          height: scrheight*0.65,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: Colors.indigo,width: 1)
          ),
          child: Column(children: [

            Text("SignIn",style: TextStyle(fontSize: 25),),SizedBox(height: scrheight*0.04,),
            Form(child: Column(children: [
              Container(width: scrwidth*0.8,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(22),border: Border.all(color:Colors.indigo,width: 1)),
                child: Padding(
                  padding: EdgeInsets.only(left: scrwidth*0.08),
                  child: TextFormField(validator: (val){
                    if(val!.isEmpty==true)
                      return "Pls enter your username";
                  },decoration: InputDecoration(border: InputBorder.none,hintText: "UserName"),),
                ),
              ),SizedBox(height: scrheight*0.05,),
              Container(
                width: scrwidth*0.8,decoration: BoxDecoration(borderRadius: BorderRadius.circular(22),border: Border.all(color:Colors.indigo,width: 2)),
                child: Padding(
                  padding:  EdgeInsets.only(left: scrwidth*0.08),
                  child: TextFormField(obscureText: true,validator: (val){
                    if(val!.isEmpty==true)
                      return "Pls enter your Password";
                  },decoration: InputDecoration(hintText: "Password"),),
                ),
              ),

            ],),),SizedBox(height: scrheight*0.04,),
            Row(mainAxisAlignment: MainAxisAlignment.end,
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

              ],),SizedBox(height: 5,),
            RaisedButton(onPressed: (){
              if(_formkey.currentState!.validate()){

              }
              else{
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Menu();
                }));
              }
            },child: Text("SignIn"),),SizedBox(height: 15,),

            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("You dont have an Account ?"),
                GestureDetector(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return SignUp();
                  }));
                },
                  child: Text("Sign up now",style: TextStyle(color:Colors.indigoAccent),),
                )
              ],),
          ],),
        ),
      ),
    );

  }
}