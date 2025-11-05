import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocery_app/provider/bool_provider.dart';
import 'package:grocery_app/screens/select_location_screen.dart';
import 'package:grocery_app/screens/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/services/address_service.dart';
import 'package:grocery_app/services/api_service.dart';
import 'package:grocery_app/services/location_service.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BoolProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ApiService(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocationService(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddressService(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final store = GetStorage();
    String? token = store.read('token');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Groceris App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff53B175)),
          textTheme: GoogleFonts.poppinsTextTheme(),
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
            disabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 15),
            activeIndicatorBorder: BorderSide(color: Colors.white10),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIconColor: Colors.grey,
          )),
      themeMode: ThemeMode.dark,
      home: token == null ? SplashScreen() : SelectLocationScreen(),
    );
  }
}
