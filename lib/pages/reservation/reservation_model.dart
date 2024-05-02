import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:s_w_eproject/helper/Helper.dart';

import '../../helper/Database.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'reservation_widget.dart' show ReservationWidget;
import 'package:flutter/material.dart';

class ReservationModel extends FlutterFlowModel<ReservationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  FocusNode? dateFocusNode;
  DateTime selected_date = DateTime.now();
  TextEditingController? date_controller;
  late String date;
  FocusNode? timeFocusNode;
  Time selected_time =Time(hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute);
  TextEditingController? time_controller ;
  late String time;
  int? countControllerValue;
  final formKey = GlobalKey<FormState>();

  String? dateValidator(BuildContext, value) {
    if (value.toString().isEmpty) {
      return "Date required";
    }
    return null;
  }

  String? timeValidator(BuildContext, value) {
    if (value.toString().isEmpty) {
      return "Time required";
    }
    return null;
  }

  @override
  void initState(BuildContext context) {

  }

  @override
  void dispose() {
    unfocusNode.dispose();
    dateFocusNode?.dispose();
    date_controller?.dispose();
    timeFocusNode?.dispose();
    time_controller?.dispose();
  }

  confirm(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      Helper.date = date_controller.text;
      Helper.time = time_controller.text;
      Helper.guests = countControllerValue;
      AwesomeDialog progressDialog = Helper.progressDialog("Reserve...", context);
      progressDialog.show();
      if(await Database.check_exists_reservation(Helper.date,Helper.time) == true){
        progressDialog.dismiss();
        Helper.showInfoMsg(context,"Reservation not available at this time");
        return;
      }
      progressDialog.dismiss();
     context.pushNamed("reservation2");
    }
  }
}
