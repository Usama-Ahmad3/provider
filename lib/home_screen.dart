
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home_Screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => Home_ScreenState();
}
class Home_ScreenState extends State<Home_Screen>{
 final Completer<GoogleMapController> _completer = Completer();
 static final CameraPosition mapPosition = CameraPosition(target: LatLng(
     37.42296133588664, -122.065749655962),
 zoom: 13);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition:mapPosition,
        onMapCreated: (GoogleMapController controler){
          _completer.complete(controler);
        }),
    );
}
}