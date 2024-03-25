import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tour_inn_app/User/Model/auth.dart';
import 'package:tour_inn_app/User/Screens/home.dart';
export 'package:tour_inn_app/User/Model/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tour_inn_app/User/Screens/loading.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final controller = PageController(initialPage: 0);
  late LoginRegisterModel _model;
  TabController? _tabController;
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  String errorText1 = '';
  String errorText2 = '';
  Map<String, String> userinputs = {};
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
    _tabController!.addListener(() {
      _handleTabChange();
    });
    _model = LoginRegisterModel();
    _model.initState(context);
    print("The password visibility is ${_model.passwordVisibility1}");
    _model.emailAddressController1 = TextEditingController();
    _model.emailAddressController1!.addListener(() {
      String text = _model.emailAddressController1!.text;
      userinputs['email'] = text;
    });
    _model.passwordController1 = TextEditingController();
    _model.passwordController1!.addListener(() {
      String text = _model.passwordController1!.text;
      userinputs['password'] = text;
    });

    _model.emailAddressController2 = TextEditingController();
    _model.emailAddressController2!.addListener(() {
      String text = _model.emailAddressController2!.text;
      userinputs['email'] = text;
    });

    _model.passwordController2 = TextEditingController();
    _model.passwordController2!.addListener(() {
      String text = _model.passwordController2!.text;
      userinputs['password'] = text;
    });

    _model.emailAddressFocusNode1 = FocusNode();
    _model.passwordFocusNode1 = FocusNode();
    _model.emailAddressFocusNode2 = FocusNode();
    _model.passwordFocusNode2 = FocusNode();

    super.initState();
  }

  void _handleTabChange() {
    setState(() {
      errorText1 = '';
      errorText2 = '';
    });
    // Handle tab change here
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
      backgroundColor: Color(0XFFF0F0F0),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Stack(
          children: [
            Positioned(
                top: MediaQuery.of(context).size.height * 0.1,
                left: 20,
                right: 20,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: double.infinity),
                  height: 230,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Tour Inn',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 36,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Your Central Stay Booking with VR',
                          style: TextStyle(color: Color(0XFF004AAD)),
                        ),
                      ],
                    ),
                  ),
                )),
            Positioned.fill(
                top: MediaQuery.of(context).size.height * 0.3,
                child: Container(
                  child: DefaultTabController(
                      length: 2,
                      child: Scaffold(
                        appBar: AppBar(
                          automaticallyImplyLeading: false,
                          title: null,
                          toolbarHeight: 1,
                          backgroundColor: Colors.white,
                          bottom: const TabBar(
                              labelStyle: TextStyle(
                                  fontSize: 18, fontFamily: 'Poppins'),
                              labelColor: Colors.black,
                              indicatorColor: Colors.purple,
                              tabs: [
                                Tab(text: 'Create Account'),
                                Tab(
                                  text: 'Log In',
                                )
                              ]),
                        ),
                        body: TabBarView(
                            children: [createAccountTab(), logInTab()]),
                      )),
                ))
          ],
        ),
      ),
    );
  }

  Widget createAccountTab() {
    return // Generated code for this Column Widget...
        Align(
      alignment: AlignmentDirectional(0.00, -1.00),
      child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create Account',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFF101213),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 24),
                  child: Text(
                    'Let\'s get started by filling out the form below.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF57636C),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Form(
                  key: _formKey1,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.emailAddressController1,
                            autofocus: false,
                            autofillHints: [AutofillHints.email],
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: const TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Color(0xFF57636C),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFE0E3E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFF4B39EF),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFFF5963),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFFF5963),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  24, 24, 24, 24),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0XFF192324),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }

                              // Regular expression for a common email pattern
                              final emailRegex = RegExp(
                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                              );

                              if (!emailRegex.hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }

                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.passwordController1,
                            autofocus: false,
                            autofillHints: [AutofillHints.password],
                            obscureText: !_model.passwordVisibility1,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: const TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Color(0xFF57636C),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFE0E3E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFF4B39EF),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFFF5963),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFFF5963),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  24, 24, 24, 24),
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                  () => _model.passwordVisibility1 =
                                      !_model.passwordVisibility1,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  _model.passwordVisibility1
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Color(0xFF57636C),
                                  size: 24,
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0XFF192324),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Text('${errorText1}',
                          style: TextStyle(
                            color: Colors.red,
                          )),
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: ElevatedButton(
                            onPressed: () async {
                              //validate for Register and log in
                              await signUp();
                            },
                            child: Text('Get Started'),
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(
                                  const Size(230, 50)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFF2C6BFF)),
                              textStyle: MaterialStateProperty.all<TextStyle>(
                                  const TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              )),
                              elevation: MaterialStateProperty.all<double>(3),
                              side: MaterialStateProperty.all<BorderSide>(
                                  const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              )),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40))),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 24),
                        child: Text(
                          'Or sign up with',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xFF57636C),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: Wrap(
                          spacing: 16,
                          runSpacing: 0,
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.center,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: ElevatedButton(
                                onPressed: () async {
                                  await anonymousSignIn();
                                },
                                style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all(
                                      const Size(230, 50)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0xFF101213)),
                                  textStyle:
                                      MaterialStateProperty.all<TextStyle>(
                                          const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  )),
                                  elevation:
                                      MaterialStateProperty.all<double>(1),
                                  side: MaterialStateProperty.all<BorderSide>(
                                      const BorderSide(
                                    color: Color(0XFFE0E3E7),
                                    width: 2,
                                  )),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40))),
                                ),
                                child: const Text('Guest'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Widget logInTab() {
    return Align(
      alignment: AlignmentDirectional(0.00, -1.00),
      child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome Back',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFF101213),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 24),
                  child: Text(
                    'Fill out the information below in order to access your account.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF57636C),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Form(
                  key: _formKey2,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.emailAddressController2,
                            focusNode: _model.emailAddressFocusNode2,
                            autofocus: false,
                            autofillHints: [AutofillHints.email],
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF57636C),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFF1F4F8),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFF4B39EF),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFE0E3E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFE0E3E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(24, 24, 0, 24),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF101213),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.passwordController2,
                            focusNode: _model.passwordFocusNode2,
                            autofocus: false,
                            autofillHints: [AutofillHints.password],
                            obscureText: !_model.passwordVisibility2,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF57636C),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFE0E3E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFF4B39EF),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFFF5963),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFFF5963),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                      24, 24, 0, 24),
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                  () => _model.passwordVisibility2 =
                                      !_model.passwordVisibility2,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  _model.passwordVisibility2
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Color(0xFF57636C),
                                  size: 24,
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF101213),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: ElevatedButton(
                          onPressed: () async {
                            //validate for Register and log in
                            await logIn();
                          },
                          style: ButtonStyle(
                            fixedSize:
                                MaterialStateProperty.all(const Size(230, 50)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFF2C6BFF)),
                            textStyle: MaterialStateProperty.all<TextStyle>(
                                const TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )),
                            elevation: MaterialStateProperty.all<double>(3),
                            side: MaterialStateProperty.all<BorderSide>(
                                const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            )),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40))),
                          ),
                          child: Text('Sign In'),
                        ),
                      ),
                      Center(
                          child: Text(
                        errorText2,
                        style: TextStyle(color: Colors.red),
                      )),
                    ],
                  ),
                ),
                const Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 24),
                    child: Text(
                      'Or sign in as',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFF57636C),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 0,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.center,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: ElevatedButton(
                          onPressed: () async {
                            await anonymousSignIn();
                          },
                          style: ButtonStyle(
                            fixedSize:
                                MaterialStateProperty.all(const Size(230, 50)),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xFF101213)),
                            textStyle: MaterialStateProperty.all<TextStyle>(
                                const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            )),
                            elevation: MaterialStateProperty.all<double>(1),
                            side: MaterialStateProperty.all<BorderSide>(
                                const BorderSide(
                              color: Color(0XFFE0E3E7),
                              width: 2,
                            )),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40))),
                          ),
                          child: const Text('Guest'),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: TextButton(
                      onPressed: () async {},
                      style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(const Size(230, 50)),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF101213)),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                            const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        )),
                        side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(
                          color: Colors.transparent,
                          width: 2,
                        )),
                      ),
                      child: const Text('Forgot Password?'),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  //backend integration logics
  //Sign up logic
  Future<void> signUp() async {
    if (_formKey1.currentState!.validate()) {
      try {
        print(userinputs);

        //create user with firebaseauth
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: userinputs['email']!,
          password: userinputs['password']!,
        );

        //create record of user in firestore, for profile upon success account creation
        String name = userinputs['email']!.split('@').first;
        final FirebaseFirestore firestore = FirebaseFirestore.instance;
        await firestore.collection('Users').doc(userCredential.user?.uid).set({
          'uid': userCredential.user?.uid,
          'name': name, // Assuming 'name' is a key in the userinputs map
          'email': userinputs['email'],
          'phoneNum': '',
        });

        if (context.mounted) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return const LoadingScreen();
          }));
        }

        // User account has been created successfully
        print('User registered with email: ${userCredential.user?.email}');
      } catch (e) {
        if (e is FirebaseAuthException) {
          if (e.code == 'email-already-in-use') {
            // Handle the case where the email is already in use
            setState(() {
              errorText1 = 'The email is already in use.';
            });
            // You can display an error message to the user or take other appropriate actions.
          } else if (e.code == 'network-request-failed') {
            setState(() {
              errorText1 = "No internet access";
            });
          } else {
            // Handle other FirebaseAuthException error codes
            print('Error during registration: ${e.code}');
          }
        } else {
          // Handle non-FirebaseAuthException errors
          print('Error during registration: $e');
        }
      }
    } else {
      setState(() {
        errorText1 = '';
        errorText2 = '';
      });
    }
  }

  //Log In logic
  Future<void> logIn() async {
    if (_formKey2.currentState!.validate()) {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: userinputs['email']!,
          password: userinputs['password']!,
        );
        //TODO : attempt to FETCH from firestore and set the profile information in flutter
        if (context.mounted) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return const LoadingScreen();
          }));
        }
        // User account has been created successfully
        print('User log in with email: ${userCredential.user?.email}');
      } catch (e) {
        // Handle login errors
        if (e is FirebaseAuthException) {
          if (e.code == 'user-not-found') {
            setState(() {
              errorText2 = 'The user email is not found';
            });
            print('User not found. Please register.');
          } else if (e.code == 'wrong-password') {
            setState(() {
              errorText2 = 'Incorrect password';
            });
            print('Incorrect password. Please try again.');
          } else if (e.code == 'network-request-failed') {
            setState(() {
              errorText2 = "No internet access";
            });
          } else {
            setState(() {
              errorText2 = 'Invalid credentials';
            });

            print('Error during login: ${e.code}');
          }
        }
      }
    }
  }

  //anonymousSignIn
  Future<void> anonymousSignIn() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      String userUID = userCredential.user!.uid;
      String name = 'Guest';
      String email = '';

      //create record of user in firestore, for profile upon success account creation
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore.collection('Users').doc(userUID).set({
        'uid': userUID,
        'name': name,
        'email': email,
      });

      print("Signed in with temporary account.");
      if (context.mounted) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return LoadingScreen();
        }));
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        case "network-request-failed":
          setState(() {
            errorText1 = "No internet access";
            errorText2 = "No internet access";
          });
        default:
          print("${e.code} Unknown error.");
      }
    }
  }
}
