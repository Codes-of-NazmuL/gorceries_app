import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class AddressService extends ChangeNotifier {
  String? address;
  String? error;
  bool isLoading = false;

  Future<String?> getAddress({
    required double latitude,
    required double longitude,
  }) async {
    isLoading = true;
    notifyListeners();

    try {
      final placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        address = "${place.locality}, ${place.country}";
        isLoading = false;
        notifyListeners();
        return address;
      } else {
        address = "Unknown location";
        isLoading = false;
        notifyListeners();
        return address;
      }
    } catch (e) {
      error = e.toString();
      isLoading = false;
      notifyListeners();
      return error;
    }
  }
}
