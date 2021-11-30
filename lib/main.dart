import 'package:flutter/material.dart';
import 'package:flutter_klient_lightbox_test/Login/login_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home/home_page.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // nalezy zastosowac, aby uzyc widgetow i funkcji w momencie startu appki ( w tym przypadku do shared preferences)
  SharedPreferences prefs = await SharedPreferences.getInstance();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  var isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  print('Is user logged in? $isLoggedIn');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Colors.lightGreen,
        accentColor: Colors.lightGreen,
        primarySwatch: Colors.lightGreen,
        splashColor: Colors.lightGreen,
),
    navigatorKey: Get.key,
    home: isLoggedIn
        ? HomePage()
        : LoginPage(), // jezeli zalogowany, przed do strony glownej, jezeli nie - przejdz do logowania
    localizationsDelegates: GlobalMaterialLocalizations.delegates,
    supportedLocales: [const Locale('pl', 'PL')],
  ));
}
