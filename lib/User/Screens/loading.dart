import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_inn_app/Provider/locationData.dart';
import 'package:tour_inn_app/Schemes/location.dart';
import 'package:tour_inn_app/Schemes/profile.dart';
import 'package:tour_inn_app/Theme/themeColor.dart';
import 'package:tour_inn_app/User/Screens/home.dart';
import 'package:tour_inn_app/User/_mainwidgetList/googleMapsWidget.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});
  static GoogleMapsWidget? mapsWidget;
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Map<String, dynamic> _data = {};
  Future<bool>? value;
  @override
  void initState() {
    // TODO: implement initState
    _loadData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Stack(children: [
        Positioned.fill(
            child: Container(
          color: Color(0XFFFF004AAD),
        )),
        Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/tourinn_192.png',
                  width: 144,
                  height: 144,
                ),
                const Text(
                  'Your Central Stay\nBooking with \nAR & VR',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      height: 1.2),
                )
              ],
            )),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.all(60.0),
            child: Text('Developed by ARchitects ©', style:TextStyle(
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        height: 1.2) ,),
          ),
        )
      ])),
    );
  }

  Future<void> _loadData(BuildContext context) async {
    await _fetchRegisteredLocations(context);
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      String uid = currentUser.uid;
      QuerySnapshot querySnapshot = await firestore
          .collection('Users')
          .where('uid', isEqualTo: uid)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        _data = querySnapshot.docs.first.data() as Map<String, dynamic>;
        print(_data);
        if (context.mounted) {
          Provider.of<ProfileInfo>(context, listen: false).updateData(_data);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (builder) {
            return HomePage();
          }));
        }
      }
    }
  }

  //called by _loadData
  Future<void> _fetchRegisteredLocations(BuildContext context) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    List<MapLocation> locations = [];

    QuerySnapshot querySnapshot =
        await firestore.collection('RegisteredLocations').get();

    if (querySnapshot.docs.isNotEmpty) {
      locations = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return MapLocation.fromMap(data);
      }).toList();
    }
    if (context.mounted) {
      Provider.of<RegisteredLocationData>(context, listen: false)
          .updateData(dataList: locations);
    }
  }
}
