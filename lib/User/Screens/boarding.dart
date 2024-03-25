import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tour_inn_app/Theme/themeColor.dart';
import 'package:tour_inn_app/User/Screens/login.dart';

class BoardingPages extends StatelessWidget {
  const BoardingPages({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: 0);
    final pageview = PageView(
      controller: controller,
      children: [
        boardingContainer(
            context,
            <String>[
              'Find Your\nFavorite Place\nTo Stay',
              'Discover the World in Virtual Reality'
            ],
            Image.asset('assets/onboard1.png'),
            controller),
        boardingContainer(
            context,
            <String>[
              'Immerse Yourself\nin Every\nDimension',
              'Explore, Book, Experience'
            ],
            Image.asset('assets/onboard2.png'),
            controller),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRect(
                      child: OverflowBox(
                          maxHeight: MediaQuery.of(context).size.height * 1.1,
                          child: Container(
                            color: const Color(0XFF004AAD),
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/transparent-logo-192.png',
                          width: 144,
                          height: 144,
                        ),
                        Text(
                          'Your Central Stay\nBooking with \nAR & VR',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: ThemeProperty.xlarge,
                              color: Colors.white,
                              height: 1.2),
                        ),
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                final SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.setInt('pageIndex', 1);
                                if (context.mounted) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Login()));
                                }
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                )),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        ThemeProperty.button1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Login',
                                  style:
                                      TextStyle(fontSize: ThemeProperty.large),
                                ),
                              ),
                            ),
                          )),
                        ],
                      )),
                ],
              ),
            ))
      ],
    );
    return pageview;
  }

  Scaffold boardingContainer(BuildContext context,
      List<String> descriptionTexts, Image image, PageController controller) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRect(
                child: OverflowBox(
                  maxHeight: MediaQuery.of(context).size.height * 1.1,
                  child: image,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.05,
                    MediaQuery.of(context).size.height * 0.1,
                    0,
                    0),
                child: Image.asset(
                  'assets/transparent-logo-192.png',
                  width: 78,
                  height: 78,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.4,
              left: MediaQuery.of(context).size.width * 0.1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    descriptionTexts[0],
                    style: TextStyle(
                        fontSize: ThemeProperty.xlarge,
                        color: Colors.white,
                        height: 1.2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      descriptionTexts[1],
                      style: TextStyle(
                          fontSize: ThemeProperty.medium,
                          color: const Color(0XFFC7C7C7)),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 40, 20.0),
                child: InkWell(
                  onTap: () {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease);
                  },
                  child: const Icon(
                    Icons.arrow_right_alt_rounded,
                    size: 45,
                    color: Color(0xFFC7C7C7),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
