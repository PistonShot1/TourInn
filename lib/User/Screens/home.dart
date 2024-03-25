import 'package:flutter/material.dart';
import 'package:tour_inn_app/Schemes/location.dart';
import 'package:tour_inn_app/Theme/themeColor.dart';
import 'package:tour_inn_app/User/_mainwidgetList/homeWidget.dart';
import 'package:tour_inn_app/User/_mainwidgetList/profileWidget.dart';
import 'package:tour_inn_app/User/_mainwidgetList/googleMapsWidget.dart';
import 'package:tour_inn_app/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  static PageController pageController =
      PageController(initialPage: currentPageIndex);
  static int currentPageIndex = 0;
  static bool overlayValue = false;
  static MapLocation? searchedLocation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: ThemeProperty.main,
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(color: Color(0XFF004AAD)),
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: _mainwidgetList(),
          onPageChanged: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          },
          indicatorColor: null,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.map_outlined),
              label: 'Explore',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.person,
                color: Colors.blue,
              ),
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _mainwidgetList() {
    return <Widget>[
      SingleChildScrollView(
          child: HomeWidget(
        key: homeWidgetKey,
      )),
      GoogleMapsWidget(
        showOverlay: overlayValue,
        searchedLocation: searchedLocation,
      ),
      SingleChildScrollView(
          child: ProfileWidget(
        key: profileWidgetKey,
      ))
    ];
  }
}
