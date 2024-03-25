import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_inn_app/Provider/locationData.dart';
import 'package:tour_inn_app/Schemes/location.dart';
import 'package:tour_inn_app/Schemes/profile.dart';
import 'package:tour_inn_app/Theme/themeColor.dart';
import 'package:tour_inn_app/User/Model/homeWidgetModel.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:tour_inn_app/User/Screens/FilterMenu.dart';
import 'package:tour_inn_app/User/Screens/home.dart';
import 'package:tour_inn_app/User/Screens/ownerRegistration.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => HomeWidgetState();
}

class HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;
  final SuggestionsBoxController _suggestionsBoxController =
      SuggestionsBoxController();
  int selectedFilterIndex = 3; // Initialize with the default selected index
  // late final ProfileInfo profileInfo;
  late bool isFiltered;
  List<MapLocation> filteredList = [];
  List<MapLocation> defaultfilters = []; // this is for the ellipses filter
  @override
  void initState() {
    _model = HomeModel();
    _model.textFieldSearchController ??= TextEditingController();
    _model.textFieldSearchFocusNode ??= FocusNode();
    // _model.textFieldSearchController!.addListener(() {});
    // profileInfo = Provider.of<ProfileInfo>(context);
    isFiltered = false;
    RegisteredLocationData locationslist =
        Provider.of<RegisteredLocationData>(context, listen: false);
    defaultfilters = locationslist.locations;
    super.initState();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<MapLocation> locations =
        Provider.of<RegisteredLocationData>(context).locations;
    Iterable<String> locationNames =
        locations.map((location) => location.name!).toList();
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12, 16, 0, 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: IconButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))))),
                      icon: const Icon(
                        Icons.add_home_work,
                        color: Color(0xFF3E70DA),
                        size: 28,
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const OwnerRegistration();
                        }));
                      },
                    ),
                  ),
                ],
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                  child: Text(
                    'Are you an owner? \nUpload your property HERE !',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF616161),
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: IconButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(30))))),
                        icon: const Icon(
                          Icons.notifications_active,
                          color: Color(0xFF2C7EFF),
                          size: 28,
                        ),
                        onPressed: () async {
                          //TODO: add navigation
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Consumer<ProfileInfo>(
                    builder: (BuildContext context, ProfileInfo value,
                        Widget? child) {
                      return Text(
                        'Hey ${value.name!},',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: ThemeProperty.primaryBackground,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    },
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Let\'s find your favorite stay',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: ThemeProperty.accent1,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Container(
                      width: 100,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x33000000),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TypeAheadField<String>(
                                suggestionsBoxController:
                                    _suggestionsBoxController,
                                suggestionsBoxDecoration:
                                    const SuggestionsBoxDecoration(
                                        constraints:
                                            BoxConstraints(maxHeight: 200),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(15),
                                                bottomRight:
                                                    Radius.circular(15)))),
                                textFieldConfiguration: TextFieldConfiguration(
                                  controller: _model.textFieldSearchController,
                                  decoration: const InputDecoration(
                                    hintText: 'Search here ...',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0x00000000), width: 1),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0x00000000), width: 1),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                suggestionsCallback: (pattern) {
                                  final suggestions = locationNames;

                                  // Filter the suggestions based on the input pattern
                                  final filteredSuggestions = suggestions
                                      .where((suggestion) => suggestion
                                          .toLowerCase()
                                          .contains(pattern.toLowerCase()))
                                      .toList();

                                  return filteredSuggestions;
                                },
                                itemBuilder: (context, suggestion) {
                                  return ListTile(
                                    title: Text(suggestion),
                                  );
                                },
                                onSuggestionSelected: (suggestion) async {
                                  // Handle the selected suggestion (e.g., fill the TextFormField with the selected value).
                                  _model.textFieldSearchController!.text =
                                      suggestion;
                                  print(suggestion);
                                  //switch to the ExploreWidget
                                  MapLocation? temp;

                                  for (var location in locations) {
                                    if (location.name ==
                                        suggestion.toString()) {
                                      temp = location;
                                    }
                                  }
                                  //Navigate to next page view using page controller
                                  setState(() {
                                    HomePageState.searchedLocation = null;
                                  });
                                  setState(() {
                                    HomePageState.searchedLocation = temp;
                                    HomePageState.currentPageIndex = 1;
                                    HomePageState.overlayValue = true;
                                    HomePageState.pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.ease);
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: IconButton(
                                style: ButtonStyle(
                                    side: MaterialStateProperty.all<BorderSide>(
                                        const BorderSide(
                                            color: Colors.transparent,
                                            width: 1))),
                                icon: Icon(
                                  Icons.search,
                                  color: ThemeProperty.primaryBackground,
                                  size: 22,
                                ),
                                onPressed: () {
                                  _suggestionsBoxController.open();
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
        Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 42, 0, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        filterList(
                            option: 'All',
                            index: 3,
                            selectedColor: (selectedFilterIndex == 3)
                                ? const Color(0xFFFF3E70DA)
                                : null),
                        filterList(
                            option: 'With AR',
                            index: 0,
                            selectedColor: (selectedFilterIndex == 0)
                                ? const Color(0xFFFF3E70DA)
                                : null),
                        filterList(
                            option: 'Best Offers',
                            index: 1,
                            selectedColor: (selectedFilterIndex == 1)
                                ? const Color(0xFFFF3E70DA)
                                : null),
                        filterList(
                            option: 'Populars',
                            index: 2,
                            selectedColor: (selectedFilterIndex == 2)
                                ? const Color(0xFFFF3E70DA)
                                : null),
                      ],
                    ),
                  ),
                ],
              ),
            )),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        flex: 7,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              selectedFilter(selectedFilterIndex),
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: ThemeProperty.lineColor,
                                fontSize: 15,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 4, 10, 0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.85,
                                child: Text(
                                  filterResult(optionNum: selectedFilterIndex)
                                      .name!,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: ThemeProperty.primaryBackground,
                                    fontSize: 21,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: IconButton(
                            onPressed: () async {
                              Map<String, dynamic>? returnedValues =
                                  await Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return const FilterMenu();
                                  },
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    const begin = Offset(0.0, 1.0);
                                    const end = Offset.zero;
                                    const curve = Curves.easeInOut;

                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));

                                    var offsetAnimation =
                                        animation.drive(tween);

                                    return SlideTransition(
                                      position: offsetAnimation,
                                      child: child,
                                    );
                                  },
                                ),
                              );

// Check if returnedValues is not null and handle the data
                              if (returnedValues != null) {
                                // Access the returned values using the keys
                                String? maxPrice = returnedValues['maxPrice'];
                                String? minPrice = returnedValues['minPrice'];
                                maxPrice = maxPrice!.split(' ')[1];
                                minPrice = minPrice!.split(' ')[1];
                                bool? propertyType1 =
                                    returnedValues['propertyType1'];
                                bool? propertyType2 =
                                    returnedValues['propertyType2'];
                                bool? propertyType3 =
                                    returnedValues['propertyType3'];
                                print('Minprice is $minPrice');
                                setState(() {
                                  refreshList(minPrice, maxPrice, propertyType1,
                                      propertyType2, propertyType3);
                                });
                              }
                            },
                            icon: const Icon(
                              Icons.filter_alt_outlined,
                              size: 35,
                              color: Colors.grey,
                            )),
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: Container(
                  width: double.infinity,
                  height: 240,
                  decoration: const BoxDecoration(),
                  child: buildList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget filterList(
      {required String option, required int index, Color? selectedColor}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilterIndex = index;
        });
        print('this is the index${selectedFilterIndex}');
        // You can do something with the selected filter, like filtering data.

        print('Selected filter: $index');
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 16),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: selectedColor ?? ThemeProperty.primaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Color(0x2596C3E2),
                offset: Offset(0, 6),
              )
            ],
            borderRadius: BorderRadius.circular(50),
          ),
          alignment: const AlignmentDirectional(0.00, 0.00),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Text(
              option,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
        ),
      ),
    );
  }

  MapLocation filterResult({String? option, int? optionNum}) {
    List<MapLocation> locations =
        Provider.of<RegisteredLocationData>(context).locations;
    MapLocation result = MapLocation();
    if (option != null) {
      setState(() {
        isFiltered = false;
      });
      switch (option) {
        case 'With AR':
          result = _model.withAR(locations);
          setState(() {
            defaultfilters = _model.withARList(locations);
            print(defaultfilters);
          });
          break;
        case 'Best Offers':
          result = _model.bestOffers(locations);
          defaultfilters = locations;
          break;
        case 'Populars':
          result = _model.topRated(locations);
          defaultfilters = locations;
          break;
        case 'All':
          result = _model.topRated(locations);
          defaultfilters = locations;
          break;
        default:
          result = _model.topRated(locations);
          defaultfilters = locations;
          break;
      }
    } else if (optionNum != null) {
      isFiltered = false;
      switch (optionNum) {
        case 0:
          result = _model.withAR(locations);
          setState(() {
            defaultfilters = _model.withARList(locations);
            print(defaultfilters);
          });
          break;
        case 1:
          result = _model.bestOffers(locations);
          defaultfilters = locations;
          break;
        case 2:
          result = _model.topRated(locations);
          defaultfilters = locations;
          break;
        case 3:
          result = _model.topRated(locations);
          defaultfilters = locations;
          break;
        default:
          result = _model.topRated(locations);
          defaultfilters = locations;
          break;
      }
    }
    return result;
  }

  String selectedFilter(int optionNum) {
    switch (optionNum) {
      case 0:
        return 'With AR';
      case 1:
        return 'Top Offers';
      case 2:
        return 'Populars';
      case 3:
        return 'All';
      default:
        return 'Top Rates';
    }
  }

  void refreshList(String? minprice, String? maxprice, bool? propertyType1,
      bool? propertyType2, bool? propertyType3) {
    List<MapLocation> locations = [];
    RegisteredLocationData value =
        Provider.of<RegisteredLocationData>(context, listen: false);

    for (MapLocation element in value.locations) {
      bool addToFiltered = true;

      // Check min and max price
      if (minprice != null && maxprice != null) {
        double price = element.price ?? 0.0;
        if (price < double.parse(minprice) || price > double.parse(maxprice)) {
          addToFiltered = false;
        }
      }

      // Check property type
      if (addToFiltered && element.propertyType != null) {
        switch (element.propertyType) {
          case 'House':
            addToFiltered = propertyType1 ?? false;
            break;
          case 'Apartment':
            addToFiltered = propertyType2 ?? false;
            break;
          case 'Hotel':
            addToFiltered = propertyType3 ?? false;
            break;
          default:
            addToFiltered = false;
        }
      }

      // If all conditions are met, add to the filtered list
      if (addToFiltered) {
        locations.add(element);
      }
    }

    setState(() {
      isFiltered = true;
      filteredList = locations; // Update the filteredList
    });
  }

  Widget buildList() {
    return isFiltered ? buildFilteredList() : buildDefaultList();
  }

  Widget buildFilteredList() {
    // Build your filtered list widget here
    return ListView.builder(
      key: UniqueKey(),
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      itemCount: filteredList.length,
      itemBuilder: (BuildContext context, int index) {
        return buildListItem(filteredList[index]);
      },
    );
  }

  Widget buildDefaultList() {
    // Build your default list widget here
    return ListView.builder(
      key: UniqueKey(),
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      itemCount: defaultfilters.length,
      itemBuilder: (BuildContext context, int index) {
        return buildListItem(defaultfilters[index]);
      },
    );
  }

  Widget buildListItem(MapLocation location) {
    // Build the individual item widget here
    return Padding(
      // Use a unique key for each item
      padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
      child: GestureDetector(
        //Navigation to map on image select
        onTap: () {
          MapLocation temp = location;
          setState(() {
            HomePageState.searchedLocation = temp;
            HomePageState.currentPageIndex = 1;
            HomePageState.overlayValue = true;
            HomePageState.pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          });
        },
        child: Container(
          width: 240,
          height: 240,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: ClipRRect(
            borderRadius:
                BorderRadius.circular(25), // Match the container's borderRadius
            child: Image.network(
              '${location.imgUrl}',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
