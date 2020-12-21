import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewWidget extends StatefulWidget {
  @override
  _MapViewWidgetState createState() => _MapViewWidgetState();
}

class _MapViewWidgetState extends State<MapViewWidget> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(49.55353982749565, 25.59468396631845);

  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId("Faine"),
      position: LatLng(49.55281579671433, 25.595416584411204),
      infoWindow: InfoWindow(
        title: 'Faine misto',
        snippet: 'Very cool place',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ),
    Marker(
      markerId: MarkerId("Theatre"),
      position: LatLng(49.55401130497367, 25.59470358905732),
      infoWindow: InfoWindow(
        title: 'Ternopil Academic Regional Ukrainian Drama Theater named after Taras Shevchenko',
        snippet: 'Very cool place',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ),
   };

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GoogleMap(
        mapType: MapType.normal,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 16.0,
        ),
      ),
    );
  }
}
