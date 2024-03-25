import 'package:flutter/material.dart';
import 'package:tour_inn_app/Schemes/location.dart';
import 'package:tour_inn_app/Theme/themeColor.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tour_inn_app/User/Model/roomDescriptionModel.dart';
import 'package:tour_inn_app/User/Screens/ARview.dart';
import 'package:tour_inn_app/User/Screens/viewImages.dart';
import 'package:tour_inn_app/User/Screens/virtualTour.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

// ignore: camel_case_types
class roomDescription extends StatefulWidget {
  MapLocation location;
  roomDescription({super.key, required this.location});

  @override
  State<roomDescription> createState() => _roomDescriptionState();
}

// ignore: camel_case_types
class _roomDescriptionState extends State<roomDescription> {
  late RoomDescModel _model;
  bool is3Davailable = true;

  @override
  void initState() {
    _model = RoomDescModel();
    _model.initState(context);
    check3Davaialbility(widget.location);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned.fill(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: MediaQuery.of(context).size.height * 0.5,
                  child: Image.network(
                    widget.location.imgUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.4,
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.6,
                      maxWidth: MediaQuery.of(context).size.width,
                    ),
                    decoration: BoxDecoration(
                      color: ThemeProperty.primaryText,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                      border: Border.all(
                        color: ThemeProperty.accent2,
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                      child: Column(
                        // mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 10, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 10, 0),
                                        child: Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF6593C9),
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 10,
                                                color: Color(0x2596C3E2),
                                                offset: Offset(0, 6),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          alignment: const AlignmentDirectional(
                                              0.00, 0.00),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(16, 0, 16, 0),
                                            child: Text(
                                              'Top Rates',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color:
                                                    ThemeProperty.primaryText,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Text(
                                    '${widget.location.name}',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: ThemeProperty.secondaryBackground,
                                      fontSize: 21,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 4, 0, 0),
                                      child: RatingBar.builder(
                                        ignoreGestures: true,
                                        onRatingUpdate: (newValue) => setState(
                                            () => _model.ratingBarValue =
                                                newValue),
                                        itemBuilder: (context, index) =>
                                            const Icon(
                                          Icons.star_rounded,
                                          color: Colors.amber,
                                        ),
                                        direction: Axis.horizontal,
                                        initialRating: widget.location.rating ??
                                            0, //TODO : rating
                                        unratedColor: ThemeProperty.accent3,
                                        itemCount: 5,
                                        itemSize: 32,
                                        glowColor:
                                            ThemeProperty.primaryBackground,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 4, 0, 0),
                                      child: Text(
                                        (widget.location.rating != 0)
                                            ? '${widget.location.rating}'
                                            : 'N/A',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color:
                                              ThemeProperty.primaryBackground,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      //TODO : next page to virtual touring
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (BuildContext context) {
                                        return View360NImages(
                                            location: widget.location);
                                      }));
                                    },
                                    child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(
                                          color: Color(0xFF2C7EFF),
                                          width: 2,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Virtual Tour',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: ThemeProperty
                                                      .primaryBackground,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.view_in_ar,
                                                color: ThemeProperty
                                                    .primaryBackground,
                                                size: 48,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      //TODO : navigation
                                      if (is3Davailable) {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text(
                                                  'Welcome to AR experience',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                content: const Text(
                                                    '1. Place your camera on the QR image and wait for the target to appear. \n2. Tap on screen to load model and adjust image position if needed.\n3. Double tap on model to view 360 of each model.\n\nOnly if you do not have access to image, you may tap the icon button to view respective models of the unit in AR as well.'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            context, 'OK'),
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              );
                                            });

                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return ARView(
                                              location: widget.location);
                                        }));
                                      }
                                    },
                                    child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(
                                          color: (is3Davailable)
                                              ? const Color(0xFF2C7EFF)
                                              : Colors.grey,
                                          width: 2,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10),
                                                child: Text(
                                                  'Unit Review \nwith AR',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color: ThemeProperty
                                                          .primaryBackground,
                                                      fontSize: 18,
                                                      height: 1.1),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.home,
                                                color: ThemeProperty
                                                    .primaryBackground,
                                                size: 50,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                28, 0, 28, 28),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 16, 0),
                                    child: OutlinedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: OutlinedButton.styleFrom(
                                        padding: const EdgeInsets.all(15),
                                        side: const BorderSide(
                                          width: 2.0,
                                          color: Colors.blue,
                                        ),
                                        shape: const CircleBorder(),
                                      ),
                                      child: const Icon(Icons.arrow_back),
                                    )),
                                Expanded(
                                    child: ElevatedButton(
                                  onPressed: () async {
                                    final Uri _url =
                                        Uri.parse(widget.location.refUrl!);
                                    if (!await launchUrl(_url)) {
                                      throw Exception('Could not launch $_url');
                                    }
                                  },
                                  style: ButtonStyle(
                                    fixedSize: MaterialStateProperty.all<Size>(
                                        const Size(130, 50)),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xFF2C7EFF)),
                                    textStyle:
                                        MaterialStateProperty.all<TextStyle>(
                                            TextStyle(
                                      fontFamily: 'Poppins',
                                      color: ThemeProperty.primaryText,
                                      fontSize: 19,
                                      fontWeight: FontWeight.normal,
                                    )),
                                    elevation:
                                        MaterialStateProperty.all<double>(2),
                                    side: MaterialStateProperty.all<BorderSide>(
                                        const BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    )),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50))),
                                  ),
                                  child: const Text('Book'),
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  check3Davaialbility(MapLocation location) {
    if (location.matterportUrls!.isEmpty || location.matterportUrls == null) {
      is3Davailable = false;
    }
  }
}
