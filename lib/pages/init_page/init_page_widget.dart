import '../../helper/Database.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'init_page_model.dart';
export 'init_page_model.dart';

class InitPageWidget extends StatefulWidget {
  const InitPageWidget({super.key});

  @override
  State<InitPageWidget> createState() => _InitPageWidgetState();
}

class _InitPageWidgetState extends State<InitPageWidget> {
  late InitPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InitPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 0), () {
        if (Database.current_user() == "") {
          context.pushReplacementNamed("HomePage");
        }
        else {
          context.pushReplacementNamed("UserPage");
        }
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(),
    )));
  }
}
