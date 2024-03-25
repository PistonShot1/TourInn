import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tour_inn_app/Theme/themeColor.dart';
import 'package:tour_inn_app/User/Model/filtermenumodel.dart';

class FilterMenu extends StatefulWidget {
  const FilterMenu({super.key});

  @override
  State<FilterMenu> createState() => _FilterMenuState();
}

class _FilterMenuState extends State<FilterMenu> {
  late FilterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = FilterModel();
    _model.textController1 ??= TextEditingController(text: 'MYR 0');
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController(text: 'MYR 50');
    _model.textFieldFocusNode2 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return // Generated code for this Column Widget...
        Material(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: Icon(
                        Icons.filter_alt,
                        color: ThemeProperty.secondaryBackground,
                        size: 44,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      'Filter your unit',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: ThemeProperty.primaryBackground,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: Text(
                        'Choose anything you like!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: ThemeProperty.primaryBackground,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 12, 0, 0),
                    child: Text(
                      'Price Range',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: ThemeProperty.primaryBackground,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 1),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: ThemeProperty.primaryText,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0,
                          color: ThemeProperty.primaryText,
                          offset: Offset(0, 1),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 8, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 140,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 8, 0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Min',
                                      labelStyle: const TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors
                                            .blue, // Use a color that contrasts with the background
                                        fontSize: 16,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors
                                              .blue, // Adjust the color as needed
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors
                                          .black, // Adjust the text color as needed
                                      fontSize: 14,
                                    ),
                                    controller: _model.textController1,
                                    focusNode: _model.textFieldFocusNode1,
                                    obscureText: false,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 140,
                                decoration: BoxDecoration(),
                                child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 8, 0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: 'Max',
                                        labelStyle: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors
                                              .blue, // Use a color that contrasts with the background
                                          fontSize: 16,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors
                                                .blue, // Adjust the color as needed
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors
                                            .black, // Adjust the text color as needed
                                        fontSize: 14,
                                      ),
                                      controller: _model.textController2,
                                      focusNode: _model.textFieldFocusNode2,
                                      obscureText: false,
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 1),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: ThemeProperty.primaryText,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0,
                          color: ThemeProperty.primaryText,
                          offset: Offset(0, 1),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Text(
                              'Property Type',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: ThemeProperty.primaryBackground,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(28, 0, 20, 1),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: ThemeProperty.primaryText,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0,
                          color: ThemeProperty.primaryText,
                          offset: Offset(0, 1),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 8, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Color(0xFF1453BA),
                              shape: BoxShape.circle,
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: Icon(
                              Icons.house,
                              color: ThemeProperty.primaryText,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'House',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: ThemeProperty.primaryBackground,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              unselectedWidgetColor:
                                  ThemeProperty.secondaryText,
                            ),
                            child: Checkbox(
                              value: _model.checkboxValue1 ??= true,
                              onChanged: (newValue) async {
                                setState(
                                    () => _model.checkboxValue1 = newValue!);
                              },
                              activeColor: ThemeProperty.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(28, 0, 20, 1),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: ThemeProperty.primaryText,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0,
                          color: ThemeProperty.primaryText,
                          offset: Offset(0, 1),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 8, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Color(0xFF1453BA),
                              shape: BoxShape.circle,
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: Icon(
                              Icons.apartment_sharp,
                              color: ThemeProperty.primaryText,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Apartment',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: ThemeProperty.primaryBackground,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              unselectedWidgetColor:
                                  ThemeProperty.secondaryText,
                            ),
                            child: Checkbox(
                              value: _model.checkboxValue2 ??= true,
                              onChanged: (newValue) async {
                                setState(
                                    () => _model.checkboxValue2 = newValue!);
                              },
                              activeColor: ThemeProperty.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(28, 0, 20, 1),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: ThemeProperty.primaryText,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0,
                          color: ThemeProperty.primaryText,
                          offset: Offset(0, 1),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 8, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Color(0xFF1453BA),
                              shape: BoxShape.circle,
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: Icon(
                              Icons.hotel_outlined,
                              color: ThemeProperty.primaryText,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Hotel',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: ThemeProperty.primaryBackground,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              unselectedWidgetColor:
                                  ThemeProperty.secondaryText,
                            ),
                            child: Checkbox(
                              value: _model.checkboxValue3 ??= true,
                              onChanged: (newValue) async {
                                setState(
                                    () => _model.checkboxValue3 = newValue!);
                              },
                              activeColor: ThemeProperty.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                    child: SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                          print('Button pressed ...');
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(ThemeProperty.accent1),
                          textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: ThemeProperty.large)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40))),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          // Create a map to store the selected values
                          Map<String, dynamic> selectedValues = {
                            'minPrice': _model.textController1?.text,
                            'maxPrice': _model.textController2?.text,
                            'propertyType1': _model.checkboxValue1,
                            'propertyType2': _model.checkboxValue2,
                            'propertyType3': _model.checkboxValue3,
                            // Add other values as needed
                          };

                          // Send the map as the result to the previous page
                          Navigator.pop(context, selectedValues);
                        },
                        child: const Text(
                          'Confirm',
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color(0XFF1C4494),
                          ),
                          textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: ThemeProperty.large)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40))),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
