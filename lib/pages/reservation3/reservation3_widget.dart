import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:s_w_eproject/pages/reservation2/reservation2_widget.dart';

import '../../flutter_flow/flutter_flow_drop_down.dart';
import '../../flutter_flow/form_field_controller.dart';
import '../../helper/Helper.dart';
import '../../helper/Reservation.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reservation3_model.dart';
export 'reservation3_model.dart';

class Reservation3Widget extends StatefulWidget {
  const Reservation3Widget({super.key});

  @override
  State<Reservation3Widget> createState() => _Reservation3WidgetState();
}

class _Reservation3WidgetState extends State<Reservation3Widget> {
  late Reservation3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Reservation3Model());

    _model.date_controller ??= TextEditingController();
    _model.dateFocusNode ??= FocusNode();
    _model.time_controller ??= TextEditingController();
    _model.timeFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _model.res = Helper.res;
    if(_model.firstTime){
      _model.date_controller.text = _model.res?.date;
      _model.time_controller.text = _model.res?.time;
      _model.dropDownValue1 = _model.res?.location;
      _model.dropDownValue2 = _model.res?.occasion;
      _model.countControllerValue = _model.res?.guests;
      _model.firstTime =false;
    }
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: const Color(0xFFD33333),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Update reservation',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 10.0,
        ),
        body:  SafeArea(
    top: true,
    child: Form(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    key: _model.formKey,
    child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(-0.94, -0.83),
                child:   Align(
                  alignment: const AlignmentDirectional(0.0, -0.90),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: TextFormField(
                      keyboardType: TextInputType.none,
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: _model.selected_date,
                            helpText: "Reservation date",
                            firstDate: DateTime.now().subtract(Duration(days: 0)),
                            lastDate: DateTime(2101));
                        if (picked != null && picked != _model.selected_date)
                          setState(() {
                            _model.time_controller.text ='';
                            _model.selected_date = picked;
                            _model.date_controller.text =
                                new DateFormat('dd-MM-yyyy')
                                    .format(_model.selected_date);
                          });
                      },
                      controller: _model.date_controller,
                      focusNode: _model.dateFocusNode,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Date',
                        labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                        hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFD33333),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                      minLines: null,
                      validator:(s) => _model.dateValidator(context,s),
                    ),
                  ),
              )),
              Align(
                alignment: const AlignmentDirectional(0.0, -0.68),
                child:  Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: TextFormField(
                    keyboardType: TextInputType.none,
                    onTap: () async {
                      if( _model.date_controller.text ==  new DateFormat('dd-MM-yyyy')
                          .format(DateTime.now()) && TimeOfDay.now().hour >=23){
                        Helper.toast("No times");
                        return;
                      }
                      _model.selected_time =Time(hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute);
                      Navigator.of(context).push(
                          showPicker(
                            value:  _model.selected_time,
                            context: context,
                            onChange: (date) {
                              setState(() {
                                _model.selected_time = date;
                                _model.time_controller.text =
                                    Helper.format_Time12hours( _model.selected_time);
                              });
                            },
                            minHour:  _model.date_controller.text ==  new DateFormat('dd-MM-yyyy')
                                .format(DateTime.now())?TimeOfDay.now().hour.toDouble():00,
                            minMinute:  _model.date_controller.text ==  new DateFormat('dd-MM-yyyy')
                                .format(DateTime.now())?TimeOfDay.now().minute.toDouble():00,
                          )
                      );
                    },
                    controller: _model.time_controller,
                    focusNode: _model.timeFocusNode,
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Time',
                      labelStyle:
                      FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                      hintStyle:
                      FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFD33333),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0.0,
                    ),
                    minLines: null,
                    validator:(s) => _model.timeValidator(context,s),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.12, -0.40),
                child: Container(
                  width: 160.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 2.0,
                    ),
                  ),
                  child: FlutterFlowCountController(
                    decrementIconBuilder: (enabled) => FaIcon(
                      FontAwesomeIcons.minus,
                      color: enabled
                          ? FlutterFlowTheme.of(context).secondaryText
                          : FlutterFlowTheme.of(context).alternate,
                      size: 20.0,
                    ),
                    incrementIconBuilder: (enabled) => FaIcon(
                      FontAwesomeIcons.plus,
                      color: enabled
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).alternate,
                      size: 20.0,
                    ),
                    countBuilder: (count) => Text(
                      count.toString(),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Outfit',
                            letterSpacing: 0.0,
                          ),
                    ),
                    count: _model.countControllerValue ??= 1,
                    updateCount: (count) {
                      setState(() => _model.countControllerValue = count);
                    },
                    minimum: 1,
                    stepSize: 1,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.83,-0.40),
                child: Text(
                  'Guests',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 19.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.07, 0.12),
                child: FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController1 ??=
                      FormFieldController<String>(
                        _model.dropDownValue1 ??= '',
                      ),
                  options: List<String>.from(['Indoor', 'Outdoor']),
                  optionLabels: const ['Indoor', 'Outdoor'],
                  onChanged: (val) =>
                      setState(() => _model.dropDownValue1 = val),
                  width: 248.0,
                  height: 59.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    fontSize: 19.0,
                    letterSpacing: 0.0,
                  ),
                  hintText: 'Location',
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 2.0,
                  borderColor: FlutterFlowTheme.of(context).alternate,
                  borderWidth: 2.0,
                  borderRadius: 8.0,
                  margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                  hidesUnderline: true,
                  isOverButton: true,
                  isSearchable: false,
                  isMultiSelect: false,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.06, -0.10),
                child: FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController2 ??=
                      FormFieldController<String>(
                        _model.dropDownValue2 ??= '',
                      ),
                  options: List<String>.from([
                    'Birthday',
                    'Anniversarie',
                    'Business meeting',
                    'Graduation'
                  ]),
                  optionLabels: const [
                    'Birthday',
                    'Anniversarie',
                    'Business meeting',
                    'Graduation'
                  ],
                  onChanged: (val) =>
                      setState(() => _model.dropDownValue2 = val),
                  width: 248.0,
                  height: 59.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    fontSize: 19.0,
                    letterSpacing: 0.0,
                  ),
                  hintText: 'occasion',
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 2.0,
                  borderColor: FlutterFlowTheme.of(context).alternate,
                  borderWidth: 2.0,
                  borderRadius: 8.0,
                  margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                  hidesUnderline: true,
                  isOverButton: true,
                  isSearchable: false,
                  isMultiSelect: false,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.06, 0.40),
                child: FFButtonWidget(
                  onPressed: () {
                    _model.update(context);
                  },
                  text: 'Update',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: const Color(0xFFD33333),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
