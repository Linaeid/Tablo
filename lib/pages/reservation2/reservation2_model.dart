import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:s_w_eproject/helper/Database.dart';
import 'package:s_w_eproject/helper/Helper.dart';
import 'package:s_w_eproject/helper/Reservation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'reservation2_widget.dart' show Reservation2Widget;
import 'package:flutter/material.dart';

class Reservation2Model extends FlutterFlowModel<Reservation2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  confirm(BuildContext context) async {
    if(dropDownValue2 ==''){
      Helper.showInfoMsg(context,"Please select occasion");
      return;
    }

    if(dropDownValue1 ==''){
      Helper.showInfoMsg(context,"Please select location");
      return;
    }

    AwesomeDialog progressDialog = Helper.progressDialog("Reserve...", context);
    progressDialog.show();
    var res_id = Database.reservation().doc().id;
    Reservation res =  Reservation(res_id,Database.current_user(),Helper.date,Helper.time,Helper.guests,dropDownValue1, dropDownValue2);
    Database.reservation().doc(res_id).set(res.toJson()).then((value) async {
      progressDialog.dismiss();
      Helper.toast("Reservation complete");
      context.pushReplacementNamed("UserPage");
    }).catchError((error) {
      progressDialog.dismiss();
      Helper.showErrorMsg(context, "Server error");
    });
  }

}
