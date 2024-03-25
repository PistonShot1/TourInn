import 'package:flutter/material.dart';
import 'package:tour_inn_app/Theme/themeColor.dart';
import 'package:tour_inn_app/User/Model/supportModel.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  late SupportModel _model;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _model = SupportModel();

    _model.textController1 ??= TextEditingController();

    _model.textController2 ??= TextEditingController();


  }

  @override
  void dispose() {
    // TODO: implement dispose
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: // Generated code for this Text Widget...
            const Text(
          'Submit Ticket',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: // Generated code for this scrollingColumn Widget...
          Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4, 8, 0, 0),
                child: Text(
                  'Have burning question? 🔥',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: ThemeProperty.primaryBackground,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Row(mainAxisSize: MainAxisSize.max, children: [
                Expanded(
                  child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Container(
                          height: 62,
                          constraints: BoxConstraints(
                            maxWidth: 500,
                          ),
                          decoration: BoxDecoration(
                            color: ThemeProperty.primaryText,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: ThemeProperty.primaryText,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(8, 16, 8, 16),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.local_phone,
                                  color: ThemeProperty.primaryBackground,
                                  size: 32,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 0, 0),
                                  child: Text(
                                    'Call Us at +601121978276',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: ThemeProperty.primaryBackground,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                ),
              ]),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: Column(mainAxisSize: MainAxisSize.max, children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _model.textController1,
                            focusNode: _model.textFieldFocusNode1,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Title',
                              hintStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFFADA4A5),
                                height: 1,
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
                                  color: ThemeProperty.border,
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
                            validator: (value) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _model.textController2,
                            focusNode: _model.textFieldFocusNode2,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText:
                                  'Short description of what is going on...',
                              hintStyle: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFFADA4A5),
                                height: 1,
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
                                  color: ThemeProperty.border,
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
                                Icons.textsms,
                                color: ThemeProperty.accent1,
                                size: 24,
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: ThemeProperty.primaryBackground,
                            ),
                            validator: (vlaue) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 12),
                child: ElevatedButton(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                        const Size(double.infinity, 48)),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF2C7EFF)),
                    textStyle: MaterialStateProperty.all(const TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    )),
                    elevation: MaterialStateProperty.all(4),
                    side: MaterialStateProperty.all(const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    )),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60))),
                  ),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0,0,10,0.0),
                          child: Text('Submit Ticket'),
                        ),
                        Icon(
                          Icons.receipt_long,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
