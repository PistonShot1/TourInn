import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_inn_app/Schemes/profile.dart';
import 'package:tour_inn_app/Theme/themeColor.dart';
import 'package:tour_inn_app/User/Model/profileWidgetModel.dart';
import 'package:tour_inn_app/User/Screens/earnPoints.dart';
import 'package:tour_inn_app/User/Screens/editProfile.dart';
import 'package:tour_inn_app/User/Screens/login.dart';
import 'package:tour_inn_app/User/Screens/privacyPolicy.dart';
import 'package:tour_inn_app/User/Screens/support.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => ProfileWidgetState();
}

class ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;
  @override
  void initState() {
    // TODO: implement initState
    _model = ProfileModel();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ProfileInfo profileInfo = Provider.of<ProfileInfo>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      width: 50,
                      height: 60,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/defaultUserPic.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.00, 0.00),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 4),
                            child: Consumer<ProfileInfo>(
                              builder: (BuildContext context, ProfileInfo value,
                                  Widget? child) {
                                return Text(
                                  value.name!,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: ThemeProperty.primaryBackground,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5,
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Text(
                              'Explore, book, experience',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: ThemeProperty.secondaryBackground,
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  await editAction(profileInfo);
                },
                child: Text('Edit'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF2C7EFF)),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(80, 30)),
                  side: MaterialStateProperty.all<BorderSide>(const BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  )),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100))),
                  textStyle:
                      MaterialStateProperty.all<TextStyle>(const TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 16,
                  )),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const EarnPoints();
              }));
            },
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
                  border: Border.all(
                    color: ThemeProperty.primaryText,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.00, 0.00),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 4),
                                  child: Text(
                                    'Earn with your space now',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: ThemeProperty.primaryBackground,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: Text(
                                    'Seamless setup, instant earnings',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: ThemeProperty.secondaryBackground,
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                      height: 1.5,
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
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
          child: Material(
            color: Colors.transparent,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: ListView(
                  padding: EdgeInsets.all(10),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                      child: Text(
                        'Account',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: ThemeProperty.secondaryBackground,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.password,
                            color: Color(0xFF2C6BFF),
                            size: 20,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Change Password',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: ThemeProperty.secondaryBackground,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          color: ThemeProperty.secondaryText,
                          size: 24,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.notifications_none,
                            color: Color(0xFF2C6BFF),
                            size: 20,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Pop-up Notifications',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: ThemeProperty.secondaryBackground,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Switch(
                          value: _model.switchValue1 ??= true,
                          onChanged: (newValue) async {
                            setState(() => _model.switchValue1 = newValue!);
                          },
                          activeColor: Color(0xFF0059FF),
                          inactiveTrackColor: ThemeProperty.accent1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 12),
          child: Material(
            color: Colors.transparent,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                      child: Text(
                        'Other',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: ThemeProperty.secondaryBackground,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        // TODO : navigation
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                          return const ContactUs();
                        })));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Icon(
                            Icons.contact_support_outlined,
                            color: Color(0xFF2C6BFF),
                            size: 20,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Contact Us',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: ThemeProperty.secondaryBackground,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: ThemeProperty.secondaryText,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const PrivacyPolicy();
                        }));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Icon(
                            Icons.privacy_tip_outlined,
                            color: Color(0xFF2C6BFF),
                            size: 20,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Privacy Policy',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: ThemeProperty.secondaryBackground,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: ThemeProperty.secondaryText,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
                child: ElevatedButton(
                    onPressed: () async {
                      await logOut(context);
                    },
                    child: Text('Log Out'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF2C7EFF)),
                        side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        )),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                            const TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        )),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))))),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    if (context.mounted) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return const Login();
      }));
    }
  }

  Future<Widget?> editAction(ProfileInfo profileInfo) async {
    if (profileInfo.email == '' || profileInfo.email == null) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                'Edit Not Allowed !',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content:
                  const Text('Please logout from guest and login with email.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            );
          });
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return EditProfile();
      }));
    }
    return null;
  }
}
