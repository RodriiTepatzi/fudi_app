// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends StatefulWidget {
  MapController({Key? key}) : super(key: key);

  @override
  State<MapController> createState() => _MapControllerState();
}

class _MapControllerState extends State<MapController> {
  
  final CameraPosition _initialPosition = const CameraPosition(target: LatLng(26.8206, 30.8025), zoom: 11.0);
  final Completer<GoogleMapController> _mapController = Completer();
  void _onMapCreated(GoogleMapController controller) {
      _mapController.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Text(
            "Hola"
          ),
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: _initialPosition,
          ),
        ],
      )
    );
    /*return Scaffold(
      appBar: AppBar(
      title: Text('Maps in Flutter'),
      centerTitle: true,
    ),
    body: Stack(
      children: <Widget>[
        Container(child: 
        Text("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"),),
        /*GoogleMap(    
          onMapCreated: _onMapCreated,
          initialCameraPosition: _initialPosition,
        ),*/
      ],
    ));*/
  }
}