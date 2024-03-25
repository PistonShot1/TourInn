import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

// Matterport urls :
// {rooms: url1, gym : url2}
// gym and rooms defined so far, rooms is the only required , others are optional, hence careful when queried in app such that no null check
class MapLocation {
  GeoPoint? geoPoint;
  String? name;
  String? refUrl;
  String? imgUrl;
  double? price;
  double? rating;
  List<dynamic>? imgOptions;
  Map<String, dynamic>? matterportUrls;
  dynamic propertyType;
  Map<String, dynamic>? modelViewer;
  MapLocation(
      {this.geoPoint,
      this.name,
      this.refUrl,
      this.imgUrl,
      this.price,
      this.rating,
      this.matterportUrls,
      this.imgOptions,
      this.propertyType,
      this.modelViewer});

  factory MapLocation.fromMap(Map<String, dynamic> data) {
    final geoPoint = data['mapLocation'] as GeoPoint;
    final name = data['name'] as String;
    final refUrl = data['refUrl'] as String;
    final imgUrl = data['imgUrl'] as String;
    final price = double.parse(data['price'].toString());
    final rating = double.parse(data['rating'].toString());
    final matterportUrls = data['matterportUrls'] as Map<String, dynamic>;
    final imgOptions = data['imgOptions'] as List<dynamic>?;
    final propertyType = data['propertyType'] as dynamic;
    final modelViewer = data['modelViewer'] as Map<String, dynamic>?;
    return MapLocation(
        geoPoint: geoPoint,
        name: name,
        refUrl: refUrl,
        imgUrl: imgUrl,
        price: price,
        rating: rating,
        matterportUrls: matterportUrls,
        imgOptions: imgOptions,
        propertyType: propertyType,
        modelViewer: modelViewer);
  }

  Map<String, dynamic> toMap() {
    return {
      'mapLocation': geoPoint,
      'name': name,
      'refUrl': refUrl,
      'imgUrl': imgUrl,
      'price': price,
      'rating': rating,
      'matterportUrls': matterportUrls,
      'imgOptions': imgOptions,
      'propertyType': propertyType,
      'modelViewer': modelViewer
    };
  }
}
