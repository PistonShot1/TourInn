import 'package:flutter/material.dart';
import 'package:tour_inn_app/Provider/locationData.dart';
import 'package:tour_inn_app/Schemes/location.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class ARView extends StatefulWidget {
  final MapLocation location;
  const ARView({Key? key, required this.location}) : super(key: key);

  @override
  State<ARView> createState() => _ARViewState();
}

class _ARViewState extends State<ARView> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();
  late UnityWidgetController _unityWidgetController;
  late final Map<String, dynamic>? matterportUrls;

  @override
  void initState() {
    matterportUrls = widget.location.matterportUrls;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    resetOnDispose();
    _unityWidgetController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Explore with AR'),
        toolbarHeight: 40,
      ),
      body: Stack(children: [
        UnityWidget(
          onUnityCreated: onUnityCreated,
          onUnityMessage: onUnityMessage,
          onUnitySceneLoaded: (message) {
            resetOnDispose();
          },
          useAndroidViewSurface: true,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(70, 0, 50, 0),
            child: Container(
              height: 80,
              width:
                  double.infinity, // Adjust the height according to your needs
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: buttonList(),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  void onUnityCreated(controller) {
    _unityWidgetController = controller;
    // sendMessageImageTarget();
    resetOnDispose();
  }

  void onUnityMessage(message) async {
    if (message.toString().compareTo("buildingRequested") == 0) {
      sendMessageImageTarget();
    } else if (message.toString().split('-').last.compareTo("book") == 0) {
      //this condition is when the book button on the realtor panel is pressed
      final Uri url = Uri.parse(widget.location.refUrl!);
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    } else {
      String virtualTourComponent = message.toString().split('-').last;
      final Uri url = Uri.parse(matterportUrls![virtualTourComponent]);
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }
    print(message);
  }

  void sendMessageImageTarget() {
    List<String> formatString = widget.location.name!.split(' ');
    String selectedUnit = formatString[0] + formatString[1];
    print("Selected Unit String : $selectedUnit");
    _unityWidgetController.postMessage(
        "ImageTarget", "OnUnityMessageReceived", selectedUnit);
  }

  void resetOnDispose() {
    _unityWidgetController.postMessage("ImageTarget", "ResetAll", "reset");
  }

  List<Widget> buttonList() {
    List<Widget> iconButtons = [];
    widget.location.matterportUrls!.forEach((key, value) {
      if (key == 'rooms') {
        iconButtons.add(
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue, // Set the background color here
              ),
              child: IconButton(
                onPressed: () async {
                  final Uri _url =
                      Uri.parse(widget.location.modelViewer?['rooms']);
                  if (!await launchUrl(_url)) {
                    throw Exception('Could not launch $_url');
                  }
                },
                icon: const Icon(Icons.bed_outlined,
                    size: 30, color: Colors.white),
              ),
            ),
          ),
        );
      } else if (key == 'gym') {
        iconButtons.add(
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue, // Set the background color here
              ),
              child: IconButton(
                onPressed: () async {
                  final Uri _url =
                      Uri.parse(widget.location.modelViewer?['gym']);
                  if (!await launchUrl(_url)) {
                    throw Exception('Could not launch $_url');
                  }
                },
                icon: const Icon(Icons.sports_soccer,
                    size: 30, color: Colors.white),
              ),
            ),
          ),
        );
      } else if (key == 'pool') {
        iconButtons.add(
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue, // Set the background color here
              ),
              child: IconButton(
                onPressed: () async {
                  final Uri _url =
                      Uri.parse(widget.location.modelViewer?['pool']);
                  if (!await launchUrl(_url)) {
                    throw Exception('Could not launch $_url');
                  }
                },
                icon: const Icon(Icons.pool, size: 30, color: Colors.white),
              ),
            ),
          ),
        );
      }
    });

    return iconButtons;
  }
}
