import 'dart:math';

import 'package:events_app/entities/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geolocator/geolocator.dart';
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

Future<String> getDistanceString(Event event) async {
  Position position = await Geolocator()
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  final userLat = position.latitude;
  final userLng = position.longitude;

  if (event.latitude == null ||
      event.longitude == null ||
      userLat == null ||
      userLng == null) {
    return '??km';
  }
  if ((userLat == event.latitude) && (userLng == event.longitude)) {
    return '0km';
  } else {
    final thisRadius = pi * userLat / 180;
    final schoolRadius = pi * event.latitude / 180;
    final dis = userLng - event.longitude;
    final disRadius = pi * dis / 180;
    double finalDis = sin(thisRadius) * sin(schoolRadius) +
        cos(thisRadius) * cos(schoolRadius) * cos(disRadius);
    if (finalDis > 1) {
      finalDis = 1;
    }
    finalDis = acos(finalDis);
    finalDis = finalDis * 180 / pi;
    finalDis = finalDis * 60 * 1.1515;
    finalDis = finalDis * 1.609344;
    return finalDis.toStringAsFixed(2) + 'km';
  }
}
