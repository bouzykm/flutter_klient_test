import 'package:flutter/material.dart';
import 'package:flutter_klient_lightbox_test/Home/home_page.dart';
import 'package:flutter_klient_lightbox_test/Cart/cart_page.dart';
import 'package:flutter_klient_lightbox_test/CurrentOrders/current_orders_page.dart';
import 'package:flutter_klient_lightbox_test/Profile/profile_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_klient_lightbox_test/.Global/global_variables.dart'
    as globalVariables;

class BottomNavigationBarWidget extends StatefulWidget {
  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  void _onItemTapped(int index) {
    setState(() {
      globalVariables.selectedIndex = index;
      //zdefiniuj co zrobic po nacisnieciu jednej z ikon
      switch (globalVariables.selectedIndex) {
        case 0: //Start
          {
            Get.to(HomePage());
            break;
          }
        case 1: // Zamówienia 
          {
            Get.to(CurrentOrdersPage());
            break;
          }
        case 2: // Koszyk
          {
            Get.to(ShoppingCart());
            break;
          }
        case 3: // Mój profil
          {
            Get.to(ProfilePage());
            break;
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //wyglad ikon
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem( 
          icon: Icon(
            Icons.home,
            size: ScreenUtil().setSp(50),
          ),
          title: new Text(
            'Start',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(20),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_basket,
            size: ScreenUtil().setSp(50),
          ),
          title: new Text(
            'Zamówienia',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(20),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart,
            size: ScreenUtil().setSp(50),
          ),
          title: new Text(
            'Koszyk',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(20),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            size: ScreenUtil().setSp(50),
          ),
          title: new Text(
            'Mój profil',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(20),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
      currentIndex: globalVariables.selectedIndex,
      selectedItemColor: Colors.lightGreen,
      onTap: _onItemTapped,
    );
  }
}
