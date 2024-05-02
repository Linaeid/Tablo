import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../helper/Helper.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'password_widget.dart' show PasswordWidget;
import 'package:flutter/material.dart';

class PasswordModel extends FlutterFlowModel<PasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;

  String? textControllerValidator(BuildContext, value) {
    if (value
        .toString()
        .isEmpty) {
      return "Email required";
    }
    if (!Helper.isEmailValid(value.toString())) {
      return "Invalid email";
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

  reset_password(BuildContext context) async {

    if (formKey.currentState!.validate()) {
      var email = textController.text;
      AwesomeDialog progressDialog =
      Helper.progressDialog('Reset', context);
      if (!await Helper.isInternetAvailable()) {
        Helper.showErrorMsg(context, "No internet");
      } else {
        progressDialog.show();
        try {
          await FirebaseAuth.instance.sendPasswordResetEmail(
            email: email,
          );
          progressDialog.dismiss();
          Helper.toast("Password recovery has been sent to your email");
          Navigator.pop(context);
        } catch (e) {
          progressDialog.dismiss();
          Helper.showErrorMsg(context, "User not found");
        }
      }
    }

  }
}
