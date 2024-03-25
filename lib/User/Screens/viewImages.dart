import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tour_inn_app/Schemes/location.dart';
import 'package:tour_inn_app/Theme/themeColor.dart';
import 'package:url_launcher/url_launcher.dart';

class View360NImages extends StatefulWidget {
  final MapLocation location;
  const View360NImages({super.key, required this.location});

  @override
  State<View360NImages> createState() => _View360NImagesState();
}

class _View360NImagesState extends State<View360NImages> {
  late List<dynamic>? imgOptions;
  late List<Widget>? imgWidgets;
  ScrollController controller = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imgOptions = [];
    imgOptions = widget.location.imgOptions;
    buildImageItems(imgOptions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          CarouselSlider(
              items: imgWidgets,
              options: CarouselOptions(
                height: 400,
                // aspectRatio: ,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 600),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              )),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 10, 0),
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Color(0xFF6593C9),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 10,
                                      color: Color(0x2596C3E2),
                                      offset: Offset(0, 6),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                alignment:
                                    const AlignmentDirectional(0.00, 0.00),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 0),
                                  child: Text(
                                    '360 View',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: ThemeProperty.primaryText,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Text(
                          '${widget.location.name}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: ThemeProperty.secondaryBackground,
                            fontSize: 21,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 4, 0, 0),
                            child: RatingBar.builder(
                              ignoreGestures: true,
                              onRatingUpdate: (newValue) {},
                              itemBuilder: (context, index) => const Icon(
                                Icons.star_rounded,
                                color: Colors.amber,
                              ),
                              direction: Axis.horizontal,
                              initialRating:
                                  widget.location.rating ?? 0, //TODO : rating
                              unratedColor: ThemeProperty.accent3,
                              itemCount: 5,
                              itemSize: 32,
                              glowColor: ThemeProperty.primaryBackground,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 4, 0, 0),
                            child: Text(
                              (widget.location.rating != 0)
                                  ? '${widget.location.rating}'
                                  : 'N/A',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: ThemeProperty.primaryBackground,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: Scrollbar(
                      thumbVisibility: true,
                      controller: controller,
                      child: buildListView(widget.location)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListView(MapLocation location) {
    List<Widget> widgetList = [];

    if (location.matterportUrls!.isNotEmpty) {
      location.matterportUrls!.forEach((key, value) {
        widgetList.add(buttonList(context, key, value));
      });
    } else {
      widgetList.add(GestureDetector(
        onTap: () async {},
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '360 \nNot Available',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: ThemeProperty.primaryBackground,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.view_in_ar,
                      color: ThemeProperty.primaryBackground,
                      size: 48,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ));
    }
    ListView widgetListView = ListView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      children: widgetList,
    );
    return widgetListView;
  }

  GestureDetector buttonList(BuildContext context, String key, String url) {
    IconData icon = Icons.view_in_ar;
    switch (key) {
      case 'rooms':
        icon = Icons.bed_outlined;
        break;
      case 'gym':
        icon = Icons.sports_soccer;
        break;
      case 'pool':
        icon = Icons.pool_outlined;
    }
    return GestureDetector(
      onTap: () async {
        //TODO : next page to virtual touring
        if (!await launchUrl(Uri.parse(url))) {
          throw Exception('Could not launch $url');
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Color(0xFF2C7EFF),
              width: 2,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${key.substring(0, 1).toUpperCase()}${key.substring(1)}',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: ThemeProperty.primaryBackground,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: ThemeProperty.primaryBackground,
                    size: 48,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void buildImageItems(List<dynamic>? imgOptions) {
    List<Widget>? imgItems = [];
    if (imgOptions != null) {
      for (int i = 0; i < imgOptions!.length; i++) {
        imgItems.add(
          Image.network(
            imgOptions[i],
            fit: BoxFit.cover,
          ),
        );
      }
    }
    imgWidgets = imgItems;
  }
}
