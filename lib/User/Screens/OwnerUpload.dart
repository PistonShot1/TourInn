import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:tour_inn_app/Theme/themeColor.dart';
import 'package:file_picker/file_picker.dart';

class OwnerUpload extends StatefulWidget {
  const OwnerUpload({super.key});

  @override
  State<OwnerUpload> createState() => _OwnerUploadState();
}

class _OwnerUploadState extends State<OwnerUpload> {
  bool fileUpload1 = false;
  bool fileUpload2 = false;
  @override
  Widget build(BuildContext context) {
    return // Generated code for this OwnerUpload Widget...
        Scaffold(
      backgroundColor: ThemeProperty.primaryText,
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 296,
                  height: 150,
                  decoration: BoxDecoration(
                    color: ThemeProperty.secondaryBackground,
                  ),
                  child: Image.asset(
                    'assets/PYDC AR (4).gif',
                    width: 0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Experience Every Angle, Anywhere You Stay',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: ThemeProperty.primaryBackground,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Text(
                          'Virtual Reality',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: ThemeProperty.accent2,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: ThemeProperty.primaryText,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 4),
                                        child: Text(
                                          'Be more than just a picture',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color:
                                                ThemeProperty.primaryBackground,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 8),
                                        child: Text(
                                          '360 Views, 5-Star Reviews',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: ThemeProperty
                                                .secondaryBackground,
                                            fontSize: 13,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Container(
                              width: 80,
                              height: 80,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/Untitled_design.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 15, 30, 15),
                  child: ElevatedButton(
                    onPressed: () async {
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(type: FileType.custom, allowedExtensions: [
                        'jpg',
                        'pdf',
                        'doc',
                        'png',
                        'tiff'
                      ]);
                      fileUpload1 = false;
                      if (result != null) {
                        File file = File(result.files.single.path!);
                        if (await file.exists()) {
                          fileUpload1 = true;
                          print(fileUpload1);
                        }
                        print('Uploaded');
                      } else {
                        fileUpload1 = false;
                      }
                    },
                    child: Text('Upload 360 View'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF2C7EFF)),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: ThemeProperty.primaryText,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 4),
                                        child: Text(
                                          'We need your floor plan',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color:
                                                ThemeProperty.primaryBackground,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 8),
                                        child: Text(
                                          'Help us make it better for you',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: ThemeProperty
                                                .secondaryBackground,
                                            fontSize: 13,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: CircleAvatar(
                              child: Image.asset(
                                'assets/floorplan.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(52, 15, 52, 15),
                  child: ElevatedButton(
                    // onPressed: () async {
                    //   Navigator.push(
                    //     context,
                    //     PageTransition(
                    //       type: PageTransitionType.fade,
                    //       duration: Duration(milliseconds: 300),
                    //       reverseDuration: Duration(milliseconds: 300),
                    //       child: HotelDescWidget(),
                    //     ),
                    //   );
                    // },
                    onPressed: () async {
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(type: FileType.custom, allowedExtensions: [
                        'jpg',
                        'pdf',
                        'doc',
                        'png',
                        'tiff'
                      ]);
                      fileUpload2 = false;
                      if (result != null) {
                        File file = File(result.files.single.path!);
                        if (await file.exists()) {
                          fileUpload2 = true;
                          print(fileUpload2);
                        }
                        print('Uploaded');
                      } else {
                        fileUpload2 = false;
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF2C7EFF)),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                    ),
                    child: Text('Upload Floor Plan'),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(32, 36, 32, 10),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (fileUpload1 && fileUpload2) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(
                                  'Thank You!',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                content: const Text(
                                    'We have received your submission for review. Please check your email for further details.'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            });
                        if (context.mounted) {
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                        }
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(
                                  'Failed to Submit!',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                content: const Text(
                                    'Please makesure both files are uploaded correctly!'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            });
                      }
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.fromLTRB(40, 15, 40, 15)),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF6D98F0)),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                    ),
                    child: Text('Submit for Review'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                    textStyle: MaterialStateProperty.all(const TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                  ),
                  child: const Text('Cancel'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
