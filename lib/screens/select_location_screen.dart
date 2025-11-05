import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocery_app/elements/big_button.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:grocery_app/services/address_service.dart';

import 'package:grocery_app/services/location_service.dart';
import 'package:provider/provider.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  final store = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer2<LocationService, AddressService>(
        builder: (context, loc, address, child) {
      loc.fetchLox();
      if (loc.isLoading == true) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        address.getaddress(
            longitude: loc.currentPosition!.longitude,
            latitude: loc.currentPosition!.latitude);
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              SizedBox(
                height: 60,
              ),
              SvgPicture.asset(
                "assets/Images/neccessery_icons/location_screen_map_img.svg",
                height: 170,
                width: 224,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                "Select Your Location",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
              )),
              SizedBox(
                height: 5,
              ),
              Center(
                  child: Text(
                "Swithch on your location to stay in tune with\n what’s happening in your area",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Colors.grey),
                textAlign: TextAlign.center,
              )),
              SizedBox(
                height: 400,
              ),
              BigButton(
                text: Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w800),
                ),
                isNavigate: true,
                navgateTo: HomeScreen(),
              )
            ],
          ),
        );
      }
    }));
  }
}
