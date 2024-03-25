import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tour_inn_app/Provider/locationData.dart';
import 'package:tour_inn_app/Schemes/location.dart';
import 'package:location/location.dart';
import 'package:tour_inn_app/Theme/themeColor.dart';
import 'package:tour_inn_app/User/Model/exploreWidgetModel.dart';
import 'package:tour_inn_app/User/Screens/roomDesc.dart';
import 'package:location/location.dart';

class GoogleMapsWidget extends StatefulWidget {
  bool showOverlay;
  MapLocation? searchedLocation;
  Function()? onChangeLocation;
  GoogleMapsWidget(
      {Key? key,
      required this.showOverlay,
      this.searchedLocation,
      this.onChangeLocation})
      : super(key: key);

  @override
  GoogleMapsWidgetState createState() => GoogleMapsWidgetState();
}

class GoogleMapsWidgetState extends State<GoogleMapsWidget>
    with AutomaticKeepAliveClientMixin<GoogleMapsWidget> {
  late GoogleMapController mapController;
  // Store the current location here
  LatLng defaultLocation = LatLng(3.0027769797223023, 101.73366968200371);
  double zoomLevel = 15;
  Set<Marker> markerLocations = {};
  Future<bool>? _data;
  BitmapDescriptor? _markerIcon;
  List<MapLocation>? locations;
  MapLocation? _selectedLocation;

  Location location = new Location();

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  late ExploreModel _model;
  @override
  void initState() {
    _model = ExploreModel();
    _data = _loadData();
    super.initState();
  }

  Future<bool> _loadData() async {
    // await _getLocation();
    _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 0.5, size: Size(20, 20)),
        'assets/mapMarker.png');
    markerLocations = await fetchRegisteredLocations();
    return true;
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    locations = Provider.of<RegisteredLocationData>(context).locations;
    //initialize the selectedLocation to searchedLocation when search prompted
    if (widget.searchedLocation != null) {
      _selectedLocation = widget.searchedLocation;
    }
    return Stack(
      children: [
        tourInnMapWidget(),
        Positioned(
          bottom: 0,
          child: widget.showOverlay
              ? OverlayLocationContainer(
                  context: context, location: _selectedLocation)
              : Container(),
        ),
      ],
    );
  }

  Widget tourInnMapWidget() {
    return FutureBuilder(
      future: _data,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GoogleMap(
            onMapCreated: (controller) {
              _onMapCreated(controller);
              // Check if _selectedLocation is not null after mapController is initialized and then animate camera
              if (_selectedLocation != null) {
                mapController.animateCamera(CameraUpdate.newLatLngZoom(
                  LatLng(
                    _selectedLocation!.geoPoint!.latitude,
                    _selectedLocation!.geoPoint!.longitude,
                  ),
                  18,
                ));
              }
            },
            zoomGesturesEnabled: true,
            padding: EdgeInsets.only(
              bottom: ((MediaQuery.of(context).size.height -
                      kToolbarHeight -
                      kToolbarHeight) *
                  0.6),
            ),
            initialCameraPosition: CameraPosition(
              target:
                  defaultLocation, // Default location if current location is not available
              zoom: zoomLevel,
            ),
            markers: markerLocations,
          );
        } else {
          return GoogleMap(
            onMapCreated: (controller) {
              _onMapCreated(controller);
              // Check if _selectedLocation is not null after mapController is initialized and then animate camera
              if (_selectedLocation != null) {
                mapController.animateCamera(CameraUpdate.newLatLngZoom(
                  LatLng(
                    _selectedLocation!.geoPoint!.latitude,
                    _selectedLocation!.geoPoint!.longitude,
                  ),
                  18,
                ));
              }
            },
            initialCameraPosition: CameraPosition(
              target:
                  defaultLocation, // Default location if current location is not available
              zoom: zoomLevel,
            ),
            markers: markerLocations,
          );
        }
      },
    );
  }

  // ignore: non_constant_identifier_names
  Widget OverlayLocationContainer(
      {required BuildContext context, MapLocation? location}) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.all(10),
          child: Material(
            color: Colors.transparent,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              constraints: BoxConstraints(
                  maxHeight: 250,
                  maxWidth: MediaQuery.of(context).size.width * 0.95),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Align(
                      alignment: AlignmentDirectional(-1.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                        child: Text(
                          'Location',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xFF101213),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.00, 0.00),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 0, 8),
                              child: Text(
                                (location != null)
                                    ? '${location.name}'
                                    : 'Unkown Location', //TODO : hotel name
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF57636C),
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                child: RatingBar.builder(
                                  ignoreGestures: true,
                                  onRatingUpdate: (newValue) {},
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star_rounded,
                                    color: (location.rating != null)
                                        ? Colors.amber
                                        : ThemeProperty.accent1,
                                  ),
                                  direction: Axis.horizontal,
                                  initialRating:
                                      location!.rating ?? 0, //TODO : rating
                                  unratedColor: ThemeProperty.accent3,
                                  itemCount: 5,
                                  itemSize: 32,
                                  glowColor: ThemeProperty.primaryBackground,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                child: Text(
                                  (location.rating != 0)
                                      ? '${location.rating}'
                                      : 'N/A',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: ThemeProperty.primaryBackground,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(8, 4, 16, 0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                //TODO : navigation
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 4, 8),
                                    child: Text(
                                      'RM ${location!.price}', //TODO : price
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF101213),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                            child: ElevatedButton(
                              onPressed: () async {
                                //TODO : navigation
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return roomDescription(
                                    location: location!,
                                  );
                                }));
                              },
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all<Size>(
                                    const Size(double.infinity, 48)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xFF2C7EFF)),
                                side: MaterialStateProperty.all<BorderSide>(
                                    BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                )),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                              ),
                              child: Text(
                                'Confirm',
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<Set<Marker>> fetchRegisteredLocations() async {
    // Convert List<MapLocation> to Set<Marker>
    Set<Marker> markers = locations!.map((location) {
      return Marker(
        onTap: () {
          setState(() {
            //reset and overwrite the values of searched selected
            widget.showOverlay = false;
            widget.searchedLocation = null;

            //set on select
            _selectedLocation = location;
            mapController.animateCamera(CameraUpdate.newLatLngZoom(
                LatLng(_selectedLocation!.geoPoint!.latitude,
                    _selectedLocation!.geoPoint!.longitude),
                18));
            widget.showOverlay = true;
          });
        },
        markerId: MarkerId(
            '${location.geoPoint!.latitude}${location.geoPoint!.longitude}'), // Replace with the appropriate identifier
        position:
            LatLng(location.geoPoint!.latitude, location.geoPoint!.longitude),
        icon: _markerIcon!,
        // You can add other properties like infoWindow, icon, etc., here
      );
    }).toSet();

    return markers;
  }

  void setCameraLocation() {}
  // Future<void> _getLocation() async {
  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }

  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }

  //   _locationData = await location.getLocation();
  //   setState(() {
  //     // Use the obtained location to set the initial camera position
  //     mapController.moveCamera(
  //       CameraUpdate.newLatLng(
  //           LatLng(_locationData!.latitude!, _locationData!.longitude!)),
  //     );
  //   });
  // }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}


  // // Initialize the location service
  // Future<bool> _initLocation() async {
  //   final status = await Permission.location.request();
  //   if (status.isGranted) {
  //     final location = Location();
  //     try {
  //       currentLocation = await location.getLocation();
  //     } on Exception catch (e) {
  //       print('Error: $e');
  //     }

  //     if (currentLocation != null) {
  //       setState(() {
  //         // Use the obtained location to set the initial camera position
  //         mapController.moveCamera(
  //           CameraUpdate.newLatLng(LatLng(
  //               currentLocation!.latitude!, currentLocation!.longitude!)),
  //         );
  //       });
  //     }
  //     return true;
  //   } else {
  //     // Handle the case where the user denied location permission
  //     // You can display a message or ask for permission again
  //     return false;
  //   }
  // }