import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
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

class _RegisterPageState extends State<RegisterPage> {
  final double containerHeight =
      ScreenUtil().setHeight(830); //wysokosc okna dialogowego
  bool _showProfile = true;

  bool checkboxAcceptRules = false;
  void _onAcceptRules(bool newValue) => setState(() {
        checkboxAcceptRules = newValue;

        if (checkboxAcceptRules) {
          // TODO: zmienna zaakceptowal regulamin
        } else {
          // TODO: odrzucil regulamin, musi go zaakceptowac
        }
      });

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
                      //===================== REJESTRACJA KONTA - TYTUŁ======================
                      Text("Rejestracja konta",
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
                      //===========================E-MAIL - TEXTBOX===================
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
                      //===========================HASLO - TEXTBOX===================
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
                              hintText: 'Hasło',
                              border: InputBorder
                                  .none, //wylacz podkreslenie przy nacisnieciu na textbox
                              contentPadding:
                                  EdgeInsets.only(top: ScreenUtil().setSp(27)),
                              prefixIcon: Icon(Icons.lock,
                                  color: Color.fromRGBO(102, 153, 51,
                                      1) // kolor ikony // ciemnozielony,
                                  )),
                        ),
                      ),
                      //============================================================
                      SizedBox(
                        height: ScreenUtil().setHeight(30),
                      ),
                      //===========================HASLO POWTORZ- TEXTBOX===================
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
                              hintText: 'Powtórz hasło',
                              border: InputBorder
                                  .none, //wylacz podkreslenie przy nacisnieciu na textbox
                              contentPadding:
                                  EdgeInsets.only(top: ScreenUtil().setSp(27)),
                              prefixIcon: Icon(Icons.lock,
                                  color: Color.fromRGBO(102, 153, 51,
                                      1) // kolor ikony // ciemnozielony,
                                  )),
                        ),
                      ),
                      //============================================================
                      SizedBox(
                        height: ScreenUtil().setHeight(20),
                      ),
                      //====================== CHECKBOX ZAPOZNAŁEM SIĘ ==============================
                      CheckboxListTile(
                        title: RichText(
                          text: TextSpan(
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenUtil().setHeight(20)),
                            children: <TextSpan>[
                              TextSpan(text: 'Zapoznałem się i akceptuję '),
                              TextSpan(
                                  text: 'Regulamin serwisu LightBox.pl',
                                  style: TextStyle(color: Colors.lightGreen),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      await launch(
                                          'https://www.lightbox.pl/przydatne-informacje/regulaminy');
                                    }),
                              TextSpan(
                                  text: ' zawierający Politykę prywatności.'),
                            ],
                          ),
                        ),
                        value: checkboxAcceptRules,
                        onChanged: _onAcceptRules,
                        controlAffinity: ListTileControlAffinity
                            .leading, //  <-- checkbox po lewej, tekst po prawej
                      ),
                      //============================================================
                      SizedBox(
                        height: ScreenUtil().setHeight(20),
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
                                child: Text("Zarejestruj się",
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
