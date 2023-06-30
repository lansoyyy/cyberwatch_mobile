import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../services/location.dart';
import '../utils/colors.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool hasloaded = false;

  double lat = 0;
  double long = 0;

  @override
  void initState() {
    super.initState();
    determinePosition();
    Geolocator.getCurrentPosition().then((position) {
      setState(() {
        lat = position.latitude;
        long = position.longitude;
        hasloaded = true;
      });
    }).catchError((error) {
      print('Error getting location: $error');
    });
  }

  GoogleMapController? mapController;

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    CameraPosition kGooglePlex = CameraPosition(
      target: LatLng(lat, long),
      zoom: 14.4746,
    );
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        backgroundColor: primary,
        title: TextRegular(
          text: 'HOME',
          fontSize: 18,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: hasloaded
          ? GoogleMap(
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              myLocationEnabled: true,
              initialCameraPosition: kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                setState(() {
                  mapController = controller;
                });
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.my_location,
        ),
        onPressed: () {
          mapController?.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  bearing: 45, tilt: 40, target: LatLng(lat, long), zoom: 16)));
        },
      ),
    );
  }
}
