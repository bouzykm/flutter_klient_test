import 'package:flutter/material.dart';
import 'package:flutter_klient_lightbox_test/Home/home_page.dart';
import 'package:flutter_klient_lightbox_test/Profile/Widgets/carousel_address_list.dart';
import 'package:flutter_klient_lightbox_test/Profile/Widgets/carousel_food_preferences.dart';
import 'package:flutter_klient_lightbox_test/Profile/Widgets/carousel_target.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_klient_lightbox_test/.Global/Widgets/bottom_navigation_bar.dart';
import 'package:flutter_klient_lightbox_test/.Global/global_variables.dart'
    as globalVariables;
import 'package:get/get.dart';

double currentWeight = 65;
double targetWeight = 55;

//obsluga przycisku wstecz
Future<bool> onWillPop() {
  return Get.to(HomePage()); // wroc do strony glownej
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    globalVariables.selectedIndex =
        3; // zaznacz 4 ikone bottomNavigationBar kiedy znajdziesz sie na stronie
    return new WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: new AppBar(
          leading: IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 10,
          title:
              Text('Ustawienia profilu', style: TextStyle(color: Colors.black)),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Container(
              color: Colors.white,
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  //===========================================================
                  SizedBox(
                    height: ScreenUtil().setHeight(30),
                  ),
                  //============================TYTUŁ============================
                  Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Mój LightBox',
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(50),
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black))
                        ],
                      ),
                    ),
                  ),
                  //===========================================================
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  //=====================ADRESY=========================
                  Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Wybierz domyślny adres dostawy',
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(40),
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  CarouselAddressListWidget(),
                  //===========================================================
                  SizedBox(
                    height: ScreenUtil().setHeight(30),
                  ),
                  //======================= JAKI JEST TWOJ CEL ==========================
                  Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Jaki jest Twój cel?',
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(40),
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  //==================================================================
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  //======================= CAROUSEL TARGET ==========================
                  TargetCarouselWidget(),
                  //==================================================================
                  SizedBox(
                    height: ScreenUtil().setHeight(30),
                  ),
                  //======================= JAKIE SĄ TWOJE PREFERENCJE ŻYWIENIOWE ==========================
                  Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Jakie są Twoje preferencje żywieniowe?',
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(40),
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  //==================================================================
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  //======================= CAROUSEL TARGET ==========================
                  FoodPreferencesCarouselWidget(),
                  //==================================================================
                  SizedBox(
                    height: ScreenUtil().setHeight(30),
                  ),
                  //======================= WAGA OBECNA ==========================
                  Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Waga obecna',
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(40),
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  //========================= SLIDER ==========================

                  Slider(
                    value: currentWeight,
                    onChanged: (newCurrentWeight) {
                      setState(() => currentWeight = newCurrentWeight);
                    },
                    divisions: 220,
                    min: 40,
                    max: 150,
                    label: "$currentWeight",
                    
                  ),
                  Text('$currentWeight kg', style: TextStyle(fontWeight: FontWeight.w600),),
                  //======================= WAGA DOCELOWA ==========================
                  Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Waga docelowa',
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(40),
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  //========================= SLIDER ==========================

                  Slider(
                    value: targetWeight,
                    onChanged: (newTargetWeight) {
                      setState(() => targetWeight = newTargetWeight);
                    },
                    divisions: 220,
                    min: 40,
                    max: 150,
                    label: "$targetWeight",
                    
                  ),
                  Text('$targetWeight kg', style: TextStyle(fontWeight: FontWeight.w600),),
                ],
              )),
        ),
        //===============================STOPKA==================================
        bottomNavigationBar: BottomNavigationBarWidget(), //<----------------
        //=======================================================================
      ),
    );
  }
}
