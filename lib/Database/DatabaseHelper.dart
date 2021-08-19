
import 'package:application/Models/ListView.dart';
import 'package:application/Models/PostInfo.dart';
import 'package:application/Models/UsersInfo.dart';
import 'package:application/Models/friends.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
class DatabaseHelper{
  DatabaseHelper.constructor();
  static DatabaseHelper _instence = DatabaseHelper.constructor();
  factory DatabaseHelper()=> _instence;

  final String _dbName = 'tasks.db';
  static Database? _db;
  String? puplishername;
  String? time;
  String? Text;
  String? image;

  Future<Database?> createDatabase()async{
    if(_db != null) return _db;

    String path = join(await getDatabasesPath(), _dbName);
    _db = await openDatabase(path, version: 1,
        onCreate:(Database db, int v){
          //TODO create tables
          db.execute('create table task(PK integer primary key autoincrement,'
              'text varchar(50),color varchar(50))');
          db.execute('create table users(PK integer primary key autoincrement,'
              'name varchar(50),username varchar(50) NOT NULL UNIQUE,password varchar(50),'
              'gender number(1),phoneNumber number);');
          db.execute('create table posts(PK integer primary key autoincrement,'
              'time time,text TEXT,image varchar2(200),'
              'like number(1),users integer,constraint posts_users_fk foreign key(users) references users(pk));');
          db.execute('create or replace trigger Posts_trigger '
              'before insert on posts for each row'
              'when(new.time is null)'
              'begin '
              'select sysdate into :new.time from dual;'
              'end Posts_trigger; ');
          db.execute('create table friends(PK integer primary key autoincrement,sender integer,reciever integer,time time,'
              'constraint _sender_FK foreign key (sender) references users(pk)');
        }


    );
    return _db;
  }

  Future<int> Insert_into_list(Listing account)async{
    Database? db =await createDatabase();
    return db!.insert('task', {
      'text': account.Textin,
      'color': account.Coloring
    });
  }

  Future<List>get_list()async{
    Database? db =await createDatabase();
    return db!.query('task');
  }
  DelteRevords()async{
    Database? db =await createDatabase();
    db!.delete('task');
  }


  Future<int> create_account(Users user)async{
    Database? db =await createDatabase();
    return db!.insert('users', {
      'name':user.name ,
      'username': user.email,
      'password': user.password,
      'gender' :  user.gender,
      'phoneNumber':  user.phonenumber,
    });
  }


  Future<List> getAccount(String username, String password)async{
    Database? db =await createDatabase();
    return db!.query('users',
        where: 'username = ? and password = ?',
        whereArgs: [username, password]
    );

  }


// post methods
  Future<int> add_post(Posts post)async{
    Database? db =await createDatabase();
    return db!.insert('posts', {
      'text': post.Text,
      'image': post.image,
      'like' :  post.like,
      'users':post.userID,
      'time':post.time,
    });
  }
  update(int color,int user)async{
    Database? db =await createDatabase();
    db!.update('posts',{
      'like':color,
    },where: 'PK = ?',whereArgs: [user]);
  }
  Future<List> get_posts(int user)async{
    Database? db =await createDatabase();
    return db!.query('posts',
      where: 'users = ? ',
      whereArgs: [user],orderBy: 'time',
    );

  }

  Future<List>Search_Contact(String user)async{
    Database? db =await createDatabase();
    return db!.query('users',
      where: 'username = ? ',
      whereArgs: [user],
    );

  }


  // search and add contact
  Future<int> add_friend(friends friend)async{
    Database? db =await createDatabase();
    return db!.insert('friends', {
      'sender':friend.sender,
      'reciever':friend.reciever,
      'time':friend.date,
    });
  }
}
