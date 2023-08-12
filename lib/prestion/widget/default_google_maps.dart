
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DefaultGoogleMaps extends StatelessWidget {
  final CameraPosition  initialCameraPosition;
  final void Function(LatLng)? onTap;
  final bool buildingsEnabled=true;
  final bool mapToolbarEnabled=true;
  final bool rotateGesturesEnabled=true;
  final bool scrollGesturesEnabled = true;
  final bool myLocationEnabled = true;
  final  bool zoomControlsEnabled = true;
  final bool zoomGesturesEnabled = true;
 final bool liteModeEnabled = true;
 final bool tiltGesturesEnabled = true;
 final bool myLocationButtonEnabled = true;
 final bool indoorViewEnabled = true;
 final bool trafficEnabled = true;
 final TextDirection? layoutDirection;
 final EdgeInsets padding = EdgeInsets.zero;
 final Set<Marker> markers;
 final Set<Polygon> polygons;
 final Set<Polyline> polylines;
 final Set<Circle> circles;
 final void Function()? onCameraMoveStarted;
  const DefaultGoogleMaps({Key? key, required this.initialCameraPosition, this.onTap, this.layoutDirection, required this.markers, required this.polygons, required this.polylines, required this.circles, this.onCameraMoveStarted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition:initialCameraPosition,
      onTap: onTap,
      buildingsEnabled:buildingsEnabled ,
      mapToolbarEnabled:mapToolbarEnabled ,
        rotateGesturesEnabled:rotateGesturesEnabled,
      scrollGesturesEnabled: scrollGesturesEnabled,
      myLocationButtonEnabled: myLocationButtonEnabled,
      myLocationEnabled: myLocationEnabled,
      zoomControlsEnabled: zoomControlsEnabled,
      zoomGesturesEnabled: zoomGesturesEnabled,
      trafficEnabled: trafficEnabled,
      padding: padding,
      markers: markers,
      circles: circles,
      polygons: polygons,
      polylines: polylines,
      onCameraMoveStarted: onCameraMoveStarted,
      indoorViewEnabled: indoorViewEnabled,
      tiltGesturesEnabled: tiltGesturesEnabled,
      liteModeEnabled: liteModeEnabled,
      layoutDirection: layoutDirection,


    );
  }
}
