import 'package:intl/intl.dart';

class Notify{
   String? Sender,Reciever,Date,name,Text;
   Notify({this.Sender,this.Reciever,this.Date,this.name,this.Text});




   String getDate(){
     DateTime now = DateTime.now();
     DateFormat formatter = DateFormat.yMd().add_jm();
     String formatted = formatter.format(now);
     return formatted;
   }

   Map<String,dynamic>ToMap(){
     Map<String,dynamic>m={
       'Sender':this.Sender,
       'Reciever':this.Reciever,
       'Date':getDate(),
       'name':this.name,
       'Text':this.Text
     };
     return m;
   }

}