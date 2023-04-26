import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NearbyHospitals extends StatefulWidget {
  @override
  _NearbyHospitalsState createState() => _NearbyHospitalsState();
}

class _NearbyHospitalsState extends State<NearbyHospitals> {
  late GoogleMapController mapController;
  late Position currentPosition;
  List<Marker> markers = [];
  static const CameraPosition currentCameraPosition = CameraPosition(target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      currentPosition = position;
      markers.add(
        Marker(
          markerId: MarkerId("currentLocation"),
          position: LatLng(currentPosition.latitude, currentPosition.longitude),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          infoWindow: InfoWindow(title: "Your Location"),
        ),
      );
      _getNearbyHospitals();
    });
  }

  Future<void> _getNearbyHospitals() async {
    final String apiUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json" +
        "?location=${currentPosition.latitude},${currentPosition.longitude}" +
        "&radius=5000" +
        "&type=hospital" +
        "&key= AIzaSyB8rTzZpZd7KTfACMMxWnPViNZdwKyRCpk";

    final response = await http.get(Uri.parse(apiUrl));
    final data = json.decode(response.body);

    if (data['status'] == "OK") {
      List<dynamic> results = data['results'];

      results.forEach((result) {
        setState(() {
          markers.add(
            Marker(
              markerId: MarkerId(result['place_id']),
              position: LatLng(result['geometry']['location']['lat'], result['geometry']['location']['lng']),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
              infoWindow: InfoWindow(title: result['name']),
            ),
          );
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nearby Hospitals"),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(currentPosition.latitude, currentPosition.longitude),
              zoom: 14,
            ),
            markers: markers.toSet(),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                mapController.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(currentPosition.latitude, currentPosition.longitude),
                    zoom: 14,
                  ),
                ));
              },
              child: Icon(Icons.my_location),
            ),
          ),
        ],
      ),
    );
  }
}