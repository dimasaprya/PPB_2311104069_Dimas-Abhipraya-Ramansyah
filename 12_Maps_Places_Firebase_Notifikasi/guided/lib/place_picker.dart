import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker_google/place_picker_google.dart';

class PlacePickScreen extends StatefulWidget {
  const PlacePickScreen({super.key});

  @override
  State<PlacePickScreen> createState() => _PlacePickScreenState();
}

class _PlacePickScreenState extends State<PlacePickScreen> {
  static final LatLng _defaultLocation = const LatLng(-7.441280, 109.244398);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PlaceApi')),
      body: PlacePicker(
        apiKey: "AIzaSyAhLKzV0RnTmIyg1LM3Gbo62tucGfuZTn8",
        initialLocation: _defaultLocation,
      ) ,
    );
  }
}