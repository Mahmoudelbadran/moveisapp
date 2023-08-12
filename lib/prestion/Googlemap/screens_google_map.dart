import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/Contast/constant.dart';

class ScreensGoogleMap extends StatefulWidget {
  const ScreensGoogleMap({Key? key}) : super(key: key);

  @override
  State<ScreensGoogleMap> createState() => _ScreensGoogleMapState();
}

LatLng? PickerLoaction;

class _ScreensGoogleMapState extends State<ScreensGoogleMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          mapType: MapType.terrain,
          initialCameraPosition: initialCameraPosition,
          onTap: (Location) {
            setState(() {
              PickerLoaction = Location;
            });
          },
          markers: PickerLoaction != null
              ? {
            Marker(
              markerId: const MarkerId('Picker Loaction'),
              position: PickerLoaction!,
            ),
          }
              : {
            Marker(
              markerId: const MarkerId('intial Loaction'),
              position: initialCameraPosition.target,
            ),
          },
        ),
      ),
    );
  }
}