import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class AddressService extends ChangeNotifier {
  String? address;
  String? eror;
  bool isLoading = true;

  Future getaddress(
      {required double longitude, required double latitude}) async {
    try {
      List<Placemark> placeMark =
          await placemarkFromCoordinates(latitude, longitude);
      if (placeMark.isNotEmpty) {
        Placemark place = placeMark[0];
        address = "${place.locality}, ${place.country}";
        if (address == null) {
          isLoading = true;
        } else {
          isLoading = false;
        }
        return address;
      }
    } catch (e) {
      eror = e as String;
      return eror;
    }
    notifyListeners();
  }

  // ignore: strict_top_level_inference
}
