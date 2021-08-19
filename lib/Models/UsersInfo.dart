class Users{
  int? pk,gender,phonenumber;
  String? name,email,password;
  Users({this.pk:0,this.password:" ",this.email,this.gender,this.name,this.phonenumber:0});


 Map<String,dynamic> toMap(){
   Map<String,dynamic> m={
    // 'gender':this.gender==0?'Male':'Female',
     'phonenumber':this.phonenumber,
     'email':this.email,
     'name':this.name,
     'gender':this.gender==0?'male':'Female'
   };
   return m;
 }
}