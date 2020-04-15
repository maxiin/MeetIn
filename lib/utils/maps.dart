import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:events_app/utils/secrets.dart';

GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: GMAPS_API_KEY);

Future<LatLng> findPlace(BuildContext context) async {
  Prediction p = await PlacesAutocomplete.show(
    context: context,
    apiKey: GMAPS_API_KEY,
    mode: Mode.overlay,
    language: "en",
    // logo: Container(height: 300),
    radius: 10000,
    onError: (value) => print(value.toJson()),
  );
  PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId);
  double lat = detail.result.geometry.location.lat;
  double lng = detail.result.geometry.location.lng;
  return new LatLng(lat, lng);
}