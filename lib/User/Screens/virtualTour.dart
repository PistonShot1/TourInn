import 'package:flutter/material.dart';
import 'package:tour_inn_app/Schemes/location.dart';

import 'package:webview_flutter/webview_flutter.dart';


class MatterPortWidget extends StatefulWidget {
  final MapLocation location;
  const MatterPortWidget({super.key, required this.location});

  @override
  State<MatterPortWidget> createState() => _MatterPortWidgetState();
}

class _MatterPortWidgetState extends State<MatterPortWidget> {
  late WebViewController? _controller;

  @override
  void initState() {
    final Map<String, dynamic>? matterportUrls = widget.location.matterportUrls;
    // final List<Map<String, dynamic>> listMatterportUrls =
    //     (matterportUrls != null)
    //         ? matterportUrls.entries
    //             .map((entry) => {entry.key: entry.value})
    //             .toList()
    //         : [];

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://my.matterport.com/')) {
              return NavigationDecision.navigate;
            }
            return NavigationDecision.prevent;
          },
        ),
      )
      ..loadRequest(Uri.parse(matterportUrls!['rooms']!));

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _controller?.clearCache();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? matterportUrls = widget.location.matterportUrls;
    List<Widget> widgetList = buttonList(matterportUrls!,
        (MediaQuery.of(context).size.height - kToolbarHeight) * 0.15);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: FutureBuilder(
              future: Future.delayed(const Duration(seconds: 2)),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return WebViewWidget(
                    controller: _controller!,
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                title: Text(
                  '${widget.location.name}',
                  textAlign: TextAlign.center,
                ),
              )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Colors.black,
                      offset: Offset(0, 2),
                    ),
                  ],
                  color: Colors.white,
                ),
                height: (MediaQuery.of(context).size.height - kToolbarHeight) *
                    0.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(
                                  top: (MediaQuery.of(context).size.height -
                                          kToolbarHeight) *
                                      0.0375,
                                  bottom: MediaQuery.of(context).size.height -
                                      kToolbarHeight) *
                              0.0375,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: widgetList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return widgetList[index];
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  List<Widget> buttonList(
      Map<String, dynamic> matterportUrls, double bottomContainerHeight) {
    List<Widget> buttonList = [];
    matterportUrls.forEach((key, value) {
      if (key == 'rooms') {
        buttonList.add(CustomButton(
          controller: _controller!,
          value: value,
          icon: const Icon(Icons.bed_outlined),
          title: 'Room',
          onSelect: () {},
        ));
      } else if (key == 'gym') {
        buttonList.add(CustomButton(
            value: value,
            icon: const Icon(Icons.sports_soccer),
            title: 'Gym',
            onSelect: () {},
            controller: _controller!));
      } else if (key == 'pool') {
        buttonList.add(CustomButton(
            value: value,
            icon: const Icon(Icons.pool),
            title: 'Pool',
            onSelect: () {},
            controller: _controller!));
      }
    });
    return buttonList;
  }
}

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.value,
    required this.icon,
    required this.title,
    required this.onSelect,
    required WebViewController controller,
  }) : _controller = controller;

  final WebViewController _controller;
  final String value;
  final Icon icon;
  final String title;
  final dynamic Function() onSelect;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextButton.icon(
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(150, 40)),
              side: MaterialStateProperty.all(const BorderSide(
                  style: BorderStyle.solid, color: Colors.black))),
          onPressed: () {
            widget._controller.loadRequest(Uri.parse(widget.value));
          },
          icon: widget.icon,
          label: Text(
            widget.title,
            style: const TextStyle(
                color: Color(0xFF3E70DA), fontWeight: FontWeight.w500),
          )),
    );
  }
}
