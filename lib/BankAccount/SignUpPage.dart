import 'package:application/Database/DatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:application/Database/DatabaseHelper.dart';
import 'package:application/Models/AccountInfo.dart';
import 'package:sqflite/sqflite.dart';

class SignUp extends StatefulWidget{
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey=GlobalKey<FormState>();
  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _bankNum = new TextEditingController();
  TextEditingController _Amount_money = new TextEditingController();
  int? _groupValue;
  late DatabaseHelper _databaseHelper;
  void initstate(){
    super.initState();
    _databaseHelper=DatabaseHelper();
  }
  @override
  Widget build(BuildContext context) {
    double scrwidth= MediaQuery.of(context).size.width;
    double scrheight= MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      body:
      Padding(
        padding:  EdgeInsets.only(top: scrheight*0.1,left: scrwidth*0.05),
        child: Container(
          width:scrwidth*0.9,
          height: scrheight*0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: Colors.indigo,width: 1)
          ),
          child: Column(children: [

            Text("Sign UP",style: TextStyle(fontSize: 25),),SizedBox(height: scrheight*0.04,),
            Form(child: Column(children: [
              Container(width: scrwidth*0.8,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(22),border: Border.all(color:Colors.indigo,width: 2)),
                child: Padding(
                  padding: EdgeInsets.only(left: scrwidth*0.08),
                  child: TextFormField(validator: (val){
                    if(val!.isEmpty==true)
                      return "Pls enter your username";
                  },decoration: InputDecoration(border: InputBorder.none,hintText: "UserName"),controller: _username,),
                ),
              ),SizedBox(height: 10,),
              Container(
                width: scrwidth*0.8,decoration: BoxDecoration(borderRadius: BorderRadius.circular(22),border: Border.all(color:Colors.indigo,width: 2)),
                child: Padding(
                  padding:  EdgeInsets.only(left: scrwidth*0.08),
                  child: TextFormField(obscureText: true,validator: (val){
                    if(val!.isEmpty==true)
                      return "Pls enter your Password";
                  },decoration: InputDecoration(hintText: "Password"),controller: _password,),
                ),
              ),SizedBox(height: 10,),
              Container(width: scrwidth*0.8,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(22),border: Border.all(color:Colors.indigo,width: 2)),
                child: Padding(
                  padding: EdgeInsets.only(left: scrwidth*0.08),
                  child: TextFormField(validator: (val){
                    if(val!.isEmpty==true)
                      return "Pls enter your username";
                  },decoration: InputDecoration(border: InputBorder.none,hintText: "Bank Number"),controller: _bankNum,),
                ),
              ),SizedBox(height: 10,),
              Container(
                width: scrwidth*0.8,decoration: BoxDecoration(borderRadius: BorderRadius.circular(22),border: Border.all(color:Colors.indigo,width: 2)),
                child: Padding(
                  padding:  EdgeInsets.only(left: scrwidth*0.08),
                  child: TextFormField(validator: (val){
                    if(val!.isEmpty==true)
                      return "Pls enter your Password";
                  },decoration: InputDecoration(hintText: "Money Amount "),controller: _Amount_money,),
                ),
              ),SizedBox(height: 10,),

            ],),),SizedBox(height: 5,),

            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Gender : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22),),
                  Container(
                    child: Row(children: [
                      Radio(value: 0, groupValue: _groupValue, onChanged: (value){
                        setState(() {
                          _groupValue=value as int;
                        });
                      }),Text("Male"),
                    ],),
                  ),
                  Container(
                    child: Row(children: [
                      Radio(value: 1, groupValue: _groupValue, onChanged: (value){
                        setState(() {
                          _groupValue=value as int;
                        });
                      }),Text("Female"),
                    ],),
                  ),
                ]
            ),
            RaisedButton(onPressed: (){
              if(_formkey.currentState!.validate()){
                Account acc = Account(
                  name:_username.text,
                  Amount:double.parse(_Amount_money.text),
                  password: _password.text,
                );
                //_databaseHelper.createAccount(acc);
              }
            },child: Text("SignUp"),),

          ],),
        ),
      ),
    );

  }
}