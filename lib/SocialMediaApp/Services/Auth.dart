import 'package:firebase_auth/firebase_auth.dart';
import 'package:application/SocialMediaApp/Services/userdata.dart';
import 'package:flutter/material.dart';

class Auth{
  final FirebaseAuth _auth=FirebaseAuth.instance;
Future  SignIn(String email,String password) async {
    try{
      // UserCredential user=
      UserCredential res=  await _auth.signInWithEmailAndPassword(email: email, password: password);
      UserDate.email=res.user!.email;
      return true;
    } on FirebaseAuthException  catch(e){
     print(e.code);
      return false;
    }
  }
  Future Sigup(String email,String password) async {
    try{
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
    return true;

  }on FirebaseAuthException catch (e){
      print(e.code);
      return false;
    }
  }
}
