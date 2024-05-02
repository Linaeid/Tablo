
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:s_w_eproject/helper/Reservation.dart';
class Database{

  static String current_user() {
    User? currentFirebaseUser = FirebaseAuth.instance.currentUser;
    if (currentFirebaseUser != null)
      return currentFirebaseUser.uid;
    else
      return "";
  }

  static logout() async {
    await FirebaseAuth.instance.signOut();
  }

  static CollectionReference users(){
    return FirebaseFirestore.instance.collection('user');
  }
  static CollectionReference reservation(){
    return FirebaseFirestore.instance.collection('reservation');
  }

  static Future<bool> check_exists_reservation(date,time) async {
    var snapshot = await reservation().where('date', isEqualTo:date).get();
    if (snapshot.docs.isEmpty) {
      return false;
    } else {
      for (var doc in snapshot.docs) {
        Reservation res = Reservation.fromDocument(doc);
        if(res.time.toString()==time.toString()){
          return true;
        }
      }
      return false;
    }
  }


}