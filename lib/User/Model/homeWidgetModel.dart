import 'package:flutter/material.dart';
import 'package:tour_inn_app/Schemes/location.dart';

class HomeModel {
  ///  State fields for stateful widgets in this page.
  HomeModel();
  final unfocusNode = FocusNode();
  // State field(s) for TextFieldSearch widget.
  FocusNode? textFieldSearchFocusNode;
  TextEditingController? textFieldSearchController;
  String? Function(BuildContext, String?)? textFieldSearchControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldSearchFocusNode?.dispose();
    textFieldSearchController?.dispose();
  }

  MapLocation topRated(List<MapLocation> locations) {
    MapLocation highestRated = MapLocation();
    double temp = 0;
    for (var element in locations) {
      if (element.rating! > temp) {
        temp = element.rating!;
        highestRated = element;
      }
    }
    return highestRated;
  }

  MapLocation bestOffers(List<MapLocation> locations) {
    MapLocation bestOffers = MapLocation();
    double temp = double.infinity;
    for (var element in locations) {
      if (element.price! < temp) {
        temp = element.price!;
        bestOffers = element;
      }
    }
    return bestOffers;
  }

  //TODO : logic
  MapLocation withAR(List<MapLocation> locations) {
    MapLocation withAR = MapLocation();
    double temp = 0;
    for (var element in locations) {
      if (element.matterportUrls!.isNotEmpty) {
        temp = element.rating!;
        withAR = element;
      }
    }
    return withAR;
  }

  List<MapLocation> withARList(List<MapLocation> locations) {
    List<MapLocation> locationslist = [];

    for (var element in locations) {
      if (element.matterportUrls!.isNotEmpty) {
        locationslist.add(element);
        print(element.name);
      }
    }
    return locationslist;
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
