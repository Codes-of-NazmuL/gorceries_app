import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/app%20configs/app_Config.dart';
import 'package:grocery_app/elements/item_card.dart';
import 'package:grocery_app/services/address_service.dart';
import 'package:grocery_app/services/api_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    final List<String> imglst = [
      "assets/Images/neccessery_icons/carrousel_banner.png",
      "assets/Images/neccessery_icons/carrousel_banner.png",
      "assets/Images/neccessery_icons/carrousel_banner.png",
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              SvgPicture.asset(
                "assets/Images/neccessery_icons/carrot_logo.svg",
                height: 30,
              ),
              SizedBox(
                height: 5,
              ),
              Consumer<AddressService>(
                  builder: (context, address, child) => address.isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on, color: Colors.black54),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              address.address!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black54),
                            )
                          ],
                        )),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Search Store",
                        style: TextStyle(
                            color: Colors.black.withOpacity(.5),
                            fontWeight: FontWeight.w800,
                            fontSize: 14),
                      ),
                      Spacer()
                    ],
                  ),
                ),
              ),
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
                    height: 116,
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
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 250,
                child: FutureBuilder(
                  future: apiService.getProducts(1),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.data.products.length - 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return ItemCard(
                              image: snapshot.data!.data.products[index + 1]
                                      .images.isEmpty
                                  ? null
                                  : snapshot.data!.data.products[index + 1]
                                      .images[0].url,
                              name:
                                  snapshot.data!.data.products[index + 1].name,
                              shortDsc: snapshot
                                  .data!.data.products[index + 1].category.name,
                              Price: snapshot
                                  .data!.data.products[index + 1].price
                                  .toString());
                        },
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Best Selling ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 250,
                child: FutureBuilder(
                  future: apiService.getProducts(2),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.data.products.length - 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return ItemCard(
                              image: snapshot.data!.data.products[index + 5]
                                      .images.isEmpty
                                  ? null
                                  : snapshot.data!.data.products[index + 5]
                                      .images[0].url,
                              name:
                                  snapshot.data!.data.products[index + 5].name,
                              shortDsc: snapshot
                                  .data!.data.products[index + 5].category.name,
                              Price: snapshot
                                  .data!.data.products[index + 5].price
                                  .toString());
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
