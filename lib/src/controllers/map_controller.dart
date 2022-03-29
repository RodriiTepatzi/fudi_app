import 'dart:async';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/views/widgets/back_button.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends StatefulWidget {
  MapController({Key? key}) : super(key: key);

  @override
  State<MapController> createState() => _MapControllerState();
}

class _MapControllerState extends State<MapController> {
  
  CameraPosition _initialPosition = CameraPosition(target: LatLng(26.8206, 30.8025));
  Completer<GoogleMapController> _controller = Completer();
  void _onMapCreated(GoogleMapController controller) {
      _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Text(
              "Hola"
            ),
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