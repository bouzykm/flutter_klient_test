import 'package:flutter/material.dart';
import 'package:flutter_klient_lightbox_test/Login/Register/register_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Widgets/box_login.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

Widget horizontalLine() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: ScreenUtil().setWidth(120),
        height: 1.0,
        color: Colors.black26.withOpacity(.2),
      ),
    );

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1200, allowFontScaling: true);
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        //==================================NAD BOXEM======================================
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: ScreenUtil().setSp(120), left: ScreenUtil().setSp(50), right: ScreenUtil().setSp(50)),
                  child: Image.asset('images/login_photos/logo_lightbox.png')),
            ],
          ),
          //==================================================================================
          //==============================BOX=================================================
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setSp(50), right: ScreenUtil().setSp(50), top: ScreenUtil().setSp(100)),
              child: Column(
                children: <Widget>[
                  Row(),
                  SizedBox(
                    height: ScreenUtil().setHeight(250),
                  ),
                  LoginBoxWidget(), // <-----------------box do logowania login/password
                  //====================================================================================
                  SizedBox(
                    height: ScreenUtil().setHeight(40),
                  ),
                  //=============================POD BOXEM==============================================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Nowy użytkownik? ',
                        style: TextStyle(fontFamily: 'Poppins-Medium'),
                      ),
                      InkWell(
                        onTap: () {
                          //------animacja wejscia cz1.-------
                          showGeneralDialog(
                            barrierLabel: "Label",
                            barrierDismissible: true,
                            barrierColor: Colors.black.withOpacity(0.5),
                            transitionDuration: Duration(milliseconds: 500),
                            context: context,
                            pageBuilder: (context, anim1, anim2) {
                              return RegisterPage(); //<---------------------------- rejestracja konta 
                            },
                            transitionBuilder: (context, anim1, anim2, child) {
                              return SlideTransition(
                                position: Tween(
                                        begin: Offset(0, 1), end: Offset(0, 0))
                                    .animate(anim1),
                                child: child,
                              );
                            },
                          );
                          //-----------------------------------
                        },
                        child: Text('Zarejestruj się',
                            style: TextStyle(
                                color: Color.fromRGBO(102, 153, 51, 1),
                                fontFamily: 'Poppins-Bold')),
                      ),
                    ],
                  ), //=================================================================================
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
