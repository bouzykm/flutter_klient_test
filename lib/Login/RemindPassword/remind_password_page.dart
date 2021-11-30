import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RemindPasswordPage extends StatefulWidget {
  @override
  _RemindPasswordPageState createState() => _RemindPasswordPageState();
}

Widget horizontalLine() => Padding(
      padding: EdgeInsets.only(
          left: ScreenUtil().setSp(1), right: ScreenUtil().setSp(1)),
      child: Container(
        width: ScreenUtil().setWidth(1000),
        height: ScreenUtil().setHeight(1),
        color: Colors.black26.withOpacity(.2),
      ),
    );

class _RemindPasswordPageState extends State<RemindPasswordPage> {
  final double containerHeight =
      ScreenUtil().setHeight(420); //wysokosc okna dialogowego
  bool _showProfile = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomPadding: true,
      body: Material(
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Positioned(
              //animacja wejscia
              bottom: _showProfile ? 0 : -containerHeight,
              right: 0,
              left: 0,
              child: Dismissible(
                direction: DismissDirection.vertical,
                key: Key(''), // to do zmiany kiedy bedzie lista
                onDismissed: (direction) => {
                  Navigator.of(context).pop(),
                },
                child: Container(
                  padding: new EdgeInsets.only(
                      left: ScreenUtil().setSp(100),
                      right: ScreenUtil().setSp(100),
                      top: ScreenUtil().setSp(50)),
                  color: Colors.white,
                  height: containerHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      //================== NOWE HASŁO - TYTUŁ======================
                      Text("Nowe hasło",
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
                      //===================E-MAIL - TEXTBOX===================
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.0),
                          border: Border.all(color: Colors.black12),
                          color: Color.fromRGBO(
                              245, 245, 245, 1), // kolor tła boxa
                        ),
                        height: ScreenUtil().setHeight(100),
                        child: TextField(
                          //controller: loginController,
                          cursorColor:
                              Color.fromRGBO(102, 153, 51, 1), // kolor kursora
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              hintText: 'E-mail',
                              border: InputBorder
                                  .none, //wylacz podkreslenie przy nacisnieciu na textbox
                              contentPadding:
                                  EdgeInsets.only(top: ScreenUtil().setSp(27)),
                              prefixIcon: Icon(Icons.email,
                                  color: Color.fromRGBO(102, 153, 51,
                                      1) // kolor ikony // ciemnozielony,
                                  )),
                        ),
                      ),
                      //============================================================
                      SizedBox(
                        height: ScreenUtil().setHeight(30),
                      ),
                      //======================== WYSLIJ NOWE HASLO - PRYCISK=========================
                      InkWell(
                        child: Container(
                          width: ScreenUtil().setWidth(350),
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
                              onTap: () {},
                              child: Center(
                                child: Text("Wyślij nowe hasło",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins-Bold",
                                        fontSize: ScreenUtil().setHeight(25),
                                        letterSpacing: 1.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //==============================================================
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
