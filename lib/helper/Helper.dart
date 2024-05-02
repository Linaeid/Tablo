import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import 'Reservation.dart';



class Helper {

  static Reservation? res;
  static var date;
  static var time;
  static var guests;

  static bool isEmailValid(text) {
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern.toString());
    return regex.hasMatch(text);
  }

  static Future<bool> isInternetAvailable() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  static String convertTime_to_24hours(String time){
    DateTime date= DateFormat.jm().parse(time);
    return DateFormat("HH:mm").format(date);
  }

  static String format_Time12hours(TimeOfDay timeOfDay) {
    final now = new DateTime.now();
    final dt = DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    final format = DateFormat.jm();
    return format.format(dt);
  }


  static int hour_to_12hours(int hour){
    int result = hour;
   if(hour > 12){
     result = hour - 12;
   }
   return result;
  }
  static close_current_page(context){
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      SystemNavigator.pop();
    }
  }


  static String format_TimeOfDay_24(TimeOfDay timeOfDay) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    final format = DateFormat.jm();
    return format.format(dt);
  }


  static AwesomeDialog progressDialog(String msg, var context) {
    return new AwesomeDialog(
        context: context,
        body: Container(
          margin: EdgeInsets.only(bottom: 50),
          child:
          Text(msg, style: TextStyle(color: Color(0xFFEE8B60),
              fontSize: 20,
              fontWeight: FontWeight.bold)),
        ),
        isDense: true,
        dismissOnBackKeyPress: false,
        dismissOnTouchOutside: false,
        customHeader: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 25),
                CircularProgressIndicator()
              ],)
        )
    );
  }


  static showInfoMsg(var context, String msg) {
    AwesomeDialog(
        context: context,
        body: Text(
          msg, style: TextStyle(fontSize: 16, color:Color(0xFFEE8B60)),),
        isDense: true,
        btnOkOnPress: () {},
        btnOkColor:Color(0xFFEE8B60),
        dismissOnBackKeyPress: false,
        dismissOnTouchOutside: false,
        customHeader: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Icon(Icons.info, color: Color(0xFFEE8B60), size: 50),
          ],)
    )
      ..show();
  }

  static showErrorMsg(var context, String msg) {
    AwesomeDialog(
        context: context,
        body: Text(
          msg, style: TextStyle(fontSize: 16, color:Color(0xFFEE8B60)),),
        isDense: true,
        btnOkOnPress: () {},
        btnOkColor:Color(0xFFEE8B60),
        dismissOnBackKeyPress: false,
        dismissOnTouchOutside: false,
        customHeader: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Icon(Icons.warning, color: Colors.red, size: 50),
          ],)
    )
      ..show();
  }


  static toast(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Color(0xFFEE8B60),
        textColor: Colors.white,
        fontSize: 16.0
    );
  }


}
