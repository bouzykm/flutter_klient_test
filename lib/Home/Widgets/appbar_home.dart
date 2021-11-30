import 'package:flutter/material.dart';
import 'package:flutter_klient_lightbox_test/Cart/cart_page.dart';
import 'package:flutter_klient_lightbox_test/Login/login_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<IconData> _icons = [Icons.shopping_cart, Icons.chat, Icons.notifications];

List<Color> _iconsNotificationsColor = [
  Colors.lightGreen,
  Colors.deepOrange,
  Colors.deepOrange
];

List<int> _iconsNotificationsNumber = [5, 0, 15];

class HomeAppBarWidget extends StatefulWidget with PreferredSizeWidget {
  @override
  _HomeAppBarWidgetState createState() => _HomeAppBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _HomeAppBarWidgetState extends State<HomeAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.exit_to_app,
          color: Colors.black54,
          size: ScreenUtil().setSp(60),
        ),
        onPressed: () async {
          //================ WYLOGUJ =====================
          //------------ ladowanie ekranu ------------
          showDialog(
              context: context,
              barrierDismissible:
                  false, // klikniecie w ekran nie wylacza ladowania ekranu
              builder: (BuildContext context) {
                return Center(
                  child: WillPopScope(
                    child: CircularProgressIndicator(),
                    onWillPop: () {
                      return Future.value(
                          false); // klikniecie wstecz nie wylacza ladowania ekranu
                    },
                  ),
                );
              });
          //-------------------------------------------

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs?.remove('isLoggedIn');
          prefs?.remove('sessionToken');
          print('User logout');
          Get.to(LoginPage());
          //=============================================
        },
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      actions: <Widget>[
        ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: _icons.length,
          itemBuilder: (context, index) {
            //======================= PRZYCISKI ===============================
            return Stack(
              children: [
                IconButton(
                  icon: Icon(_icons[index],
                      color: Colors.black54, size: ScreenUtil().setSp(60)),
                  onPressed: () {
                    switch (index) {
                      case 0: // koszyk zamowien
                        {
                          Get.to(ShoppingCart());
                          break;
                        }
                      case 1: // wiadomosci
                        {
                          //====================ALERT DIALOG - EXCEPTION=====================
                          //przycisk potwierdzajacy
                          Widget okButton = FlatButton(
                            textColor: Color.fromRGBO(102, 153, 51, 1),
                            child: Text("Potwierdź"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          );
                          //dialog
                          AlertDialog alert = AlertDialog(
                            title: Text("Info"),
                            content: Text("Tutaj będzie ekran wiadomości"),
                            actions: [
                              okButton,
                            ],
                          );
                          //pokaz komunikat
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                          //===========================================================================
                          break;
                        }
                      case 2: // powiadomienia
                        {
                          //====================ALERT DIALOG - EXCEPTION=====================
                          //przycisk potwierdzajacy
                          Widget okButton = FlatButton(
                            textColor: Color.fromRGBO(102, 153, 51, 1),
                            child: Text("Potwierdź"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          );
                          //dialog
                          AlertDialog alert = AlertDialog(
                            title: Text("Info"),
                            content: Text("Tutaj będzie ekran powiadomień"),
                            actions: [
                              okButton,
                            ],
                          );
                          //pokaz komunikat
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                          //===========================================================================
                          break;
                        }
                    }
                  },
                ),
                if (_iconsNotificationsNumber[index] >
                    0) // pokaz liczbe powiadomien, jezeli są
                  Container(
                    width: ScreenUtil().setSp(40),
                    height: ScreenUtil().setSp(40),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _iconsNotificationsColor[index],
                        border: Border.all(
                            color: Colors.white, width: ScreenUtil().setSp(1))),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Center(
                        child: Text(
                          _iconsNotificationsNumber[index].toString(),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: ScreenUtil().setSp(25),
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
              ],
            );
            //=============================================================
          },
        ),
      ],
    );
  }
}
