import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:s_w_eproject/helper/Helper.dart';

import '../../flutter_flow/form_field_controller.dart';
import '../../helper/Database.dart';
import '../../helper/Reservation.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'reservation3_widget.dart' show Reservation3Widget;
import 'package:flutter/material.dart';

class Reservation3Model extends FlutterFlowModel<Reservation3Widget> {
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

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;

  Reservation? res;
  bool firstTime=true;

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

  update(BuildContext context) async {
    if(dropDownValue2 ==''){
      Helper.showInfoMsg(context,"Please select occasion");
      return;
    }

    if(dropDownValue1 ==''){
      Helper.showInfoMsg(context,"Please select location");
      return;
    }
    AwesomeDialog progressDialog = Helper.progressDialog("Update...", context);
    progressDialog.show();
    Reservation updated =  Reservation.update(res?.res_id,Database.current_user(),date_controller.text,time_controller.text,countControllerValue,dropDownValue1, dropDownValue2,res?.created_date,res?.timestamp);
    Database.reservation().doc(res?.res_id).set(updated.toJsonUpdated()).then((value) async {
      progressDialog.dismiss();
      Helper.toast("Reservation updated");
      Helper.close_current_page(context);
    }).catchError((error) {
      progressDialog.dismiss();
      Helper.showErrorMsg(context, "Server error");
    });
  }

}
