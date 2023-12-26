import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mobile3/view/menu.dart';
import 'package:mobile3/view/navbar.dart';
import 'package:mobile3/view/splash.dart';

// import 'package:mobile3/event/eventPref.dart';
// import 'package:mobile3/view/dashboard/dashboard.dart';
import 'package:mobile3/view/login.dart';
import 'package:mobile3/view/register.dart';
import 'package:mobile3/view/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black.withAlpha(9),
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent, elevation: 0),
        ),
        getPages: [
          GetPage(name: '/', page: () => Splash()),
          GetPage(name: '/login', page: () => Login()),
          GetPage(name: '/register', page: () => Register()),
          GetPage(name: '/navbar', page: () => Navbar()),
        ],
        home: Splash());
  }
}
