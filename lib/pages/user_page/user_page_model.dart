import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:s_w_eproject/helper/Helper.dart';

import '../../helper/Database.dart';
import '../../helper/Reservation.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_page_widget.dart' show UserPageWidget;
import 'package:flutter/material.dart';

class UserPageModel
    extends FlutterFlowModel<UserPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final Stream<QuerySnapshot> stream =
  Database.reservation().orderBy("timestamp", descending: true).snapshots();
  List<DocumentSnapshot> documents = [];
  var status = 0;
  var search='';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  delete(BuildContext context,res_id){
    AwesomeDialog progressDialog = Helper.progressDialog("Delete...", context);
    progressDialog.show();
    Database.reservation().doc(res_id).delete().then((value) async {
      progressDialog.dismiss();
      Helper.toast("Delete complete");
      context.pushReplacementNamed('UserPage');
    }).catchError((error) {
      progressDialog.dismiss();
      Helper.showErrorMsg(context, "Server error");
    });
  }

  filter() {
    Iterable<DocumentSnapshot<Object?>> filter = documents.where((element) {
      return checkFilter(element);
    });
    documents = filter.toList();
  }

  bool checkFilter(DocumentSnapshot<Object?> doc) {
    Reservation res = Reservation.fromDocument(doc);
    List date = res.date.toString().split("-");
    List time = Helper.convertTime_to_24hours(res.time).split(":");
    DateTime now = DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,DateTime.now().hour,DateTime.now().minute,00);
    DateTime res_date =DateTime(int.parse(date[2]),int.parse(date[1]),int.parse(date[0]),int.parse(time[0]),int.parse(time[1]),00);

    bool result = res.user_id == Database.current_user();
    if (status == 0)
      result = result && (res_date.isAfter(now) || res_date.isAtSameMomentAs(now));
    else
      result = result && res_date.isBefore(now) ;

    if(search!=''){
      result = result && res.occasion.toString().toLowerCase().contains(search) || res.location.toString().toLowerCase().contains(search) || res.date.toString().toLowerCase().contains(search) || res.time.toString().toLowerCase().contains(search) || res.guests.toString().toLowerCase().contains(search) || res.res_id.toString().toLowerCase().contains(search);
    }

    return result;
  }
}
