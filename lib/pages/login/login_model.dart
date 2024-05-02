import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:s_w_eproject/helper/Helper.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;


  String? textController1Validator(BuildContext, value) {
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


  String? textController2Validator(BuildContext, value) {
    if (value
        .toString()
        .isEmpty) {
      return "Password required";
    }
    return null;
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }

  login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      var email = textController1.text;
      var password = textController2.text;

      AwesomeDialog progressDialog =
      Helper.progressDialog('Login', context);

      if (!await Helper.isInternetAvailable()) {
        Helper.showErrorMsg(context, "No internet");
      } else {
        progressDialog.show();
        try {
          await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          context.pushReplacementNamed("UserPage");
        } on FirebaseAuthException {
          progressDialog.dismiss();
          Helper.showErrorMsg(context, "Invalid email or password");
        } catch (e) {
          progressDialog.dismiss();
          Helper.toast("Server error");
        }
      }
    }
  }
}
