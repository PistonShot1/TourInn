import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_inn_app/Schemes/profile.dart';
import 'package:tour_inn_app/Theme/themeColor.dart';
import 'package:tour_inn_app/User/CustomWidgets/statusOverlay.dart';
import 'package:tour_inn_app/User/Model/editProfileModel.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late EditProfileModel _model;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _model = EditProfileModel();
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    ProfileInfo profileInfo = Provider.of<ProfileInfo>(context);
    return Scaffold(
      backgroundColor: ThemeProperty.primaryText,
      appBar: AppBar(title: Text('Edit your Profile')),
      body: Center(
          child: Form(
        key: _formKey,
        child: Consumer<ProfileInfo>(
          builder: (BuildContext context, ProfileInfo value, Widget? child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Generated code for this CircleImage Widget...
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2, 20, 2, 20),
                    child: Container(
                      width: 90,
                      height: 90,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person,
                        size: 90,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                    child: TextFormField(
                      controller: _model.textController1,
                      focusNode: _model.textFieldFocusNode1,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: value.name,
                        hintStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFFADA4A5),
                          height: 1.5,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ThemeProperty.secondaryBackground,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ThemeProperty.accent2,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        filled: true,
                        fillColor: ThemeProperty.primaryText,
                        prefixIcon: Icon(
                          Icons.subtitles,
                          color: ThemeProperty.accent1,
                          size: 24,
                        ),
                      ),
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: ThemeProperty.primaryBackground,
                      ),
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                    child: TextFormField(
                      controller: _model.textController2,
                      focusNode: _model.textFieldFocusNode2,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: (value.phoneNum != "")
                            ? value.phoneNum
                            : 'Phone Number',
                        hintStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFFADA4A5),
                          height: 1.5,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ThemeProperty.secondaryBackground,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ThemeProperty.accent2,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        filled: true,
                        fillColor: ThemeProperty.primaryText,
                        prefixIcon: Icon(
                          Icons.phone,
                          color: ThemeProperty.accent1,
                          size: 24,
                        ),
                      ),
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: ThemeProperty.primaryBackground,
                      ),
                      validator: (value) {
                        // Regular expression for a phone number with a compulsory leading '+'
                        final phoneRegex = RegExp(
                          r'^\+[0-9\s-]+$',
                        );

                        if (value != null) {
                          if (!phoneRegex.hasMatch(value)) {
                            return 'Enter phone number with country code !';
                          }
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        bool successUpdate = await formSubmit(
                            (_model.textController1?.value.text ??
                                profileInfo.name),
                            (_model.textController2?.value.text ??
                                profileInfo.phoneNum));

                        if (successUpdate) {
                          value.name = _model.textController1?.value.text ??
                              profileInfo.name;
                          value.phoneNum = _model.textController2?.value.text ??
                              profileInfo.phoneNum;
                        }
                        setState(() {
                          StatusOverlay.showOverlay(context, isSuccess: successUpdate);
                        });
                      },
                      child: Text('Save Changes'),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF2c7EFF)),
                          textStyle: MaterialStateProperty.all(const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                          elevation: MaterialStateProperty.all(2),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          fixedSize: MaterialStateProperty.all(Size(270, 50))),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      )),
    );
  }

  Future<bool> formSubmit(String? name, String? phoneNum) async {
    if (_formKey.currentState!.validate()) {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'name': name, 'phoneNum': phoneNum});
      return true;
    } else {
      return false;
    }
  }
}
