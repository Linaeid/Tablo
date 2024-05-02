import 'package:s_w_eproject/helper/Database.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'init_page_widget.dart' show InitPageWidget;
import 'package:flutter/material.dart';

class InitPageModel extends FlutterFlowModel<InitPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {


  }

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
