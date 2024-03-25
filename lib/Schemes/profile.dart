import 'package:flutter/material.dart';
import 'package:tour_inn_app/Schemes/location.dart';

class ProfileInfo extends ChangeNotifier {
  String? uid;
  String? name;
  String? email;
  String? phoneNum;
  ProfileInfo({this.uid, this.name, this.email, this.phoneNum});

  Future<void> updateData(Map<String, dynamic> data) async {
    uid = data['uid'];
    name = data['name'];
    email = data['email'];
    phoneNum = data['phoneNum'];
    notifyListeners();
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phoneNum': phoneNum,
    };
  }
}
