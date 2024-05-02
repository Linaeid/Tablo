import 'package:chip_list/chip_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:s_w_eproject/helper/Helper.dart';

import '../../helper/Reservation.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'user_page_model.dart';
export 'user_page_model.dart';

class UserPageWidget extends StatefulWidget {
  const UserPageWidget({super.key});

  @override
  State<UserPageWidget> createState() => _UserPageWidgetState();
}

class _UserPageWidgetState extends State<UserPageWidget> {
  late UserPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserPageModel());
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
        backgroundColor: const Color(0xFFD33333),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: AppBar(
            backgroundColor: const Color(0xFFD33333),
            automaticallyImplyLeading: false,
            leading: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(-0.34, 0.06),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/images/4ogmy_1.png',
                      width: 139.0,
                      height: 24.0,
                      fit: BoxFit.fill,
                      alignment: const Alignment(0.0, 0.0),
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              PopupMenuButton<int>(
                  icon: Icon(Icons.menu),
                  itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                        new PopupMenuItem<int>(
                            value: 0, child: new Text('Profile')),
                        new PopupMenuItem<int>(
                            value: 1, child: new Text('About us')),
                        new PopupMenuItem<int>(
                            value: 2, child: new Text('Contact us')),
                      ],
                  onSelected: (int value) {
                    switch (value) {
                      case 0:
                        context.pushNamed("Profile");
                        break;

                      case 1:
                        context.pushNamed("Aboutus");
                        break;

                      case 2:
                        context.pushNamed("ContactUs");
                        break;
                    }
                  })
            ],
            centerTitle: false,
            toolbarHeight: 30.0,
            elevation: 10.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.network(
                          'https://images.unsplash.com/photo-1469234496837-d0101f54be3e?w=1280&h=720',
                        ).image,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/IMG_0504.JPG',
                        width: 300.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.11, 0.0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        16.0, 16.0, 16.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, -0.90),
                          child: ChipList(
                              listOfChipNames: [
                                "Current",
                                "Previous",
                              ],
                              activeBgColorList: [
                                const Color(0xFFD33333),
                              ],
                              inactiveBgColorList: [
                                Colors.white
                              ],
                              activeTextColorList: [
                                Colors.white
                              ],
                              inactiveTextColorList: [
                                const Color(0xFFD33333),
                              ],
                              listOfChipIndicesCurrentlySeclected: [
                                _model.status
                              ],
                              activeBorderColorList: [
                                Colors.white
                              ],
                              inactiveBorderColorList: [
                                const Color(0xFFD33333),
                              ],
                              style: TextStyle(fontSize: 20),
                              shouldWrap: true,
                              runSpacing: 10,
                              spacing: 30,
                              extraOnToggle: ((index) {
                                setState(() {
                                  _model.status = index;
                                });
                              })),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Container(
                            width: 358.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment:
                                      const AlignmentDirectional(0.0, 0.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.search),
                                      labelText: 'Search',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFD33333),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                    onChanged: (value) {
                                      setState(() {
                                        _model.search = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: StreamBuilder<QuerySnapshot>(
                          stream: _model.stream,
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return Center(child: Text("Server error"));
                            }
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return Container(
                                    height: double.infinity,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [CircularProgressIndicator()],
                                    ));

                              default:
                                if (snapshot.hasData &&
                                    snapshot.data!.docs.length == 0) {
                                  return Container(
                                      padding: EdgeInsets.only(top: 30),
                                      child: Center(
                                          child: Text("no reservations")));
                                } else {
                                  _model.documents = snapshot.data!.docs;
                                  _model.filter();
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        physics: ScrollPhysics(),
                                        itemCount: _model.documents.length,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5),
                                        itemBuilder: (cb, i) {
                                          Reservation res =
                                              Reservation.fromJson(
                                                  _model.documents[i].data()
                                                      as Map<String, dynamic>);
                                          return Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      10, 10.0, 10, 0),
                                              child: Slidable(
                                                // Specify a key if the Slidable is dismissible.
                                                key: const ValueKey(0),

                                                // The start action pane is the one at the left or the top side.
                                                startActionPane: ActionPane(
                                                    // A motion is a widget used to control how the pane animates.
                                                    motion:
                                                        const ScrollMotion(),
                                                    dragDismissible: false,
                                                    // All actions are defined in the children parameter.
                                                    children: [
                                                      // A SlidableAction can have an icon and/or a label.
                                                      SlidableAction(
                                                        onPressed: (BuildContext
                                                            c) async {
                                                          if(_model.status ==1){
                                                            Helper.toast("Cannot delete previous reservation");
                                                            return;
                                                          }
                                                          var confirmDialogResponse =
                                                              await showDialog<bool>(
                                                            context: context,
                                                            builder: (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: const Text('Delete reservation'),
                                                                content: const Text(
                                                                    'Are you sure delete reservation?'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                    child: const Text('No'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () {
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false);
                                                                      _model.delete(context,res.res_id);
                                                                    },
                                                                    child: const Text('Yes'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ) ??
                                                              false;
                                                        },
                                                        autoClose: false,
                                                        backgroundColor:
                                                            Color(0xFFFE4A49),
                                                        foregroundColor:
                                                            Colors.white,
                                                        icon: Icons.delete,
                                                        label: 'Delete',
                                                      ),
                                                      SlidableAction(
                                                        onPressed: (BuildContext
                                                            c) {
                                                          if(_model.status ==1){
                                                            Helper.toast("Cannot update previous reservation");
                                                            return;
                                                          }
                                                          Helper.res = res;
                                                          context.pushNamed("reservation3");
                                                        },
                                                        backgroundColor:
                                                            Colors.grey,
                                                        foregroundColor:
                                                            Colors.white,
                                                        icon: Icons.edit,
                                                        label: 'Update',
                                                      ),
                                                    ]),
                                                child: Container(
                                                  width: 358.0,
                                                  height: 155.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    border: Border(
                                                        left: BorderSide(
                                                      width: 2,
                                                      color: Color(0xFFFE4A49),
                                                      style: BorderStyle.solid,
                                                    )),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(
                                                        10.0,
                                                      ),
                                                      bottomRight:
                                                          Radius.circular(10.0),
                                                      topLeft:
                                                          Radius.circular(10.0),
                                                      topRight:
                                                          Radius.circular(10.0),
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -1.0, 1.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(10,
                                                              10.0, 0.0, 10),
                                                      child: Text(
                                                        '#${res.res_id.toString().substring(0, 6)}\n\n${res.time}                       ${res.date}\n\n${res.guests} guests                           ${res.location}\n\n${res.occasion} ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ));
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(
                                            height: 17,
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                }
                            }
                          },
                        )),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderRadius: 50.0,
                    buttonSize: 66.0,
                    fillColor: FlutterFlowTheme.of(context).alternate,
                    icon: Icon(
                      Icons.add_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 50.0,
                    ),
                    onPressed: () {
                      context.pushNamed("reservation");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
