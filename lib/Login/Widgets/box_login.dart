import 'package:flutter/material.dart';
import 'package:flutter_klient_lightbox_test/.Global/.Requests/login_request.dart';
import 'package:flutter_klient_lightbox_test/Home/home_page.dart';
import 'package:flutter_klient_lightbox_test/Login/RemindPassword/remind_password_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//TODO Wstawione sa wartosci testowe
//--zmienne wartosci z textboxów--
TextEditingController loginController =
    new TextEditingController(text: 'janek');
TextEditingController passwordController =
    new TextEditingController(text: 'janek123');
//--------------------------------

//widget - pozioma linia
Widget horizontalLine() => Padding(
      padding: EdgeInsets.only(
          left: ScreenUtil().setSp(1), right: ScreenUtil().setSp(1)),
      child: Container(
        width: ScreenUtil().setWidth(1000),
        height: ScreenUtil().setHeight(1),
        color: Colors.black26.withOpacity(.2),
      ),
    );

class LoginBoxWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    //=======================WLASCIWOSCI - BOX=======================================
    return new Container(
      width: double.infinity,
      height: ScreenUtil().setHeight(600),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(1.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 10.0),
                blurRadius: 7.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0),
          ]),
      child: Padding(
          padding: EdgeInsets.only(
              left: ScreenUtil().setSp(30),
              right: ScreenUtil().setSp(30),
              top: ScreenUtil().setSp(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Logowanie",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(45),
                      fontFamily: "Poppins-Bold",
                      letterSpacing: .6)),
              //============================================================
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              horizontalLine(),
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              //===========================LOGIN - TEXTBOX===================
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1.0),
                  border: Border.all(color: Colors.black12),
                  color: Color.fromRGBO(245, 245, 245, 1), // kolor tła boxa
                ),
                height: ScreenUtil().setHeight(100),
                child: TextField(
                  controller: loginController,

                  cursorColor: Color.fromRGBO(102, 153, 51, 1), // kolor kursora
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      hintText: 'Login',
                      border: InputBorder
                          .none, //wylacz podkreslenie przy nacisnieciu na textbox
                      contentPadding:
                          EdgeInsets.only(top: ScreenUtil().setSp(27)),
                      prefixIcon: Icon(Icons.person,
                          color: Color.fromRGBO(
                              102, 153, 51, 1) // kolor ikony // ciemnozielony,
                          )),
                ),
              ),
              //============================================================
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              //=========================HASŁO - TEXTBOX=====================
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1.0),
                  border: Border.all(color: Colors.black12),
                  color: Color.fromRGBO(245, 245, 245, 1), // kolor tła boxa
                ),
                height: ScreenUtil().setHeight(100),
                child: TextField(
                  controller: passwordController,
                  obscureText: true, // gwizadkowanie wpisywanego hasła
                  cursorColor: Color.fromRGBO(
                      102, 153, 51, 1), // kolor kursora - ciemnozielony
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      hintText: 'Hasło',
                      border: InputBorder
                          .none, //wylacz podkreslenie przy nacisnieciu na textbox
                      contentPadding:
                          EdgeInsets.only(top: ScreenUtil().setSp(30)),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color.fromRGBO(102, 153, 51, 1),
                      )),
                ),
              ),
              //=================================================================
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              //========================ZALOGUJ SIĘ - PRYCISK=========================
              InkWell(
                child: Container(
                  width: ScreenUtil().setWidth(330),
                  height: ScreenUtil().setHeight(100),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(153, 194, 33, 1),
                        Color.fromRGBO(102, 153, 51, 1)
                      ]),
                      borderRadius: BorderRadius.circular(1.0),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFF6078ea).withOpacity(.3),
                            offset: Offset(0.0, 4.0),
                            blurRadius: 5.0)
                      ]),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        // onButtonZalogujSieClicked
                        //===========ŁADOWANIE EKRANU=============
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
                        //========================================
                        //loginRequest(context); // deklaracja odpowiedzi
                        Navigator.pop(context); // zamknij ladowanie ekranu
                        Get.to(HomePage()); //
                      },
                      child: Center(
                        child: Text('Zaloguj się',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins-Bold",
                                fontSize: ScreenUtil().setSp(32),
                                letterSpacing: 1.0)),
                      ),
                    ),
                  ),
                ),
              ),
              //==============================================================
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              //================ZAPOMNIAŁEM HASŁA - TEXTLABEL==========================
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      showGeneralDialog(
                        barrierLabel: "Label",
                        barrierDismissible: true,
                        barrierColor: Colors.black.withOpacity(0.5),
                        transitionDuration: Duration(milliseconds: 500),
                        context: context,
                        pageBuilder: (context, anim1, anim2) {
                          return RemindPasswordPage(); //<---------------------------- przypomnij haslo
                        },
                        transitionBuilder: (context, anim1, anim2, child) {
                          return SlideTransition(
                            position:
                                Tween(begin: Offset(0, 1), end: Offset(0, 0))
                                    .animate(anim1),
                            child: child,
                          );
                        },
                      );
                    },
                    child: Text("Zapomniałem/am hasła",
                        style: TextStyle(
                            color: Color.fromRGBO(102, 153, 51, 1),
                            fontFamily: "Poppins-Bold")),
                  ),
                ],
              ),
              //=================================================================
            ],
          )),
    );
  }
}
