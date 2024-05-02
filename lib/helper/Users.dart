
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Helper.dart';

class Users {

  var user_id;
  var email;
  var password;
  var name;
  var timestamp;

  Users.empty([this.name="",this.email="",this.password="",this.user_id=""]);
  Users(this.user_id,this.email,this.password,this.name);

  Users.fromJson(Map<String, dynamic> data){
    user_id = data['user_id'];
    name= data['name'];
    email = data['email'];
    password = data['password'];
    timestamp = data['timestamp'];
  }
  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'name':name,
      'email' :email,
      'password' :password,
      'timestamp' :Timestamp.now(),
    };
  }

  Users.fromDocument(DocumentSnapshot doc){
    user_id = doc.get('user_id');
    name= doc.get('name');
    email = doc.get('email');
    password = doc.get('password');


  }

}
