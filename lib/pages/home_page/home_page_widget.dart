import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:url_launcher/url_launcher.dart';

import '/flutter_flow/flutter_flow_animations.dart';
import 'package:delayed_widget/delayed_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'dart:ui';
import 'package:lottie/lottie.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(2.0, 2.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(100.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(100.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(100.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-100.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(100.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };
  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void scrollAnimated(double position) {
    _controller.animateTo(position,
        duration: Duration(seconds: 1), curve: Curves.ease);
  }

  final TextEditingController Name = TextEditingController();
  final TextEditingController Email = TextEditingController();
  final TextEditingController Details = TextEditingController();
  String requestStatus = "";
  DatabaseReference ref = FirebaseDatabase.instance.ref("Requests");
  int requestSent = 0;

  whatsapp() async {
    launchUrl(Uri.parse('https://wa.me/+96170858410?text=Hi Catalyst Team'),
        mode: LaunchMode.externalApplication);
  }

  Future<String> addRequest() async {
    try {
      CollectionReference Requests =
          FirebaseFirestore.instance.collection('Requests');
      // Call the user's CollectionReference to add a new user
      await Requests.doc(
        "${Name.text} - ${DateTime.now().toString()}",
      ).set({
        'Name': Name.text,
        'Email': Email.text,
        'mobile': mobileApp,
        'web': website,
        'brandIdentity': Branding,
        'analysis': dataAnalysis,
        'date': DateTime.now().toString(),
        'details': Details.text,
      });
      requestSent = requestSent + 1;
      return 'success';
    } catch (e) {
      requestSent = -1;
      return 'Error adding user';
    }
  }

  bool isHome = true;
  bool isWorks = false;
  bool isAbout = false;
  bool isService = false;

  bool onHoverReachOut = false;
  bool onHoverServices1 = false;
  bool onHoverServices2 = false;
  bool onHoverServices3 = false;
  bool onHoverProjects = false;
  bool mobileApp = false;
  bool website = false;
  bool dataAnalysis = false;
  bool Branding = false;
  bool contactus = false;
  @override
  Widget build(BuildContext context) {
    var WebServices = GlobalKey();
    var WebWorks = GlobalKey();
    var WebAbout = GlobalKey();
    var WebContact = GlobalKey();
    var WebReachout = GlobalKey();
    var MobileWorks = GlobalKey();
    var MobileContact = GlobalKey();
    var MobileReachOut = GlobalKey();
    return GestureDetector(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF10141C),
        body: SafeArea(
            top: true,
            child: MediaQuery.of(context).size.width > 1000
                ? Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 100.0, 20.0, 0.0),
                        child: SingleChildScrollView(
                          controller: _controller,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    150, 100, 80, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.5,
                                      decoration: BoxDecoration(),
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 20, 0, 1),
                                                  child: Text(
                                                    'Your Vision',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'HANK',
                                                          color:
                                                              Color(0xDDFFFFFF),
                                                          fontSize: 75,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 15, 20, 0),
                                                      child: Container(
                                                        width: 200,
                                                        height: 20,
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              Color(0xFFA3D8F4),
                                                              Color(0xFF28DF99)
                                                            ],
                                                            stops: [0, 1],
                                                            begin:
                                                                AlignmentDirectional(
                                                                    1, 0),
                                                            end:
                                                                AlignmentDirectional(
                                                                    -1, 0),
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(2,
                                                                      2, 2, 2),
                                                          child: Container(
                                                            width: 100,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF10141C),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  1, 10, 10, 5),
                                                      child: Text(
                                                        'Our Code',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'HANK',
                                                                  color: Color(
                                                                      0xDDFFFFFF),
                                                                  fontSize: 75,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 25),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'One',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'HANK',
                                                                  color: Color(
                                                                      0xDDFFFFFF),
                                                                  fontSize: 75,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                      Stack(
                                                        children: [
                                                          GradientText(
                                                            ' Solution',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'HANK',
                                                                  fontSize: 75,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                            colors: [
                                                              Color(0xFFA3D8F4),
                                                              Color(0xFF28DF99)
                                                            ],
                                                            gradientDirection:
                                                                GradientDirection
                                                                    .ltr,
                                                            gradientType:
                                                                GradientType
                                                                    .linear,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 0, 0),
                                        child: Container(
                                          width: 100,
                                          height: 450,
                                          decoration: BoxDecoration(),
                                          child: Stack(
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 400,
                                                        height: 400,
                                                        decoration:
                                                            BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 5,
                                                              color: Color(
                                                                  0xFFA3D8F4),
                                                              offset:
                                                                  Offset(0, 0),
                                                              spreadRadius: 5,
                                                            )
                                                          ],
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image:
                                                                Image.network(
                                                              'https://i.ibb.co/WsZMrb1/magicpattern-mesh-gradient-1698853367731.png',
                                                            ).image,
                                                          ),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Container(
                                                          width: 100,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x2D000000),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        10,
                                                                        10,
                                                                        10),
                                                            child:
                                                                Lottie.network(
                                                              'https://lottie.host/1312ed64-42ee-4af0-baea-3f4975251010/yK9u7KsyNh.json',
                                                              width: 100,
                                                              height: 100,
                                                              fit: BoxFit.cover,
                                                              animate: true,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Material(
                                      color: Colors.transparent,
                                      elevation: 20,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: InkWell(
                                        splashFactory: NoSplash.splashFactory,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          Scrollable.ensureVisible(
                                              duration:
                                                  Duration(milliseconds: 900),
                                              WebContact.currentContext!);
                                        },
                                        onHover: (value) {
                                          setState(() {
                                            onHoverReachOut = value;
                                          });
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 400),
                                          width: onHoverReachOut ? 260 : 220,
                                          height: 55,
                                          decoration: BoxDecoration(
                                            color: onHoverReachOut
                                                ? Color(0xFFA3D8F4)
                                                : Color(0xFF10141C),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4,
                                                color: Color(0xFFA3D8F4),
                                                offset: Offset(0, 0),
                                                spreadRadius: 3,
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    1, 1, 1, 1),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: Text(
                                                    'Reach Out',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'HANK',
                                                          color: !onHoverReachOut
                                                              ? Color(
                                                                  0xDDFFFFFF)
                                                              : Color(
                                                                  0xFF10141C),
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.navigate_next,
                                                  color: Colors.white,
                                                  size: 24,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 80,
                                      height: 100,
                                      decoration: BoxDecoration(),
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      elevation: 20,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: InkWell(
                                        splashFactory: NoSplash.splashFactory,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          Scrollable.ensureVisible(
                                              duration:
                                                  Duration(milliseconds: 900),
                                              WebWorks.currentContext!);
                                        },
                                        onHover: (value) {
                                          setState(() {
                                            onHoverProjects = value;
                                          });
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 400),
                                          width: onHoverProjects ? 260 : 220,
                                          height: 55,
                                          decoration: BoxDecoration(
                                            color: onHoverProjects
                                                ? Color(0xFF28DF99)
                                                : Color(0xFF10141C),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4,
                                                color: Color(0xFF28DF99),
                                                offset: Offset(0, 0),
                                                spreadRadius: 3,
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    1, 1, 1, 1),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: Text(
                                                    'Projects',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'HANK',
                                                          color: !onHoverProjects
                                                              ? Color(
                                                                  0xDDFFFFFF)
                                                              : Color(
                                                                  0xFF10141C),
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 225.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            25.0, 25.0, 25.0, 25.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      height: 20,
                                                      key: WebServices,
                                                    ),
                                                    SelectableText(
                                                      'Our Services',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'HANK',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 35.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.7,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: SelectableText(
                                                          'Our services are defined by excellence, tailored to your unique needs, and driven by innovation. We\'re here to propel your business in the digital age',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'HANK',
                                                                color: Color(
                                                                    0x66FFFFFF),
                                                                fontSize: 26.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            80, 75, 80, 25),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFA3D8F4),
                                                      Color(0xFF28DF99)
                                                    ],
                                                    stops: [0, 1],
                                                    begin: AlignmentDirectional(
                                                        0, -1),
                                                    end: AlignmentDirectional(
                                                        0, 1),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(3, 3, 3, 3),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 15,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18),
                                                    ),
                                                    child: Container(
                                                      width: 550,
                                                      height: 302,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF10141C),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(18),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(15,
                                                                    15, 15, 15),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation: 25,
                                                                  shape:
                                                                      const CircleBorder(),
                                                                  child:
                                                                      Container(
                                                                    width: 25,
                                                                    height: 25,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFF28DF99),
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              3,
                                                                              3,
                                                                              3,
                                                                              3),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            100,
                                                                        height:
                                                                            100,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          gradient:
                                                                              LinearGradient(
                                                                            colors: [
                                                                              Color(0xFFA3D8F4),
                                                                              Color(0xFF28DF99)
                                                                            ],
                                                                            stops: [
                                                                              0,
                                                                              1
                                                                            ],
                                                                            begin:
                                                                                AlignmentDirectional(0, -1),
                                                                            end:
                                                                                AlignmentDirectional(0, 1),
                                                                          ),
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      SelectableText(
                                                                    'Mobile Applications',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'HANK',
                                                                          color:
                                                                              Color(0xD1FFFFFF),
                                                                          fontSize:
                                                                              25,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          30,
                                                                          0,
                                                                          50),
                                                              child:
                                                                  SelectableText(
                                                                'Our Mobile Development Service excels in crafting tailored, user-centric apps for iOS and Android, emphasizing user experience, performance, and security. We deliver seamless, reliable, and secure applications. Rely on our expertise to expand your reach and stay competitive in the mobile-centric market.',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'QuickSand',
                                                                      color: Color(
                                                                          0x9EFFFFFF),
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          false,
                                                                      lineHeight:
                                                                          1.5,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 25, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFA3D8F4),
                                                      Color(0xFF28DF99)
                                                    ],
                                                    stops: [0, 1],
                                                    begin: AlignmentDirectional(
                                                        0, -1),
                                                    end: AlignmentDirectional(
                                                        0, 1),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFA3D8F4),
                                                      Color(0xFF28DF99)
                                                    ],
                                                    stops: [0, 1],
                                                    begin: AlignmentDirectional(
                                                        0, -1),
                                                    end: AlignmentDirectional(
                                                        0, 1),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(3, 3, 3, 3),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 15,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18),
                                                    ),
                                                    child: Container(
                                                      width: 550,
                                                      height: 302,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF10141C),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(18),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(15,
                                                                    15, 15, 15),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation: 25,
                                                                  shape:
                                                                      const CircleBorder(),
                                                                  child:
                                                                      Container(
                                                                    width: 25,
                                                                    height: 25,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFF28DF99),
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              3,
                                                                              3,
                                                                              3,
                                                                              3),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            100,
                                                                        height:
                                                                            100,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          gradient:
                                                                              LinearGradient(
                                                                            colors: [
                                                                              Color(0xFFA3D8F4),
                                                                              Color(0xFF28DF99)
                                                                            ],
                                                                            stops: [
                                                                              0,
                                                                              1
                                                                            ],
                                                                            begin:
                                                                                AlignmentDirectional(0, -1),
                                                                            end:
                                                                                AlignmentDirectional(0, 1),
                                                                          ),
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      SelectableText(
                                                                    'Web Development',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'HANK',
                                                                          color:
                                                                              Color(0xD1FFFFFF),
                                                                          fontSize:
                                                                              25,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          30,
                                                                          0,
                                                                          50),
                                                              child:
                                                                  SelectableText(
                                                                'We are experts in crafting responsive and dynamic web solutions that not only showcase your brand effectively but also provide seamless user experiences. Whether it\'s a corporate website, e-commerce platform, or web application, we leverage cutting-edge technologies to build robust online solutions.',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'QuickSand',
                                                                      color: Color(
                                                                          0x9EFFFFFF),
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          false,
                                                                      lineHeight:
                                                                          1.5,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            80, 0, 80, 80),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFA3D8F4),
                                                      Color(0xFF28DF99)
                                                    ],
                                                    stops: [0, 1],
                                                    begin: AlignmentDirectional(
                                                        0, -1),
                                                    end: AlignmentDirectional(
                                                        0, 1),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(3, 3, 3, 3),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 15,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18),
                                                    ),
                                                    child: Container(
                                                      width: 550,
                                                      height: 302,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF10141C),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(18),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(15,
                                                                    15, 15, 15),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation: 25,
                                                                  shape:
                                                                      const CircleBorder(),
                                                                  child:
                                                                      Container(
                                                                    width: 25,
                                                                    height: 25,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFF28DF99),
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              3,
                                                                              3,
                                                                              3,
                                                                              3),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            100,
                                                                        height:
                                                                            100,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          gradient:
                                                                              LinearGradient(
                                                                            colors: [
                                                                              Color(0xFFA3D8F4),
                                                                              Color(0xFF28DF99)
                                                                            ],
                                                                            stops: [
                                                                              0,
                                                                              1
                                                                            ],
                                                                            begin:
                                                                                AlignmentDirectional(0, -1),
                                                                            end:
                                                                                AlignmentDirectional(0, 1),
                                                                          ),
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      SelectableText(
                                                                    'Data Analysis',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'HANK',
                                                                          color:
                                                                              Color(0xD1FFFFFF),
                                                                          fontSize:
                                                                              25,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          30,
                                                                          0,
                                                                          50),
                                                              child:
                                                                  SelectableText(
                                                                'We leverage data\'s potential as your business asset, employing advanced analytics and visualization to extract actionable insights. Our services enhance decision-making, streamline operations, and deepen customer understanding, giving you a competitive edge through informed choices.',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'QuickSand',
                                                                      color: Color(
                                                                          0x9EFFFFFF),
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          false,
                                                                      lineHeight:
                                                                          1.5,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 25, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFA3D8F4),
                                                      Color(0xFF28DF99)
                                                    ],
                                                    stops: [0, 1],
                                                    begin: AlignmentDirectional(
                                                        0, -1),
                                                    end: AlignmentDirectional(
                                                        0, 1),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFA3D8F4),
                                                      Color(0xFF28DF99)
                                                    ],
                                                    stops: [0, 1],
                                                    begin: AlignmentDirectional(
                                                        0, -1),
                                                    end: AlignmentDirectional(
                                                        0, 1),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(3, 3, 3, 3),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 15,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18),
                                                    ),
                                                    child: Container(
                                                      width: 550,
                                                      height: 302,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF10141C),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(18),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(15,
                                                                    15, 15, 15),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation: 25,
                                                                  shape:
                                                                      const CircleBorder(),
                                                                  child:
                                                                      Container(
                                                                    width: 25,
                                                                    height: 25,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFF28DF99),
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              3,
                                                                              3,
                                                                              3,
                                                                              3),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            100,
                                                                        height:
                                                                            100,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          gradient:
                                                                              LinearGradient(
                                                                            colors: [
                                                                              Color(0xFFA3D8F4),
                                                                              Color(0xFF28DF99)
                                                                            ],
                                                                            stops: [
                                                                              0,
                                                                              1
                                                                            ],
                                                                            begin:
                                                                                AlignmentDirectional(0, -1),
                                                                            end:
                                                                                AlignmentDirectional(0, 1),
                                                                          ),
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      SelectableText(
                                                                    'Brand Identity',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'HANK',
                                                                          color:
                                                                              Color(0xD1FFFFFF),
                                                                          fontSize:
                                                                              25,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          30,
                                                                          0,
                                                                          50),
                                                              child:
                                                                  SelectableText(
                                                                'Through our Brand Identity service, we meticulously craft a unique image for your business, incorporating logos, color palettes, typography, and compelling messaging. This ensures consistent brand representation and fosters recognition, trust, and lasting customer loyalty, giving you a competitive edge in the market.',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'QuickSand',
                                                                      color: Color(
                                                                          0x9EFFFFFF),
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          false,
                                                                      lineHeight:
                                                                          1.5,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 0,
                                key: WebWorks,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 130.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SelectableText(
                                      'Our Work',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'HANK',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 35.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.7,
                                        decoration: BoxDecoration(),
                                        child: SelectableText(
                                          'Here are some examples of projects our talented team has successfully worked on.',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'HANK',
                                                color: Color(0x66FFFFFF),
                                                fontSize: 26.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    80, 75, 80, 25),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFFA3D8F4),
                                              Color(0xFF28DF99)
                                            ],
                                            stops: [0, 1],
                                            begin: AlignmentDirectional(0, -1),
                                            end: AlignmentDirectional(0, 1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  3, 3, 3, 3),
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 15,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                            child: Container(
                                              width: 550,
                                              height: 302,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF10141C),
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 15, 15, 15),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 25,
                                                          shape:
                                                              const CircleBorder(),
                                                          child: Container(
                                                            width: 25,
                                                            height: 25,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF28DF99),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          3,
                                                                          3,
                                                                          3,
                                                                          3),
                                                              child: Container(
                                                                width: 100,
                                                                height: 100,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFFA3D8F4),
                                                                      Color(
                                                                          0xFF28DF99)
                                                                    ],
                                                                    stops: [
                                                                      0,
                                                                      1
                                                                    ],
                                                                    begin:
                                                                        AlignmentDirectional(
                                                                            0,
                                                                            -1),
                                                                    end:
                                                                        AlignmentDirectional(
                                                                            0,
                                                                            1),
                                                                  ),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(15,
                                                                      0, 0, 0),
                                                          child: SelectableText(
                                                            'SwiftRide',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'HANK',
                                                                  color: Color(
                                                                      0xD1FFFFFF),
                                                                  fontSize: 25,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 30, 0, 50),
                                                      child: SelectableText(
                                                        'SwiftRide is a cutting-edge, on-demand transportation app that revolutionizes the way people move from one place to another. With a seamless user experience and a vast network of drivers, SwiftRide provides a convenient, safe, and reliable solution for getting around town, whether it\'s a quick ride to the grocery store or a long-distance trip',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'QuickSand',
                                                              color: Color(
                                                                  0x9EFFFFFF),
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              useGoogleFonts:
                                                                  false,
                                                              lineHeight: 1.5,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 25, 0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFFA3D8F4),
                                              Color(0xFF28DF99)
                                            ],
                                            stops: [0, 1],
                                            begin: AlignmentDirectional(0, -1),
                                            end: AlignmentDirectional(0, 1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFFA3D8F4),
                                              Color(0xFF28DF99)
                                            ],
                                            stops: [0, 1],
                                            begin: AlignmentDirectional(0, -1),
                                            end: AlignmentDirectional(0, 1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  3, 3, 3, 3),
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 15,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                            child: Container(
                                              width: 550,
                                              height: 302,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF10141C),
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 15, 15, 15),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 25,
                                                          shape:
                                                              const CircleBorder(),
                                                          child: Container(
                                                            width: 25,
                                                            height: 25,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF28DF99),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          3,
                                                                          3,
                                                                          3,
                                                                          3),
                                                              child: Container(
                                                                width: 100,
                                                                height: 100,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFFA3D8F4),
                                                                      Color(
                                                                          0xFF28DF99)
                                                                    ],
                                                                    stops: [
                                                                      0,
                                                                      1
                                                                    ],
                                                                    begin:
                                                                        AlignmentDirectional(
                                                                            0,
                                                                            -1),
                                                                    end:
                                                                        AlignmentDirectional(
                                                                            0,
                                                                            1),
                                                                  ),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(15,
                                                                      0, 0, 0),
                                                          child: SelectableText(
                                                            'OnlineAdvisor',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'HANK',
                                                                  color: Color(
                                                                      0xD1FFFFFF),
                                                                  fontSize: 25,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 30, 0, 50),
                                                      child: SelectableText(
                                                        'Platform connects Japanese students with supervisors, providing a user-friendly dashboard for appointment and user tracking. To foster real-time communication, we integrated an embedded chat application powered by Twilio, enhancing collaboration between students and supervisors.',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'QuickSand',
                                                              color: Color(
                                                                  0x9EFFFFFF),
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              useGoogleFonts:
                                                                  false,
                                                              lineHeight: 1.5,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    80, 0, 80, 25),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFFA3D8F4),
                                              Color(0xFF28DF99)
                                            ],
                                            stops: [0, 1],
                                            begin: AlignmentDirectional(0, -1),
                                            end: AlignmentDirectional(0, 1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  3, 3, 3, 3),
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 15,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                            child: Container(
                                              width: 550,
                                              height: 302,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF10141C),
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 15, 15, 15),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 25,
                                                          shape:
                                                              const CircleBorder(),
                                                          child: Container(
                                                            width: 25,
                                                            height: 25,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF28DF99),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          3,
                                                                          3,
                                                                          3,
                                                                          3),
                                                              child: Container(
                                                                width: 100,
                                                                height: 100,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFFA3D8F4),
                                                                      Color(
                                                                          0xFF28DF99)
                                                                    ],
                                                                    stops: [
                                                                      0,
                                                                      1
                                                                    ],
                                                                    begin:
                                                                        AlignmentDirectional(
                                                                            0,
                                                                            -1),
                                                                    end:
                                                                        AlignmentDirectional(
                                                                            0,
                                                                            1),
                                                                  ),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(15,
                                                                      0, 0, 0),
                                                          child: SelectableText(
                                                            'FourO',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'HANK',
                                                                  color: Color(
                                                                      0xD1FFFFFF),
                                                                  fontSize: 25,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 30, 0, 50),
                                                      child: SelectableText(
                                                        'We\'ve created a data analytics platform for energy systems with diverse visualizations. It includes a monitoring system where machines communicate with staff via email, providing information and alerts based on urgency',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'QuickSand',
                                                              color: Color(
                                                                  0x9EFFFFFF),
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              useGoogleFonts:
                                                                  false,
                                                              lineHeight: 1.5,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 25, 0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFFA3D8F4),
                                              Color(0xFF28DF99)
                                            ],
                                            stops: [0, 1],
                                            begin: AlignmentDirectional(0, -1),
                                            end: AlignmentDirectional(0, 1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFFA3D8F4),
                                              Color(0xFF28DF99)
                                            ],
                                            stops: [0, 1],
                                            begin: AlignmentDirectional(0, -1),
                                            end: AlignmentDirectional(0, 1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  3, 3, 3, 3),
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 15,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                            child: Container(
                                              width: 550,
                                              height: 302,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF10141C),
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 15, 15, 15),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 25,
                                                          shape:
                                                              const CircleBorder(),
                                                          child: Container(
                                                            width: 25,
                                                            height: 25,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF28DF99),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          3,
                                                                          3,
                                                                          3,
                                                                          3),
                                                              child: Container(
                                                                width: 100,
                                                                height: 100,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFFA3D8F4),
                                                                      Color(
                                                                          0xFF28DF99)
                                                                    ],
                                                                    stops: [
                                                                      0,
                                                                      1
                                                                    ],
                                                                    begin:
                                                                        AlignmentDirectional(
                                                                            0,
                                                                            -1),
                                                                    end:
                                                                        AlignmentDirectional(
                                                                            0,
                                                                            1),
                                                                  ),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(15,
                                                                      0, 0, 0),
                                                          child: SelectableText(
                                                            'MNShipping',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'HANK',
                                                                  color: Color(
                                                                      0xD1FFFFFF),
                                                                  fontSize: 25,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 30, 0, 50),
                                                      child: SelectableText(
                                                        'We created a management system for an export/import company with an advanced accounting dashboard, data analytics, and a comprehensive notification system. This system also includes scheduled functions for real-time KPI monitoring and alerts to administrators.',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'QuickSand',
                                                              color: Color(
                                                                  0x9EFFFFFF),
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              useGoogleFonts:
                                                                  false,
                                                              lineHeight: 1.5,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 20,
                                key: WebAbout,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 130.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SelectableText(
                                      'About Us',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'HANK',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 35.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.7,
                                        decoration: BoxDecoration(),
                                        child: SelectableText(
                                          'We are a dynamic software solutions team specializing in mobile app and web development, as well as data analytics. Our mission is to empower businesses through technology, providing custom software solutions and insights to drive success in today\'s digital landscape',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'HANK',
                                                color: Color(0x66FFFFFF),
                                                fontSize: 26.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 20,
                                key: WebContact,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 130.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SelectableText(
                                      'Contact Us',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'HANK',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 35.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.7,
                                        decoration: BoxDecoration(),
                                        child: SelectableText(
                                          'Let’s Craft Tomorrow\'s Solutions Today.',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'HANK',
                                                color: Color(0x66FFFFFF),
                                                fontSize: 26.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 25.0, 25.0, 25.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        width: 100.0,
                                        height: 500.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 20.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  SelectableText(
                                                    'What can we do for you?',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'HANK',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 26.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 20.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Material(
                                                    color: Colors.transparent,
                                                    elevation: 10,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                    ),
                                                    child: InkWell(
                                                      splashFactory: NoSplash
                                                          .splashFactory,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () {
                                                        setState(() {
                                                          mobileApp =
                                                              !mobileApp;
                                                        });
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 500),
                                                        width: mobileApp
                                                            ? 175
                                                            : 135,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              Color(0xFFA3D8F4),
                                                              Color(0xFF28DF99)
                                                            ],
                                                            stops: [0, 1],
                                                            begin:
                                                                AlignmentDirectional(
                                                                    0, -1),
                                                            end:
                                                                AlignmentDirectional(
                                                                    0, 1),
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(2,
                                                                      2, 2, 2),
                                                          child: Container(
                                                            width: 100,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF10141C),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          13,
                                                                          0,
                                                                          13,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            4),
                                                                    child: Text(
                                                                      'Mobile App',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'HANK',
                                                                            color:
                                                                                Color(0xDCFFFFFF),
                                                                            fontSize:
                                                                                20,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  mobileApp
                                                                      ? DelayedWidget(
                                                                          delayDuration:
                                                                              Duration(milliseconds: 500), // Not required
                                                                          animationDuration:
                                                                              Duration(milliseconds: 400), // Not required
                                                                          animation:
                                                                              DelayedAnimations.SLIDE_FROM_RIGHT, // No
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                30,
                                                                            height:
                                                                                30,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              gradient: LinearGradient(
                                                                                colors: [
                                                                                  Color(0xFFA3D8F4),
                                                                                  Color(0xFF28DF99)
                                                                                ],
                                                                                stops: [
                                                                                  0,
                                                                                  1
                                                                                ],
                                                                                begin: AlignmentDirectional(0, -1),
                                                                                end: AlignmentDirectional(0, 1),
                                                                              ),
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                              child: Container(
                                                                                  width: 100,
                                                                                  height: 100,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFF10141C),
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: DelayedWidget(
                                                                                    delayDuration: Duration(milliseconds: 800), // Not required
                                                                                    animationDuration: Duration(milliseconds: 400), // Not required
                                                                                    animation: DelayedAnimations.SLIDE_FROM_BOTTOM, // No),
                                                                                    child: Icon(
                                                                                      Icons.check,
                                                                                      size: 20,
                                                                                      color: Colors.white,
                                                                                    ),
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      : Container()
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Material(
                                                    color: Colors.transparent,
                                                    elevation: 10,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                    ),
                                                    child: InkWell(
                                                      splashFactory: NoSplash
                                                          .splashFactory,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () {
                                                        setState(() {
                                                          website = !website;
                                                        });
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 500),
                                                        width:
                                                            website ? 155 : 109,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              Color(0xFFA3D8F4),
                                                              Color(0xFF28DF99)
                                                            ],
                                                            stops: [0, 1],
                                                            begin:
                                                                AlignmentDirectional(
                                                                    0, -1),
                                                            end:
                                                                AlignmentDirectional(
                                                                    0, 1),
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(2,
                                                                      2, 2, 2),
                                                          child: Container(
                                                            width: 100,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF10141C),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          13,
                                                                          0,
                                                                          13,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            4),
                                                                    child: Text(
                                                                      'Website',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'HANK',
                                                                            color:
                                                                                Color(0xDCFFFFFF),
                                                                            fontSize:
                                                                                20,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  website
                                                                      ? DelayedWidget(
                                                                          delayDuration:
                                                                              Duration(milliseconds: 500), // Not required
                                                                          animationDuration:
                                                                              Duration(milliseconds: 400), // Not required
                                                                          animation:
                                                                              DelayedAnimations.SLIDE_FROM_RIGHT, // No
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                30,
                                                                            height:
                                                                                30,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              gradient: LinearGradient(
                                                                                colors: [
                                                                                  Color(0xFFA3D8F4),
                                                                                  Color(0xFF28DF99)
                                                                                ],
                                                                                stops: [
                                                                                  0,
                                                                                  1
                                                                                ],
                                                                                begin: AlignmentDirectional(0, -1),
                                                                                end: AlignmentDirectional(0, 1),
                                                                              ),
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                              child: Container(
                                                                                  width: 100,
                                                                                  height: 100,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFF10141C),
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: DelayedWidget(
                                                                                    delayDuration: Duration(milliseconds: 800), // Not required
                                                                                    animationDuration: Duration(milliseconds: 400), // Not required
                                                                                    animation: DelayedAnimations.SLIDE_FROM_BOTTOM, // No),
                                                                                    child: Icon(
                                                                                      Icons.check,
                                                                                      size: 20,
                                                                                      color: Colors.white,
                                                                                    ),
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      : Container()
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Material(
                                                    color: Colors.transparent,
                                                    elevation: 10,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                    ),
                                                    child: InkWell(
                                                      splashFactory: NoSplash
                                                          .splashFactory,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () {
                                                        setState(() {
                                                          dataAnalysis =
                                                              !dataAnalysis;
                                                        });
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 500),
                                                        width: dataAnalysis
                                                            ? 210
                                                            : 161,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              Color(0xFFA3D8F4),
                                                              Color(0xFF28DF99)
                                                            ],
                                                            stops: [0, 1],
                                                            begin:
                                                                AlignmentDirectional(
                                                                    0, -1),
                                                            end:
                                                                AlignmentDirectional(
                                                                    0, 1),
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(2,
                                                                      2, 2, 2),
                                                          child: Container(
                                                            width: 100,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF10141C),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          13,
                                                                          0,
                                                                          13,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            4),
                                                                    child: Text(
                                                                      'Data Analysis',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'HANK',
                                                                            color:
                                                                                Color(0xDCFFFFFF),
                                                                            fontSize:
                                                                                20,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  dataAnalysis
                                                                      ? DelayedWidget(
                                                                          delayDuration:
                                                                              Duration(milliseconds: 500), // Not required
                                                                          animationDuration:
                                                                              Duration(milliseconds: 400), // Not required
                                                                          animation:
                                                                              DelayedAnimations.SLIDE_FROM_RIGHT, // No
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                30,
                                                                            height:
                                                                                30,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              gradient: LinearGradient(
                                                                                colors: [
                                                                                  Color(0xFFA3D8F4),
                                                                                  Color(0xFF28DF99)
                                                                                ],
                                                                                stops: [
                                                                                  0,
                                                                                  1
                                                                                ],
                                                                                begin: AlignmentDirectional(0, -1),
                                                                                end: AlignmentDirectional(0, 1),
                                                                              ),
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                              child: Container(
                                                                                  width: 100,
                                                                                  height: 100,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFF10141C),
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: DelayedWidget(
                                                                                    delayDuration: Duration(milliseconds: 800), // Not required
                                                                                    animationDuration: Duration(milliseconds: 400), // Not required
                                                                                    animation: DelayedAnimations.SLIDE_FROM_BOTTOM, // No),
                                                                                    child: Icon(
                                                                                      Icons.check,
                                                                                      size: 20,
                                                                                      color: Colors.white,
                                                                                    ),
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      : Container()
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Material(
                                                    color: Colors.transparent,
                                                    elevation: 10,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                    ),
                                                    child: InkWell(
                                                      splashFactory: NoSplash
                                                          .splashFactory,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () {
                                                        setState(() {
                                                          Branding = !Branding;
                                                        });
                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 500),
                                                        width: Branding
                                                            ? 160
                                                            : 114,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              Color(0xFFA3D8F4),
                                                              Color(0xFF28DF99)
                                                            ],
                                                            stops: [0, 1],
                                                            begin:
                                                                AlignmentDirectional(
                                                                    0, -1),
                                                            end:
                                                                AlignmentDirectional(
                                                                    0, 1),
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(2,
                                                                      2, 2, 2),
                                                          child: Container(
                                                            width: 100,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF10141C),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          13,
                                                                          0,
                                                                          13,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            4),
                                                                    child: Text(
                                                                      'Branding',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'HANK',
                                                                            color:
                                                                                Color(0xDCFFFFFF),
                                                                            fontSize:
                                                                                20,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Branding
                                                                      ? DelayedWidget(
                                                                          delayDuration:
                                                                              Duration(milliseconds: 500), // Not required
                                                                          animationDuration:
                                                                              Duration(milliseconds: 400), // Not required
                                                                          animation:
                                                                              DelayedAnimations.SLIDE_FROM_RIGHT, // No
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                30,
                                                                            height:
                                                                                30,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              gradient: LinearGradient(
                                                                                colors: [
                                                                                  Color(0xFFA3D8F4),
                                                                                  Color(0xFF28DF99)
                                                                                ],
                                                                                stops: [
                                                                                  0,
                                                                                  1
                                                                                ],
                                                                                begin: AlignmentDirectional(0, -1),
                                                                                end: AlignmentDirectional(0, 1),
                                                                              ),
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                              child: Container(
                                                                                  width: 100,
                                                                                  height: 100,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFF10141C),
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: DelayedWidget(
                                                                                    delayDuration: Duration(milliseconds: 800), // Not required
                                                                                    animationDuration: Duration(milliseconds: 400), // Not required
                                                                                    animation: DelayedAnimations.SLIDE_FROM_BOTTOM, // No),
                                                                                    child: Icon(
                                                                                      Icons.check,
                                                                                      size: 20,
                                                                                      color: Colors.white,
                                                                                    ),
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      : Container()
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 20.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 100.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: TextFormField(
                                                            controller: Name,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            22.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                              hintText:
                                                                  'Your Name',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            20.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                              enabledBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0xFFA3D8F4),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0xFFA3D8F4),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 100.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: TextFormField(
                                                            controller: Email,
                                                            validator: (input) =>
                                                                input!.isValidEmail()
                                                                    ? null
                                                                    : "Invalid Email",
                                                            autovalidateMode:
                                                                AutovalidateMode
                                                                    .onUserInteraction,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            22.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                              hintText:
                                                                  'Your Email',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            20.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                              enabledBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0xFFA3D8F4),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0xFFA3D8F4),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 20.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 100.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: TextFormField(
                                                            controller: Details,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            22.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                              hintText:
                                                                  'Project Details',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            20.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                              enabledBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0xFFA3D8F4),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0xFFA3D8F4),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      30.0, 30.0, 30.0, 30.0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashFactory: NoSplash
                                                            .splashFactory,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () {
                                                          if (Name.text
                                                                  .isEmpty ||
                                                              Email.text
                                                                  .isEmpty ||
                                                              Details.text
                                                                  .isEmpty ||
                                                              !Email.text!
                                                                  .isValidEmail()) {
                                                            requestStatus =
                                                                'Please check all required fields';
                                                            requestSent = 0;
                                                            setState(() {});
                                                          } else if (mobileApp ==
                                                                  false &&
                                                              website ==
                                                                  false &&
                                                              dataAnalysis ==
                                                                  false) {
                                                            requestStatus =
                                                                'Please select at least one type of service';
                                                            requestSent = 0;

                                                            setState(() {});
                                                          } else {
                                                            addRequest();
                                                            Name.clear();
                                                            Email.clear();
                                                            Details.clear();
                                                            mobileApp = false;
                                                            website = false;
                                                            dataAnalysis =
                                                                false;
                                                            requestStatus =
                                                                "Request sent, We\'ll be in touch soon.";
                                                            requestSent =
                                                                requestSent + 1;
                                                            setState(() {});
                                                          }
                                                        },
                                                        child: Text(
                                                          'Send Request',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontSize: 28.0,
                                                                color: requestSent >
                                                                        0
                                                                    ? Colors
                                                                        .greenAccent
                                                                    : Colors
                                                                        .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons
                                                              .navigate_next_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          requestStatus,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                useGoogleFonts:
                                                                    false,
                                                                fontFamily:
                                                                    'HANK',
                                                                fontSize: 14.0,
                                                                color: requestSent >
                                                                        0
                                                                    ? Colors
                                                                        .greenAccent
                                                                    : Colors
                                                                        .redAccent,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        width: 100.0,
                                        height: 500.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 20.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Or we can have a chat...',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          useGoogleFonts: false,
                                                          fontFamily: 'HANK',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 26.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Via email at:',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          useGoogleFonts: false,
                                                          fontFamily: 'HANK',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 26.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 20.0),
                                              child: InkWell(
                                                splashFactory:
                                                    NoSplash.splashFactory,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () {
                                                  launch(
                                                      "mailto:inquiries@CatalystSolutions.site?subject=Inquiry&body=");
                                                },
                                                child: Container(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                bottom: 4.0),
                                                        child: SelectableText(
                                                          'inquiries@CatalystSolutions.site',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                useGoogleFonts:
                                                                    false,
                                                                fontFamily:
                                                                    'HANK',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 26.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Icon(Icons.send_rounded,
                                                          size: 19,
                                                          color: Colors.white)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Via Phone at:',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          useGoogleFonts: false,
                                                          fontFamily: 'HANK',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 26.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 20.0),
                                              child: InkWell(
                                                splashFactory:
                                                    NoSplash.splashFactory,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () => whatsapp(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    SelectableText(
                                                      '+961-70858410',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            useGoogleFonts:
                                                                false,
                                                            fontFamily: 'HANK',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 26.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Icon(
                                                      FontAwesomeIcons.whatsapp,
                                                      size: 24,
                                                      color: Colors.white,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    splashFactory:
                                                        NoSplash.splashFactory,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () {
                                                      launchUrl(Uri.parse(
                                                          'https://instagram.com/catalyst_sol?igshid=MzMyNGUyNmU2YQ=='));
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  25.0,
                                                                  0.0),
                                                      child: FaIcon(
                                                        FontAwesomeIcons
                                                            .instagram,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 30.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 25.0, 20.0, 0.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 3),
                                            child: InkWell(
                                              splashFactory:
                                                  NoSplash.splashFactory,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () {
                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) =>
                                                        scrollAnimated(0));

                                                setState(() {
                                                  isHome = true;
                                                  isAbout = false;
                                                  isService = false;
                                                  isWorks = false;
                                                  contactus = false;
                                                });
                                              },
                                              child: GradientText(
                                                'Catalyst',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'HANK',
                                                          fontSize: 45,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          useGoogleFonts: false,
                                                        ),
                                                colors: [
                                                  Color(0xFFA3D8F4),
                                                  Color(0xFF28DF99)
                                                ],
                                                gradientDirection:
                                                    GradientDirection.ltr,
                                                gradientType:
                                                    GradientType.linear,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 450.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            InkWell(
                                              splashFactory:
                                                  NoSplash.splashFactory,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () {
                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) =>
                                                        scrollAnimated(0));

                                                setState(() {
                                                  isHome = true;
                                                  isAbout = false;
                                                  isService = false;
                                                  isWorks = false;
                                                  contactus = false;
                                                });
                                              },
                                              child: Text(
                                                'Home',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'HANK',
                                                      color: !isHome
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontWeight: !isHome
                                                          ? FontWeight.w500
                                                          : FontWeight.w700,
                                                      fontSize: 20,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                            ),
                                            InkWell(
                                              splashFactory:
                                                  NoSplash.splashFactory,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () {
                                                Scrollable.ensureVisible(
                                                    duration: Duration(
                                                        milliseconds: 900),
                                                    WebServices
                                                        .currentContext!);
                                                setState(() {
                                                  isHome = false;
                                                  isAbout = false;
                                                  isService = true;
                                                  isWorks = false;
                                                  contactus = false;
                                                });
                                              },
                                              child: Text(
                                                'Services',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'HANK',
                                                      useGoogleFonts: false,
                                                      fontSize: 20.0,
                                                      color: !isService
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontWeight: !isService
                                                          ? FontWeight.w500
                                                          : FontWeight.w700,
                                                    ),
                                              ),
                                            ),
                                            InkWell(
                                              splashFactory:
                                                  NoSplash.splashFactory,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () {
                                                Scrollable.ensureVisible(
                                                    duration: Duration(
                                                        milliseconds: 900),
                                                    WebWorks.currentContext!);
                                                setState(() {
                                                  isHome = false;
                                                  isAbout = false;
                                                  isService = false;
                                                  isWorks = true;
                                                  contactus = false;
                                                });
                                              },
                                              child: Text(
                                                'Works',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'HANK',
                                                      useGoogleFonts: false,
                                                      fontSize: 20.0,
                                                      color: !isWorks
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontWeight: !isWorks
                                                          ? FontWeight.w500
                                                          : FontWeight.w700,
                                                    ),
                                              ),
                                            ),
                                            InkWell(
                                              splashFactory:
                                                  NoSplash.splashFactory,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () {
                                                Scrollable.ensureVisible(
                                                    duration: Duration(
                                                        milliseconds: 900),
                                                    WebAbout.currentContext!);

                                                setState(() {
                                                  isHome = false;
                                                  isAbout = true;
                                                  isService = false;
                                                  isWorks = false;
                                                  contactus = false;
                                                });
                                              },
                                              child: Text(
                                                'About us',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'HANK',
                                                      useGoogleFonts: false,
                                                      fontSize: 20.0,
                                                      color: !isAbout
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontWeight: !isAbout
                                                          ? FontWeight.w500
                                                          : FontWeight.w700,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        splashFactory: NoSplash.splashFactory,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          Scrollable.ensureVisible(
                                              duration:
                                                  Duration(milliseconds: 900),
                                              WebContact.currentContext!);
                                          setState(() {
                                            isHome = false;
                                            isAbout = false;
                                            isService = false;
                                            isWorks = false;
                                            contactus = true;
                                          });
                                        },
                                        onHover: (value) {
                                          setState(() {
                                            contactus = value;
                                          });
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 450),
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: contactus
                                                  ? Color(0xFFA3D8F4)
                                                  : Color(0xFFA3D8F4),
                                            ),
                                            color: contactus
                                                ? Color(0xFFA3D8F4)
                                                : Color(0xFF10141C),
                                          ),
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 15.0, 0.0),
                                              child: Text(
                                                'Contact Us',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'HANK',
                                                      useGoogleFonts: false,
                                                      color: contactus
                                                          ? Color(0xFF10141C)
                                                          : Color.fromARGB(255,
                                                              255, 255, 255),
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 17.5,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 0.5,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF28DF99),
                                          Color(0xFFA3D8F4)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(1, 0),
                                        end: AlignmentDirectional(-1, 0),
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                //mobile version
                : Stack(
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 83.0, 0.0, 0.0),
                        child: NotificationListener<ScrollNotification>(
                          onNotification: (notification) {
                            print(_controller.position.pixels);
                            // Return true to cancel the notification bubbling. Return false (or null) to
                            // allow the notification to continue to be dispatched to further ancestors.
                            return true;
                          },
                          child: SingleChildScrollView(
                            controller: _controller,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 100, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 50, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 20, 0, 1),
                                                    child: Text(
                                                      'Your Vision',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'HANK',
                                                            color: Color(
                                                                0xDDFFFFFF),
                                                            fontSize: 40,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 15,
                                                                    0, 0),
                                                        child: Container(
                                                          width: 100,
                                                          height: 10,
                                                          decoration:
                                                              BoxDecoration(
                                                            gradient:
                                                                LinearGradient(
                                                              colors: [
                                                                Color(
                                                                    0xFFA3D8F4),
                                                                Color(
                                                                    0xFF28DF99)
                                                              ],
                                                              stops: [0, 1],
                                                              begin:
                                                                  AlignmentDirectional(
                                                                      1, 0),
                                                              end:
                                                                  AlignmentDirectional(
                                                                      -1, 0),
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        2,
                                                                        2,
                                                                        2,
                                                                        2),
                                                            child: Container(
                                                              width: 100,
                                                              height: 100,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFF10141C),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20,
                                                                    10, 0, 5),
                                                        child: Text(
                                                          'Our Code',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'HANK',
                                                                color: Color(
                                                                    0xDDFFFFFF),
                                                                fontSize: 40,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 10, 0, 25),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'One',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'HANK',
                                                                color: Color(
                                                                    0xDDFFFFFF),
                                                                fontSize: 40,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                        Stack(
                                                          children: [
                                                            GradientText(
                                                              ' Solution',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'HANK',
                                                                    fontSize:
                                                                        40,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                              colors: [
                                                                Color(
                                                                    0xFFA3D8F4),
                                                                Color(
                                                                    0xFF28DF99)
                                                              ],
                                                              gradientDirection:
                                                                  GradientDirection
                                                                      .ltr,
                                                              gradientType:
                                                                  GradientType
                                                                      .linear,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 50, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Material(
                                        color: Colors.transparent,
                                        elevation: 20,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: InkWell(
                                          splashFactory: NoSplash.splashFactory,
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            Scrollable.ensureVisible(
                                                duration:
                                                    Duration(milliseconds: 900),
                                                MobileContact.currentContext!);
                                          },
                                          onHover: (value) {
                                            setState(() {
                                              onHoverReachOut = value;
                                            });
                                          },
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 400),
                                            width: onHoverReachOut ? 150 : 150,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: onHoverReachOut
                                                  ? Color(0xFFA3D8F4)
                                                  : Color(0xFF10141C),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4,
                                                  color: Color(0xFFA3D8F4),
                                                  offset: Offset(0, 0),
                                                  spreadRadius: 3,
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(1, 1, 1, 5),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.00, 0.00),
                                                    child: Text(
                                                      'Reach Out',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'HANK',
                                                            color: !onHoverReachOut
                                                                ? Color(
                                                                    0xDDFFFFFF)
                                                                : Color(
                                                                    0xFF10141C),
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 225.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  25.0, 25.0, 25.0, 25.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      SelectableText(
                                                        'Our Services',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'HANK',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      24.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.8,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: SelectableText(
                                                            'Our services are defined by excellence, tailored to your unique needs, and driven by innovation. We\'re here to propel your business in the digital age',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'HANK',
                                                                  color: Color(
                                                                      0x66FFFFFF),
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 50, 20, 20),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0xFFA3D8F4),
                                                            Color(0xFF28DF99)
                                                          ],
                                                          stops: [0, 1],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0, -1),
                                                          end:
                                                              AlignmentDirectional(
                                                                  0, 1),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    3, 3, 3, 3),
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 15,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        18),
                                                          ),
                                                          child: Container(
                                                            width: 550,
                                                            height: 302,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF10141C),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          18),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15,
                                                                          15,
                                                                          15,
                                                                          15),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        elevation:
                                                                            25,
                                                                        shape:
                                                                            const CircleBorder(),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              25,
                                                                          height:
                                                                              25,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFF28DF99),
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                3,
                                                                                3,
                                                                                3,
                                                                                3),
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                gradient: LinearGradient(
                                                                                  colors: [
                                                                                    Color(0xFFA3D8F4),
                                                                                    Color(0xFF28DF99)
                                                                                  ],
                                                                                  stops: [
                                                                                    0,
                                                                                    1
                                                                                  ],
                                                                                  begin: AlignmentDirectional(0, -1),
                                                                                  end: AlignmentDirectional(0, 1),
                                                                                ),
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            15,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            SelectableText(
                                                                          'Mobile Applications',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'HANK',
                                                                                color: Color(0xD1FFFFFF),
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.bold,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            30,
                                                                            0,
                                                                            50),
                                                                    child:
                                                                        SelectableText(
                                                                      'Our Mobile Development Service excels in crafting tailored, user-centric apps for iOS and Android, emphasizing user experience, performance, and security. We deliver seamless, reliable, and secure applications. Rely on our expertise to expand your reach and stay competitive in the mobile-centric market.',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'QuickSand',
                                                                            color:
                                                                                Color(0x9EFFFFFF),
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            useGoogleFonts:
                                                                                false,
                                                                            lineHeight:
                                                                                1.5,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0xFFA3D8F4),
                                                            Color(0xFF28DF99)
                                                          ],
                                                          stops: [0, 1],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0, -1),
                                                          end:
                                                              AlignmentDirectional(
                                                                  0, 1),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    3, 3, 3, 3),
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 15,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        18),
                                                          ),
                                                          child: Container(
                                                            width: 550,
                                                            height: 302,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF10141C),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          18),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15,
                                                                          15,
                                                                          15,
                                                                          15),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        elevation:
                                                                            25,
                                                                        shape:
                                                                            const CircleBorder(),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              25,
                                                                          height:
                                                                              25,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFF28DF99),
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                3,
                                                                                3,
                                                                                3,
                                                                                3),
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                gradient: LinearGradient(
                                                                                  colors: [
                                                                                    Color(0xFFA3D8F4),
                                                                                    Color(0xFF28DF99)
                                                                                  ],
                                                                                  stops: [
                                                                                    0,
                                                                                    1
                                                                                  ],
                                                                                  begin: AlignmentDirectional(0, -1),
                                                                                  end: AlignmentDirectional(0, 1),
                                                                                ),
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            15,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            SelectableText(
                                                                          'Web Development',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'HANK',
                                                                                color: Color(0xD1FFFFFF),
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.bold,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            30,
                                                                            0,
                                                                            50),
                                                                    child:
                                                                        SelectableText(
                                                                      'We are experts in crafting responsive and dynamic web solutions that not only showcase your brand effectively but also provide seamless user experiences. Whether it\'s a corporate website, e-commerce platform, or web application, we leverage cutting-edge technologies to build robust online solutions.',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'QuickSand',
                                                                            color:
                                                                                Color(0x9EFFFFFF),
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            useGoogleFonts:
                                                                                false,
                                                                            lineHeight:
                                                                                1.5,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 0, 20, 80),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0xFFA3D8F4),
                                                            Color(0xFF28DF99)
                                                          ],
                                                          stops: [0, 1],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0, -1),
                                                          end:
                                                              AlignmentDirectional(
                                                                  0, 1),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    3, 3, 3, 3),
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 15,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        18),
                                                          ),
                                                          child: Container(
                                                            width: 550,
                                                            height: 302,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF10141C),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          18),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15,
                                                                          15,
                                                                          15,
                                                                          15),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        elevation:
                                                                            25,
                                                                        shape:
                                                                            const CircleBorder(),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              25,
                                                                          height:
                                                                              25,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFF28DF99),
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                3,
                                                                                3,
                                                                                3,
                                                                                3),
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                gradient: LinearGradient(
                                                                                  colors: [
                                                                                    Color(0xFFA3D8F4),
                                                                                    Color(0xFF28DF99)
                                                                                  ],
                                                                                  stops: [
                                                                                    0,
                                                                                    1
                                                                                  ],
                                                                                  begin: AlignmentDirectional(0, -1),
                                                                                  end: AlignmentDirectional(0, 1),
                                                                                ),
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            15,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            SelectableText(
                                                                          'Data Analysis',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'HANK',
                                                                                color: Color(0xD1FFFFFF),
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.bold,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            30,
                                                                            0,
                                                                            50),
                                                                    child:
                                                                        SelectableText(
                                                                      'We leverage data\'s potential as your business asset, employing advanced analytics and visualization to extract actionable insights. Our services enhance decision-making, streamline operations, and deepen customer understanding, giving you a competitive edge through informed choices.',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'QuickSand',
                                                                            color:
                                                                                Color(0x9EFFFFFF),
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            useGoogleFonts:
                                                                                false,
                                                                            lineHeight:
                                                                                1.5,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0xFFA3D8F4),
                                                            Color(0xFF28DF99)
                                                          ],
                                                          stops: [0, 1],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0, -1),
                                                          end:
                                                              AlignmentDirectional(
                                                                  0, 1),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    3, 3, 3, 3),
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 15,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        18),
                                                          ),
                                                          child: Container(
                                                            width: 550,
                                                            height: 302,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF10141C),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          18),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15,
                                                                          15,
                                                                          15,
                                                                          15),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        elevation:
                                                                            25,
                                                                        shape:
                                                                            const CircleBorder(),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              25,
                                                                          height:
                                                                              25,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFF28DF99),
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                3,
                                                                                3,
                                                                                3,
                                                                                3),
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                gradient: LinearGradient(
                                                                                  colors: [
                                                                                    Color(0xFFA3D8F4),
                                                                                    Color(0xFF28DF99)
                                                                                  ],
                                                                                  stops: [
                                                                                    0,
                                                                                    1
                                                                                  ],
                                                                                  begin: AlignmentDirectional(0, -1),
                                                                                  end: AlignmentDirectional(0, 1),
                                                                                ),
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            15,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            SelectableText(
                                                                          'Brand Identity',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'HANK',
                                                                                color: Color(0xD1FFFFFF),
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.bold,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            30,
                                                                            0,
                                                                            50),
                                                                    child:
                                                                        SelectableText(
                                                                      'Through our Brand Identity service, we meticulously craft a unique image for your business, incorporating logos, color palettes, typography, and compelling messaging. This ensures consistent brand representation and fosters recognition, trust, and lasting customer loyalty, giving you a competitive edge in the market.',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'QuickSand',
                                                                            color:
                                                                                Color(0x9EFFFFFF),
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            useGoogleFonts:
                                                                                false,
                                                                            lineHeight:
                                                                                1.5,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 150.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SelectableText(
                                        'Our Work',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'HANK',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.7,
                                          decoration: BoxDecoration(),
                                          child: SelectableText(
                                            'Here are some examples of projects our talented team has successfully worked on.',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'HANK',
                                                  color: Color(0x66FFFFFF),
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 50, 20, 25),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color(0xFFA3D8F4),
                                                    Color(0xFF28DF99)
                                                  ],
                                                  stops: [0, 1],
                                                  begin: AlignmentDirectional(
                                                      0, -1),
                                                  end: AlignmentDirectional(
                                                      0, 1),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(3, 3, 3, 3),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 15,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18),
                                                  ),
                                                  child: Container(
                                                    width: 550,
                                                    height: 370,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF10141C),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(15, 15,
                                                                  15, 15),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 25,
                                                                shape:
                                                                    const CircleBorder(),
                                                                child:
                                                                    Container(
                                                                  width: 25,
                                                                  height: 25,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFF28DF99),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3,
                                                                            3,
                                                                            3,
                                                                            3),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100,
                                                                      height:
                                                                          100,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        gradient:
                                                                            LinearGradient(
                                                                          colors: [
                                                                            Color(0xFFA3D8F4),
                                                                            Color(0xFF28DF99)
                                                                          ],
                                                                          stops: [
                                                                            0,
                                                                            1
                                                                          ],
                                                                          begin: AlignmentDirectional(
                                                                              0,
                                                                              -1),
                                                                          end: AlignmentDirectional(
                                                                              0,
                                                                              1),
                                                                        ),
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child:
                                                                    SelectableText(
                                                                  'SwiftRide',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'HANK',
                                                                        color: Color(
                                                                            0xD1FFFFFF),
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        30,
                                                                        0,
                                                                        50),
                                                            child:
                                                                SelectableText(
                                                              'SwiftRide is a cutting-edge, on-demand transportation app that revolutionizes the way people move from one place to another. With a seamless user experience and a vast network of drivers, SwiftRide provides a convenient, safe, and reliable solution for getting around town, whether it\'s a quick ride to the grocery store or a long-distance trip',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'QuickSand',
                                                                    color: Color(
                                                                        0x9EFFFFFF),
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts:
                                                                        false,
                                                                    lineHeight:
                                                                        1.5,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color(0xFFA3D8F4),
                                                    Color(0xFF28DF99)
                                                  ],
                                                  stops: [0, 1],
                                                  begin: AlignmentDirectional(
                                                      0, -1),
                                                  end: AlignmentDirectional(
                                                      0, 1),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(3, 3, 3, 3),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 15,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18),
                                                  ),
                                                  child: Container(
                                                    width: 550,
                                                    height: 350,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF10141C),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(15, 15,
                                                                  15, 15),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 25,
                                                                shape:
                                                                    const CircleBorder(),
                                                                child:
                                                                    Container(
                                                                  width: 25,
                                                                  height: 25,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFF28DF99),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3,
                                                                            3,
                                                                            3,
                                                                            3),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100,
                                                                      height:
                                                                          100,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        gradient:
                                                                            LinearGradient(
                                                                          colors: [
                                                                            Color(0xFFA3D8F4),
                                                                            Color(0xFF28DF99)
                                                                          ],
                                                                          stops: [
                                                                            0,
                                                                            1
                                                                          ],
                                                                          begin: AlignmentDirectional(
                                                                              0,
                                                                              -1),
                                                                          end: AlignmentDirectional(
                                                                              0,
                                                                              1),
                                                                        ),
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child:
                                                                    SelectableText(
                                                                  'OnlineAdvisor',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'HANK',
                                                                        color: Color(
                                                                            0xD1FFFFFF),
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        30,
                                                                        0,
                                                                        50),
                                                            child:
                                                                SelectableText(
                                                              'Platform connects Japanese students with supervisors, providing a user-friendly dashboard for appointment and user tracking. To foster real-time communication, we integrated an embedded chat application powered by Twilio, enhancing collaboration between students and supervisors.',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'QuickSand',
                                                                    color: Color(
                                                                        0x9EFFFFFF),
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts:
                                                                        false,
                                                                    lineHeight:
                                                                        1.5,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 25),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color(0xFFA3D8F4),
                                                    Color(0xFF28DF99)
                                                  ],
                                                  stops: [0, 1],
                                                  begin: AlignmentDirectional(
                                                      0, -1),
                                                  end: AlignmentDirectional(
                                                      0, 1),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(3, 3, 3, 3),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 15,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18),
                                                  ),
                                                  child: Container(
                                                    width: 550,
                                                    height: 302,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF10141C),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(15, 15,
                                                                  15, 15),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 25,
                                                                shape:
                                                                    const CircleBorder(),
                                                                child:
                                                                    Container(
                                                                  width: 25,
                                                                  height: 25,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFF28DF99),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3,
                                                                            3,
                                                                            3,
                                                                            3),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100,
                                                                      height:
                                                                          100,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        gradient:
                                                                            LinearGradient(
                                                                          colors: [
                                                                            Color(0xFFA3D8F4),
                                                                            Color(0xFF28DF99)
                                                                          ],
                                                                          stops: [
                                                                            0,
                                                                            1
                                                                          ],
                                                                          begin: AlignmentDirectional(
                                                                              0,
                                                                              -1),
                                                                          end: AlignmentDirectional(
                                                                              0,
                                                                              1),
                                                                        ),
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child:
                                                                    SelectableText(
                                                                  'FourO',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'HANK',
                                                                        color: Color(
                                                                            0xD1FFFFFF),
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        30,
                                                                        0,
                                                                        50),
                                                            child:
                                                                SelectableText(
                                                              'We\'ve created a data analytics platform for energy systems with diverse visualizations. It includes a monitoring system where machines communicate with staff via email, providing information and alerts based on urgency',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'QuickSand',
                                                                    color: Color(
                                                                        0x9EFFFFFF),
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts:
                                                                        false,
                                                                    lineHeight:
                                                                        1.5,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color(0xFFA3D8F4),
                                                    Color(0xFF28DF99)
                                                  ],
                                                  stops: [0, 1],
                                                  begin: AlignmentDirectional(
                                                      0, -1),
                                                  end: AlignmentDirectional(
                                                      0, 1),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(3, 3, 3, 3),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 15,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18),
                                                  ),
                                                  child: Container(
                                                    width: 550,
                                                    height: 302,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF10141C),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(15, 15,
                                                                  15, 15),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 25,
                                                                shape:
                                                                    const CircleBorder(),
                                                                child:
                                                                    Container(
                                                                  width: 25,
                                                                  height: 25,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFF28DF99),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3,
                                                                            3,
                                                                            3,
                                                                            3),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100,
                                                                      height:
                                                                          100,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        gradient:
                                                                            LinearGradient(
                                                                          colors: [
                                                                            Color(0xFFA3D8F4),
                                                                            Color(0xFF28DF99)
                                                                          ],
                                                                          stops: [
                                                                            0,
                                                                            1
                                                                          ],
                                                                          begin: AlignmentDirectional(
                                                                              0,
                                                                              -1),
                                                                          end: AlignmentDirectional(
                                                                              0,
                                                                              1),
                                                                        ),
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child:
                                                                    SelectableText(
                                                                  'MNShipping',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'HANK',
                                                                        color: Color(
                                                                            0xD1FFFFFF),
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        30,
                                                                        0,
                                                                        50),
                                                            child:
                                                                SelectableText(
                                                              'We created a management system for an export/import company with an advanced accounting dashboard, data analytics, and a comprehensive notification system. This system also includes scheduled functions for real-time KPI monitoring and alerts to administrators.',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'QuickSand',
                                                                    color: Color(
                                                                        0x9EFFFFFF),
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts:
                                                                        false,
                                                                    lineHeight:
                                                                        1.5,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 150.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SelectableText(
                                        'About Us',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'HANK',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.7,
                                          decoration: BoxDecoration(),
                                          child: SelectableText(
                                            'We are a dynamic software solutions team specializing in mobile app and web development, as well as data analytics. Our mission is to empower businesses through technology, providing custom software solutions and insights to drive success in today\'s digital landscape',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'HANK',
                                                  color: Color(0x66FFFFFF),
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  key: MobileContact,
                                  height: 40,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 130.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SelectableText(
                                        'Contact Us',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'HANK',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.7,
                                          decoration: BoxDecoration(),
                                          child: SelectableText(
                                            'Let’s Craft Tomorrow\'s Solutions Today.',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'HANK',
                                                  color: Color(0x66FFFFFF),
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      25.0, 25.0, 25.0, 25.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          width: 100.0,
                                          height: 500.0,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 20.0, 20.0, 20.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    SelectableText(
                                                      'What can we do for you?',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'HANK',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 10.0),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 10,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                          ),
                                                          child: InkWell(
                                                            splashFactory: NoSplash
                                                                .splashFactory,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () {
                                                              setState(() {
                                                                mobileApp =
                                                                    !mobileApp;
                                                              });
                                                            },
                                                            child:
                                                                AnimatedContainer(
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      500),
                                                              width: mobileApp
                                                                  ? 140
                                                                  : 110,
                                                              height: 38,
                                                              decoration:
                                                                  BoxDecoration(
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: [
                                                                    Color(
                                                                        0xFFA3D8F4),
                                                                    Color(
                                                                        0xFF28DF99)
                                                                  ],
                                                                  stops: [0, 1],
                                                                  begin:
                                                                      AlignmentDirectional(
                                                                          0,
                                                                          -1),
                                                                  end:
                                                                      AlignmentDirectional(
                                                                          0, 1),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2,
                                                                            2,
                                                                            2,
                                                                            2),
                                                                child:
                                                                    Container(
                                                                  width: 100,
                                                                  height: 100,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFF10141C),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            100),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            13,
                                                                            0,
                                                                            13,
                                                                            0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              4),
                                                                          child:
                                                                              Text(
                                                                            'Mobile App',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'HANK',
                                                                                  color: Color(0xDCFFFFFF),
                                                                                  fontSize: 14,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        mobileApp
                                                                            ? DelayedWidget(
                                                                                delayDuration: Duration(milliseconds: 500), // Not required
                                                                                animationDuration: Duration(milliseconds: 400), // Not required
                                                                                animation: DelayedAnimations.SLIDE_FROM_RIGHT, // No
                                                                                child: Container(
                                                                                  width: 20,
                                                                                  height: 20,
                                                                                  decoration: BoxDecoration(
                                                                                    gradient: LinearGradient(
                                                                                      colors: [
                                                                                        Color(0xFFA3D8F4),
                                                                                        Color(0xFF28DF99)
                                                                                      ],
                                                                                      stops: [0, 1],
                                                                                      begin: AlignmentDirectional(0, -1),
                                                                                      end: AlignmentDirectional(0, 1),
                                                                                    ),
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                    child: Container(
                                                                                        width: 100,
                                                                                        height: 100,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0xFF10141C),
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: DelayedWidget(
                                                                                          delayDuration: Duration(milliseconds: 800), // Not required
                                                                                          animationDuration: Duration(milliseconds: 400), // Not required
                                                                                          animation: DelayedAnimations.SLIDE_FROM_BOTTOM, // No),
                                                                                          child: Icon(
                                                                                            Icons.check,
                                                                                            size: 14,
                                                                                            color: Colors.white,
                                                                                          ),
                                                                                        )),
                                                                                  ),
                                                                                ),
                                                                              )
                                                                            : Container()
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 10,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                          ),
                                                          child: InkWell(
                                                            splashFactory: NoSplash
                                                                .splashFactory,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () {
                                                              setState(() {
                                                                website =
                                                                    !website;
                                                              });
                                                            },
                                                            child:
                                                                AnimatedContainer(
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      500),
                                                              width: website
                                                                  ? 120
                                                                  : 90,
                                                              height: 38,
                                                              decoration:
                                                                  BoxDecoration(
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: [
                                                                    Color(
                                                                        0xFFA3D8F4),
                                                                    Color(
                                                                        0xFF28DF99)
                                                                  ],
                                                                  stops: [0, 1],
                                                                  begin:
                                                                      AlignmentDirectional(
                                                                          0,
                                                                          -1),
                                                                  end:
                                                                      AlignmentDirectional(
                                                                          0, 1),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2,
                                                                            2,
                                                                            2,
                                                                            2),
                                                                child:
                                                                    Container(
                                                                  width: 100,
                                                                  height: 100,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFF10141C),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            100),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            13,
                                                                            0,
                                                                            13,
                                                                            0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              4),
                                                                          child:
                                                                              Text(
                                                                            'Website',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'HANK',
                                                                                  color: Color(0xDCFFFFFF),
                                                                                  fontSize: 14,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        website
                                                                            ? DelayedWidget(
                                                                                delayDuration: Duration(milliseconds: 500), // Not required
                                                                                animationDuration: Duration(milliseconds: 400), // Not required
                                                                                animation: DelayedAnimations.SLIDE_FROM_RIGHT, // No
                                                                                child: Container(
                                                                                  width: 20,
                                                                                  height: 20,
                                                                                  decoration: BoxDecoration(
                                                                                    gradient: LinearGradient(
                                                                                      colors: [
                                                                                        Color(0xFFA3D8F4),
                                                                                        Color(0xFF28DF99)
                                                                                      ],
                                                                                      stops: [0, 1],
                                                                                      begin: AlignmentDirectional(0, -1),
                                                                                      end: AlignmentDirectional(0, 1),
                                                                                    ),
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                    child: Container(
                                                                                        width: 100,
                                                                                        height: 100,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0xFF10141C),
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: DelayedWidget(
                                                                                          delayDuration: Duration(milliseconds: 800), // Not required
                                                                                          animationDuration: Duration(milliseconds: 400), // Not required
                                                                                          animation: DelayedAnimations.SLIDE_FROM_BOTTOM, // No),
                                                                                          child: Icon(
                                                                                            Icons.check,
                                                                                            size: 14,
                                                                                            color: Colors.white,
                                                                                          ),
                                                                                        )),
                                                                                  ),
                                                                                ),
                                                                              )
                                                                            : Container()
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 10,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                          ),
                                                          child: InkWell(
                                                            splashFactory: NoSplash
                                                                .splashFactory,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () {
                                                              setState(() {
                                                                Branding =
                                                                    !Branding;
                                                              });
                                                            },
                                                            child:
                                                                AnimatedContainer(
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      500),
                                                              width: Branding
                                                                  ? 120
                                                                  : 90,
                                                              height: 38,
                                                              decoration:
                                                                  BoxDecoration(
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: [
                                                                    Color(
                                                                        0xFFA3D8F4),
                                                                    Color(
                                                                        0xFF28DF99)
                                                                  ],
                                                                  stops: [0, 1],
                                                                  begin:
                                                                      AlignmentDirectional(
                                                                          0,
                                                                          -1),
                                                                  end:
                                                                      AlignmentDirectional(
                                                                          0, 1),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2,
                                                                            2,
                                                                            2,
                                                                            2),
                                                                child:
                                                                    Container(
                                                                  width: 100,
                                                                  height: 100,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFF10141C),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            100),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            13,
                                                                            0,
                                                                            13,
                                                                            0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              4),
                                                                          child:
                                                                              Text(
                                                                            'Branding',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'HANK',
                                                                                  color: Color(0xDCFFFFFF),
                                                                                  fontSize: 14,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Branding
                                                                            ? DelayedWidget(
                                                                                delayDuration: Duration(milliseconds: 500), // Not required
                                                                                animationDuration: Duration(milliseconds: 400), // Not required
                                                                                animation: DelayedAnimations.SLIDE_FROM_RIGHT, // No
                                                                                child: Container(
                                                                                  width: 20,
                                                                                  height: 20,
                                                                                  decoration: BoxDecoration(
                                                                                    gradient: LinearGradient(
                                                                                      colors: [
                                                                                        Color(0xFFA3D8F4),
                                                                                        Color(0xFF28DF99)
                                                                                      ],
                                                                                      stops: [0, 1],
                                                                                      begin: AlignmentDirectional(0, -1),
                                                                                      end: AlignmentDirectional(0, 1),
                                                                                    ),
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                    child: Container(
                                                                                        width: 20,
                                                                                        height: 20,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0xFF10141C),
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: DelayedWidget(
                                                                                          delayDuration: Duration(milliseconds: 800), // Not required
                                                                                          animationDuration: Duration(milliseconds: 400), // Not required
                                                                                          animation: DelayedAnimations.SLIDE_FROM_BOTTOM, // No),
                                                                                          child: Icon(
                                                                                            Icons.check,
                                                                                            size: 14,
                                                                                            color: Colors.white,
                                                                                          ),
                                                                                        )),
                                                                                  ),
                                                                                ),
                                                                              )
                                                                            : Container()
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 10,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                          ),
                                                          child: InkWell(
                                                            splashFactory: NoSplash
                                                                .splashFactory,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () {
                                                              setState(() {
                                                                dataAnalysis =
                                                                    !dataAnalysis;
                                                              });
                                                            },
                                                            child:
                                                                AnimatedContainer(
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      500),
                                                              width:
                                                                  dataAnalysis
                                                                      ? 150
                                                                      : 122,
                                                              height: 38,
                                                              decoration:
                                                                  BoxDecoration(
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: [
                                                                    Color(
                                                                        0xFFA3D8F4),
                                                                    Color(
                                                                        0xFF28DF99)
                                                                  ],
                                                                  stops: [0, 1],
                                                                  begin:
                                                                      AlignmentDirectional(
                                                                          0,
                                                                          -1),
                                                                  end:
                                                                      AlignmentDirectional(
                                                                          0, 1),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2,
                                                                            2,
                                                                            2,
                                                                            2),
                                                                child:
                                                                    Container(
                                                                  width: 100,
                                                                  height: 100,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFF10141C),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            100),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            13,
                                                                            0,
                                                                            13,
                                                                            0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              4),
                                                                          child:
                                                                              Text(
                                                                            'Data Analysis',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'HANK',
                                                                                  color: Color(0xDCFFFFFF),
                                                                                  fontSize: 14,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        dataAnalysis
                                                                            ? DelayedWidget(
                                                                                delayDuration: Duration(milliseconds: 500), // Not required
                                                                                animationDuration: Duration(milliseconds: 400), // Not required
                                                                                animation: DelayedAnimations.SLIDE_FROM_RIGHT, // No
                                                                                child: Container(
                                                                                  width: 20,
                                                                                  height: 20,
                                                                                  decoration: BoxDecoration(
                                                                                    gradient: LinearGradient(
                                                                                      colors: [
                                                                                        Color(0xFFA3D8F4),
                                                                                        Color(0xFF28DF99)
                                                                                      ],
                                                                                      stops: [0, 1],
                                                                                      begin: AlignmentDirectional(0, -1),
                                                                                      end: AlignmentDirectional(0, 1),
                                                                                    ),
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                    child: Container(
                                                                                        width: 20,
                                                                                        height: 20,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0xFF10141C),
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: DelayedWidget(
                                                                                          delayDuration: Duration(milliseconds: 800), // Not required
                                                                                          animationDuration: Duration(milliseconds: 400), // Not required
                                                                                          animation: DelayedAnimations.SLIDE_FROM_BOTTOM, // No),
                                                                                          child: Icon(
                                                                                            Icons.check,
                                                                                            size: 14,
                                                                                            color: Colors.white,
                                                                                          ),
                                                                                        )),
                                                                                  ),
                                                                                ),
                                                                              )
                                                                            : Container()
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 20.0, 20.0, 20.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 100.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child:
                                                                TextFormField(
                                                              controller: Name,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      fontSize:
                                                                          22.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                hintText:
                                                                    'Your Name',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                        fontFamily:
                                                                            'HANK',
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        useGoogleFonts:
                                                                            false),
                                                                enabledBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFFA3D8F4),
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFFA3D8F4),
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                errorBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 100.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child:
                                                                TextFormField(
                                                              controller: Email,
                                                              validator: (input) =>
                                                                  input!.isValidEmail()
                                                                      ? null
                                                                      : "Invalid Email",
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .onUserInteraction,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                        fontFamily:
                                                                            'HANK',
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        useGoogleFonts:
                                                                            false),
                                                                hintText:
                                                                    'Your Email',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                        fontFamily:
                                                                            'HANK',
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        useGoogleFonts:
                                                                            false),
                                                                enabledBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFFA3D8F4),
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFFA3D8F4),
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                errorBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 20.0, 20.0, 20.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 100.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  Details,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                        fontFamily:
                                                                            'HANK',
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        useGoogleFonts:
                                                                            false),
                                                                hintText:
                                                                    'Project Details',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                        fontFamily:
                                                                            'HANK',
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        useGoogleFonts:
                                                                            false),
                                                                enabledBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFFA3D8F4),
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFFA3D8F4),
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                errorBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        30.0, 30.0, 30.0, 30.0),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        InkWell(
                                                          splashFactory: NoSplash
                                                              .splashFactory,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () {
                                                            if (Name.text
                                                                    .isEmpty ||
                                                                Email.text
                                                                    .isEmpty ||
                                                                Details.text
                                                                    .isEmpty ||
                                                                !Email.text!
                                                                    .isValidEmail()) {
                                                              requestStatus =
                                                                  'Please check all required fields';
                                                              requestSent = 0;
                                                              setState(() {});
                                                            } else if (mobileApp ==
                                                                    false &&
                                                                website ==
                                                                    false &&
                                                                dataAnalysis ==
                                                                    false) {
                                                              requestStatus =
                                                                  'Please select at least one type of service';
                                                              requestSent = 0;

                                                              setState(() {});
                                                            } else {
                                                              addRequest();
                                                              Name.clear();
                                                              Email.clear();
                                                              Details.clear();
                                                              mobileApp = false;
                                                              website = false;
                                                              dataAnalysis =
                                                                  false;
                                                              requestStatus =
                                                                  "Request sent, We\'ll be in touch soon.";
                                                              requestSent =
                                                                  requestSent +
                                                                      1;
                                                              setState(() {});
                                                            }
                                                          },
                                                          child: Text(
                                                            'Send Request',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  fontSize:
                                                                      28.0,
                                                                  color: requestSent >
                                                                          0
                                                                      ? Color(
                                                                          0xFF28DF99)
                                                                      : Colors
                                                                          .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .navigate_next_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            requestStatus,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  useGoogleFonts:
                                                                      false,
                                                                  fontFamily:
                                                                      'HANK',
                                                                  fontSize:
                                                                      14.0,
                                                                  color: requestSent >
                                                                          0
                                                                      ? Color(
                                                                          0xFF28DF99)
                                                                      : const Color
                                                                          .fromRGBO(
                                                                          255,
                                                                          82,
                                                                          82,
                                                                          1),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 20.0, 20.0, 20.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Or we can have a chat...',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    useGoogleFonts: false,
                                                    fontFamily: 'HANK',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 20.0, 20.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Via email at:',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    useGoogleFonts: false,
                                                    fontFamily: 'HANK',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 20.0),
                                        child: InkWell(
                                          splashFactory: NoSplash.splashFactory,
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            launch(
                                                "mailto:inquiries@CatalystSolutions.site?subject=Inquiry&body=");
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5.0, right: 15),
                                                child: SelectableText(
                                                  'inquiries@CatalystSolutions.site',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        useGoogleFonts: false,
                                                        fontFamily: 'HANK',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              Icon(
                                                Icons.send,
                                                size: 14,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 20.0, 20.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Via Phone at:',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    useGoogleFonts: false,
                                                    fontFamily: 'HANK',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: InkWell(
                                          splashFactory: NoSplash.splashFactory,
                                          highlightColor: Colors.transparent,
                                          onTap: () => whatsapp(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              SelectableText(
                                                '+961-70858410 ',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          useGoogleFonts: false,
                                                          fontFamily: 'HANK',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Icon(
                                                FontAwesomeIcons.whatsapp,
                                                size: 18,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 20.0, 20.0, 40.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            InkWell(
                                              splashFactory:
                                                  NoSplash.splashFactory,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () {
                                                launchUrl(Uri.parse(
                                                    'https://instagram.com/catalyst_sol?igshid=MzMyNGUyNmU2YQ=='));
                                              },
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 25.0, 0.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.instagram,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 30.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 83.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 25.0, 20.0, 0.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 3),
                                            child: InkWell(
                                              splashFactory:
                                                  NoSplash.splashFactory,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () {
                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) =>
                                                        scrollAnimated(0));

                                                setState(() {
                                                  isHome = true;
                                                  isAbout = false;
                                                  isService = false;
                                                  isWorks = false;
                                                  contactus = false;
                                                });
                                              },
                                              child: GradientText(
                                                'Catalyst',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'HANK',
                                                          fontSize: 30,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          useGoogleFonts: false,
                                                        ),
                                                colors: [
                                                  Color(0xFFA3D8F4),
                                                  Color(0xFF28DF99)
                                                ],
                                                gradientDirection:
                                                    GradientDirection.ltr,
                                                gradientType:
                                                    GradientType.linear,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        splashFactory: NoSplash.splashFactory,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          Scrollable.ensureVisible(
                                              duration:
                                                  Duration(milliseconds: 900),
                                              MobileContact.currentContext!);
                                          setState(() {
                                            isHome = false;
                                            isAbout = false;
                                            isService = false;
                                            isWorks = false;
                                            contactus = true;
                                          });
                                        },
                                        onHover: (value) {
                                          setState(() {
                                            contactus = value;
                                          });
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 450),
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: contactus
                                                  ? Color(0xFF28DF99)
                                                  : Color(0xFFA3D8F4),
                                            ),
                                            color: contactus
                                                ? Color(0xFFA3D8F4)
                                                : Color(0xFF10141C),
                                          ),
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 15.0, 0.0),
                                              child: Text(
                                                'Contact Us',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'HANK',
                                                      useGoogleFonts: false,
                                                      color: contactus
                                                          ? Color(0xFF10141C)
                                                          : Color.fromARGB(255,
                                                              255, 255, 255),
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 17.5,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 0.5,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF28DF99),
                                          Color(0xFFA3D8F4)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(1, 0),
                                        end: AlignmentDirectional(-1, 0),
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
      ),
    );
  }
}
