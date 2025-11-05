import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/app%20configs/app_Config.dart';
import 'package:grocery_app/elements/item_card.dart';
import 'package:grocery_app/services/address_service.dart';
import 'package:grocery_app/services/api_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imglst = [
      "assets/Images/neccessery_icons/carrousel_banner.png",
      "assets/Images/neccessery_icons/carrousel_banner.png",
      "assets/Images/neccessery_icons/carrousel_banner.png",
    ];
    return Consumer2<AddressService, ApiService>(
      builder: (context, address, api, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              SizedBox(
                height: 30,
              ),
              SvgPicture.asset(
                "assets/Images/neccessery_icons/carrot_logo.svg",
                height: 30,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, color: Colors.black54),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    address.address!,
                    style: TextStyle(
                        fontWeight: FontWeight.w800, color: Colors.black54),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.08),
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    leading: Icon(Icons.search),
                    title: Text(
                      "Search Store",
                      style: TextStyle(
                          color: Colors.black.withOpacity(.4),
                          fontWeight: FontWeight.w800),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              CarouselSlider(
                  items: imglst
                      .map((e) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(e), fit: BoxFit.cover),
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    height: 95,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    enlargeCenterPage: true,
                  )),
              SizedBox(
                height: 20,
              ),
              // InkWell(
              //   onTap: () {
              //     store.erase();
              //     Navigator.pushReplacement(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => LogInScreen(),
              //         ));
              //   },
              //   child: Container(
              //       height: 50,
              //       width: double.maxFinite,
              //       decoration: BoxDecoration(
              //           color: Colors.red,
              //           borderRadius: BorderRadius.circular(30)),
              //       child: Center(
              //           child: Text(
              //         "Logout",
              //         style: TextStyle(
              //             color: Colors.white, fontWeight: FontWeight.w800),
              //       ))),
              // )
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Exclusive Offer ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: api.getProducts(),
                builder: (context, snapshot) {
                  return ItemCard();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
