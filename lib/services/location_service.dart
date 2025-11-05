import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationService extends ChangeNotifier {
  Position? currentPosition;
  String? eror;
  bool isLoading = true;

  Future<void> fetchLox() async {
    try {
      currentPosition = await getLocation();
      notifyListeners();
    } catch (e) {
      eror = e.toString();
    }
    if (currentPosition == null) {
      isLoading = true;
      notifyListeners();
    } else {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<Position> getLocation() async {
    bool isEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();

    if (!isEnabled) {
      return Future.error("Location not Enabled");
    } else if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("permission");
      } else {
        return await Geolocator.getCurrentPosition();
      }
    } else {
      return await Geolocator.getCurrentPosition();
    }
  }
}
