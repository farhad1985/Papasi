import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  final ValueChanged<GoogleMapController> onMapCreated;
  final Set<Marker> markers;

  const MapView({
    Key key,
    this.onMapCreated,
    this.markers,
  }) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      onMapCreated: widget.onMapCreated,
      myLocationButtonEnabled: false,
      markers: widget.markers,
      initialCameraPosition: CameraPosition(
        target: LatLng(37.43296265331129, -122.08832357078792),
        zoom: 17,
      ),
    );
  }
}
