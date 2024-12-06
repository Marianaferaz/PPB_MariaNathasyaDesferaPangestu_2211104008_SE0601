import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final LatLng _kMapCenter =
      const LatLng(19.018255973653343, 72.84793849278007);
  static final 
  CameraPosition _kInitialPosition = CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps Demo'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 222, 135,240),
      ),
      body: GoogleMap(initialCameraPosition: _kInitialPosition, myLocationEnabled: true,
      ), // GoogleMap
    );
  }
}