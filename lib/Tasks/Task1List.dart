import 'package:flutter/material.dart';
import 'package:application/Database/DatabaseHelper.dart';
import 'package:application/Models/ListView.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
   DatabaseHelper _databaseHelper= new DatabaseHelper();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _databaseHelper = DatabaseHelper();
  }
  int bankNum=0;

  TextEditingController _CL = TextEditingController();
  TextEditingController _text = TextEditingController();
  TextEditingController _banknum=TextEditingController();
  int  count=0;
  int? count2;
  List current=[];
  final _keyForm = GlobalKey<FormState>();
  List exampleList=[];
  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;
    double ScreenHeight = MediaQuery.of(context).size.width;
    _databaseHelper.get_list().then((value) => exampleList = value);
    if(!exampleList.isEmpty){
      count2= exampleList.length;
      current=exampleList ;
    }
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Container(
            width: ScreenWidth,
            child: Column(
              children: [
                Form(
                  key: _keyForm,
                  child: Row(
                    children: [
                      Container(
                        width: ScreenWidth / 3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(color: Colors.indigo, width: 1)),
                        child: Padding(
                          padding: EdgeInsets.only(left: ScreenWidth * 0.08),
                          child: TextFormField(
                            controller: _text,
                            validator: (val) {
                              if (val!.isEmpty == true || val == null)
                                return "pls enter text";
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "Text"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: ScreenHeight * 0.05,
                      ),
                      Container(
                        width: ScreenWidth / 3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(color: Colors.indigo, width: 2)),
                        child: Padding(
                          padding: EdgeInsets.only(left: ScreenWidth * 0.08),
                          child: TextFormField(
                            controller: _CL,
                            validator: (val) {
                              if (val!.isEmpty == true)
                                return "Pls enter  color";
                            },
                            decoration: InputDecoration(hintText: "Color"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: ScreenHeight * 0.02,
                      ),
                      RaisedButton(
                        onPressed: () async {

                          if (_keyForm.currentState!.validate()) {
                            //TODO create account
                            bankNum = await _databaseHelper.Insert_into_list(
                                Listing(Textin: _text.text, Coloring: _CL.text)
                            );
                            count=bankNum;
                          }
                          _text.text=" ";
                          _CL.text=" ";
                        },
                        child: Text("ADD"),
                      ),SizedBox(height: 100,)
                    ],
                  ),
                ),
              Container(
                width: ScreenWidth,
                height: ScreenHeight,
                child: ListView.builder(itemCount: count2,itemBuilder: (BuildContext context, index){
                  /*Color color = new Color(exampleList[index]['color']);
                  String ex= color.toString();
                  int value =int.parse(ex,radix: 16);*/
                 /* if(current.isEmpty==true)
                    return null;*/
                  return Padding(
                    padding: EdgeInsets.only(bottom:20),
                    child: Container(
                      color:  Colors.amber,
                      width: ScreenWidth,
                      height: 50,
                      child: Center(child: Text(current[index]['text'])),
                    ),
                  );
                }),
              )


              ],
            )),
      ),
    );
  }
}

Future<int> Counting(List l)async {
  Map count =  await l[0];

  if(l.isEmpty)
    return 1;
  else
    return count[0];
}
