import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tour_inn_app/Owner/captured.dart';
import 'package:tour_inn_app/Owner/upload.dart';
import 'package:tour_inn_app/Provider/locationData.dart';
import 'package:tour_inn_app/Schemes/profile.dart';
import 'package:tour_inn_app/Theme/themeColor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tour_inn_app/User/Screens/boarding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tour_inn_app/User/Screens/home.dart';
import 'package:tour_inn_app/User/Screens/loading.dart';
import 'package:tour_inn_app/User/Screens/login.dart';
import 'package:tour_inn_app/User/_mainwidgetList/homeWidget.dart';
import 'package:tour_inn_app/User/_mainwidgetList/profileWidget.dart';
import 'package:tour_inn_app/User/_mainwidgetList/googleMapsWidget.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

final GlobalKey<HomeWidgetState> homeWidgetKey = GlobalKey<HomeWidgetState>();
final GlobalKey<GoogleMapsWidgetState> googleMapsWidgetKey =
    GlobalKey<GoogleMapsWidgetState>();
final GlobalKey<ProfileWidgetState> profileWidgetKey =
    GlobalKey<ProfileWidgetState>();
// late List<CameraDescription> _cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Handling permissions for app
  Map<Permission, PermissionStatus> statuses = await [
    Permission.location,
    Permission.storage,
    Permission.camera,
  ].request();
  // Ensure that the status bar color is set to transparent
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  // Lock the device orientation to portraitUp
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Obtain shared preferences and check if it is their state
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final int pageIndex = prefs.getInt('pageIndex') ?? 0;

  // _cameras = await availableCameras();
  runApp(MyApp(
    pageIndex: pageIndex,
  ));
}

class MyApp extends StatefulWidget {
  final int pageIndex;
  const MyApp({super.key, required this.pageIndex});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProfileInfo()),
        ChangeNotifierProvider(create: (context) => RegisteredLocationData())
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color:Color(0XFF004AAD)),
          primaryColor: ThemeProperty.main,
          fontFamily: 'Poppins',
        ),
        home: (FirebaseAuth.instance.currentUser != null)
            ? const LoadingScreen()
            : routePage(widget.pageIndex),
      ),
    );
  }

  Widget routePage(int pageIndex) {
    if (pageIndex == 0) {
      return BoardingPages();
    } else {
      return Login();
    }
  }

  Future<void> fetchStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  }
}




// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
  

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   // late CameraController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold( 
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             // Container(
//             //   width: 250,
//             //   height: 300,
//             //   child: UploadContainer(cameras: _cameras),
//             // ),
//             // Text('${UploadContainer.captures}')
//           ],
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {
//       //     Navigator.push(
//       //       context,
//       //       MaterialPageRoute(
//       //         builder: (context) => CapturedData(
//       //             filePath: UploadContainer.imagePath ?? 'No image to display'),
//       //       ),
//       //     );
//       //   },
//       // ),
//     );
//   }
// }
