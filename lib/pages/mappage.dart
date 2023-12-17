import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  final LatLng sourceLocation = LatLng(15.2864, 145.8156);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Banzai Cliff"),
      ),
      body: GoogleMap(
          markers: {
            Marker(markerId: MarkerId("source"), position: sourceLocation)
          },
          initialCameraPosition:
              CameraPosition(target: sourceLocation, zoom: 14.5)),
    );
  }
}
