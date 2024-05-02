import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../helper/Database.dart';
import '../../helper/Helper.dart';
import '../../helper/Users.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'signup_widget.dart' show SignupWidget;
import 'package:flutter/material.dart';

class SignupModel extends FlutterFlowModel<SignupWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;

  String? textController1Validator(BuildContext, value) {
    if (value.toString().isEmpty) {
      return "Email required";
    }
    if (!Helper.isEmailValid(value.toString())) {
      return "Invalid email";
    }
    return null;
  }

  String? textController2Validator(BuildContext, value) {
    if (value.toString().isEmpty) {
      return "Name required";
    }
    return null;
  }

  String? textController3Validator(BuildContext, value) {
    if (value.toString().length < 8) {
      return "Password at least 8 character";
    }
    return null;
  }

  String? textController4Validator(BuildContext, value) {
    if (value != textController3.text) {
      return "Passwords not match";
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

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();
  }

  signUp(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      var email = textController1.text;
      var name = textController2.text;
      var password = textController3.text;

      AwesomeDialog progressDialog =
          Helper.progressDialog('Sign Up...', context);
      if (!await Helper.isInternetAvailable()) {
        Helper.showErrorMsg(context, "No internet");
      } else {
        progressDialog.show();
        try {
          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);
          Users user = Users(Database.current_user(), email, password, name);
          Database.users()
              .doc(Database.current_user())
              .set(user.toJson())
              .then((value) async {
            Database.logout();
            progressDialog.dismiss();
            Helper.toast("Register complete.You can login");
            Helper.close_current_page(context);
          }).catchError((error) {
            progressDialog.dismiss();
            Helper.showErrorMsg(context, "Server error");
          });
        } on FirebaseAuthException catch (e) {
          progressDialog.dismiss();
          if (e.code == 'email-already-in-use') {
            Helper.showErrorMsg(context, "Email already exists");
          } else {
            Helper.showErrorMsg(context, "Server error");
          }
        } catch (e) {
          progressDialog.dismiss();
          Helper.showErrorMsg(context, e.toString());
        }
      }
    }
  }
}
