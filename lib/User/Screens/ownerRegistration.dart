import 'package:flutter/material.dart';
import 'package:tour_inn_app/Theme/themeColor.dart';
import 'package:tour_inn_app/User/Model/ownerRegistrationModel.dart';
import 'package:tour_inn_app/User/Screens/OwnerUpload.dart';

class OwnerRegistration extends StatefulWidget {
  const OwnerRegistration({Key? key}) : super(key: key);

  @override
  State<OwnerRegistration> createState() => _OwnerRegistrationState();
}

class _OwnerRegistrationState extends State<OwnerRegistration> {
  double _scaleFactor = 1.0;
  double _baseScaleFactor = 1.0;
  late OwnerRegistrationModel _model;

  @override
  void initState() {
    super.initState();
    _model = OwnerRegistrationModel();

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return // Generated code for this OwnerRegistration Widget...
        Scaffold(
      backgroundColor: ThemeProperty.primaryText,
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 0),
          child: ListView(
            children: [
              Image.asset(
                'assets/PYDC AR (3).gif',
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Tell Us About Your Place',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: ThemeProperty.primaryBackground,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                      child: Text(
                        'It will help us to know more about you!',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: ThemeProperty.accent2,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _model.textController1,
                        focusNode: _model.textFieldFocusNode1,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Give your place a title',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xFFADA4A5),
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
                              color: ThemeProperty.secondary,
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
                        // validator: _model.textController1Validator
                        //     .asValidator(context),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _model.textController2,
                        focusNode: _model.textFieldFocusNode2,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Where\'s your place located at?',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xFFADA4A5),
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
                              color: ThemeProperty.secondary,
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
                            Icons.place_outlined,
                            color: ThemeProperty.accent1,
                            size: 24,
                          ),
                        ),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: ThemeProperty.primaryBackground,
                        ),
                        // validator: _model.textController2Validator
                        //     .asValidator(context),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _model.textController3,
                        focusNode: _model.textFieldFocusNode3,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText:
                              'Property link (e.g AirBnb, Booking.com, etc.)',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xFFADA4A5),
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
                              color: ThemeProperty.secondary,
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
                            Icons.web,
                            color: ThemeProperty.accent1,
                            size: 24,
                          ),
                        ),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: ThemeProperty.primaryBackground,
                        ),
                        // validator: _model.textController2Validator
                        //     .asValidator(context),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          decoration: BoxDecoration(
                            color: ThemeProperty.primaryText,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Icon(
                                  Icons.home_work_outlined,
                                  color: ThemeProperty.accent1,
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 20, 40, 20),
                                child: DropdownButton<String>(
                                  menuMaxHeight: 200,
                                  value: _model.dropDownValue1,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _model.dropDownValue1 = newValue!;
                                    });
                                  },
                                  items: [
                                    'House',
                                    'Flat/Apartment',
                                    'Cabin',
                                    'Hotel',
                                    'Loft',
                                    'Tree House',
                                    'Guest House',
                                    'Campervan'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color:
                                              ThemeProperty.primaryBackground,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  hint: Text(
                                    'Describe your place',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: ThemeProperty.primaryBackground,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: ThemeProperty.primaryBackground,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  isExpanded:
                                      true, // This property makes the dropdown button take up the full width
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          decoration: BoxDecoration(
                            color: ThemeProperty.primaryText,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Icon(
                                  Icons.broadcast_on_home,
                                  color: ThemeProperty.accent1,
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 20, 40, 20),
                                child: DropdownButton<String>(
                                  menuMaxHeight: 200,
                                  value: _model.dropDownValue2,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _model.dropDownValue2 = newValue!;
                                    });
                                  },
                                  items: [
                                    'Wifi',
                                    'TV',
                                    'Kitchen',
                                    'Free Parking',
                                    'Washing Machine',
                                    'Air Conditioning',
                                    'Dedicated Workspace',
                                    'Pool',
                                    'Hot Tub',
                                    'Fire Pit',
                                    'Piano',
                                    'Pool Table',
                                    'Exercise Equipment',
                                    'BBQ Grill'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color:
                                              ThemeProperty.primaryBackground,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  hint: Text(
                                    'What your place offers?',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: ThemeProperty.primaryBackground,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: ThemeProperty.primaryBackground,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  isExpanded:
                                      true, // This property makes the dropdown button take up the full width
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          decoration: BoxDecoration(
                            color: ThemeProperty.primaryText,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Icon(
                                  Icons.health_and_safety_outlined,
                                  color: ThemeProperty.accent1,
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 20, 40, 20),
                                  child: DropdownButtonFormField<String>(
                                    menuMaxHeight: 200,
                                    value: _model.dropDownValue3,
                                    onChanged: (String? newValue) {
                                      // Implement your logic to manage selected safety items
                                      setState(() {
                                        if (newValue != null) {
                                          _model.dropDownValue3 = newValue;
                                        }
                                      });
                                    },
                                    items: [
                                      'Smoke Alarm',
                                      'Fire Extinguisher',
                                      'First Aid Kit',
                                      'Carbon Monoxide Alarm'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color:
                                                ThemeProperty.primaryBackground,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    hint: Text(
                                      'Do you have any safety items?',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: ThemeProperty.primaryBackground,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: ThemeProperty.primaryBackground,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    isExpanded:
                                        true, // This property makes the dropdown button take up the full width
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
                    padding: EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return OwnerUpload();
                        }));
                      },
                      child: Text('Continue'),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFF2C7EFF)),
                          textStyle: MaterialStateProperty.all(const TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                          side: MaterialStateProperty.all(const BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          )),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.fromLTRB(40, 15, 40, 15)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)))),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
