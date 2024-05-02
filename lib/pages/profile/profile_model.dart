import 'package:awesome_dialog/awesome_dialog.dart';

import '../../helper/Helper.dart';
import '../../helper/Database.dart';
import '../../helper/Users.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;

  String? textControllerValidator(BuildContext, value) {
    if (value.toString().isEmpty) {
      return "Name required";
    }
    return null;
  }


  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  save(BuildContext context,Users user) async {
    if (formKey.currentState!.validate()) {
      var name = textController.text;

      AwesomeDialog progressDialog =
      Helper.progressDialog('Save...', context);
      if (!await Helper.isInternetAvailable()) {
        Helper.showErrorMsg(context, "No internet");
      } else {
        progressDialog.show();
        try {
          Users updated = Users(user.user_id,user. email,user. password, name);
          Database.users()
              .doc(user.user_id)
              .set(updated.toJson())
              .then((value) async {
            progressDialog.dismiss();
            Helper.toast("Saved successfully");
            Helper.close_current_page(context);
          }).catchError((error) {
            progressDialog.dismiss();
            Helper.showErrorMsg(context, "Server error");
          });
        } catch (e) {
          progressDialog.dismiss();
          Helper.showErrorMsg(context, e.toString());
        }
      }
    }
  }

  logout(BuildContext context) {
    Database.logout();
    context.pushReplacementNamed("HomePage");
  }
}
