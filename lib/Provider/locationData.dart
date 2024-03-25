import 'package:flutter/material.dart';
import 'package:tour_inn_app/Schemes/location.dart';

class RegisteredLocationData extends ChangeNotifier {
  List<MapLocation> locations = [];

  Future<void> updateData({List<MapLocation>? dataList}) async {
    if (dataList != null) {
      locations = dataList;
    }
    notifyListeners();
  }
}
