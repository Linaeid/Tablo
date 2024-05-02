import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class Reservation {
  var res_id;
  var user_id;
  var guests;
  var location;
  var occasion;
  var date;
  var time;
  var created_date;
  var timestamp;

  Reservation.empty([this.res_id='']);
  Reservation(this.res_id, this.user_id,this.date,this.time,this.guests,this.location,this.occasion);
  Reservation.update(this.res_id, this.user_id,this.date,this.time,this.guests,this.location,this.occasion,this.created_date,this.timestamp);


  Reservation.fromJson(Map<String, dynamic> data) {
    res_id = data['res_id'];
    user_id = data['user_id'];
    guests = data['guests'];
    location = data['location'];
    occasion = data['occasion'];
    date = data['date'];
    time = data['time'];
    created_date = data['created_date'];
    timestamp = data['timestamp'];
  }

  Map<String, dynamic> toJson() {
    Intl.systemLocale = "en_US";

    return {
      'res_id': res_id,
      'user_id': user_id,
      'guests': guests,
      'location': location,
      'occasion': occasion,
      'date': date,
      'time': time,
      'created_date': Jiffy.now().format(pattern: "d-M-y"),
      'timestamp': Timestamp.now(),
    };
  }

  Map<String, dynamic> toJsonUpdated() {
    return {
      'res_id': res_id,
      'user_id': user_id,
      'guests': guests,
      'location': location,
      'occasion': occasion,
      'date': date,
      'time': time,
      'created_date': created_date,
      'timestamp': timestamp,
    };
  }

  Reservation.fromDocument(DocumentSnapshot doc) {
    res_id = doc.get('res_id');
    user_id = doc.get('user_id');
    guests = doc.get('guests');
    location = doc.get('location');
    occasion = doc.get('occasion');
    date = doc.get('date');
    time = doc.get('time');
    created_date = doc.get('created_date');
    timestamp = doc.get('timestamp');
  }
}
