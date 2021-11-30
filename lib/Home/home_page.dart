import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_klient_lightbox_test/.Global/Widgets/bottom_navigation_bar.dart';
import 'package:flutter_klient_lightbox_test/.Global/global_variables.dart' as globalVariables;
import 'package:flutter_klient_lightbox_test/Home/Widgets/appbar_home.dart';
import 'package:flutter_klient_lightbox_test/Home/Widgets/box_green.dart';
import 'package:flutter_klient_lightbox_test/Home/Widgets/carousel_diets_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

DateTime currentBackPressTime;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Widget horizontalLine() => Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setSp(30)),
      child: Container(
        width: ScreenUtil().setWidth(150),
        height: ScreenUtil().setHeight(6),
        color: Colors.black26.withOpacity(.2),
      ),
    );

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    globalVariables.selectedIndex= 0;// zaznacz pierwsza ikone bottomNavigationBar kiedy znajdziesz sie na stronie
    ScreenUtil.init(context, width: 750, height: 1200, allowFontScaling: true);

    Future<bool> _onWillPop() {
        DateTime now = DateTime.now();
        if (currentBackPressTime == null || 
            now.difference(currentBackPressTime) > Duration(seconds: 2)) {

              //jezeli nacisnal wstecz raz
              currentBackPressTime = now;
              Fluttertoast.showToast(msg: "Naciśnij dwukrotnie, aby wyjść z aplikacji");
              return Future.value(false);
        }
        //jezeli nacisnie dwukrotnie przycisk wstecz
        return SystemChannels.platform.invokeMethod('SystemNavigator.pop'); // wyjdz z aplikacji
      }
      
    //obsluga przycisku wstecz
     return new WillPopScope(
      onWillPop: _onWillPop,
      child:   Scaffold(
        //======================== NAGŁOWEK ===============================
      appBar: HomeAppBarWidget(),
      //=====================================================================
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                //============================TYTUŁ============================
                Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Witaj, Aleksandra!',
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(70),
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black))
                        ],
                      ),
                    ),
                  ),
                //===================== NEWS ============================
                InkWell(
                child: Image.asset('images/home_images/why.png'),
                onTap: () {
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
                            content: Text(
                                "Tutaj będzie przejście do konkretnej wiadomości"),
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
                },
                ),
                InkWell(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset('images/home_images/news.png'),
                ),
                onTap: (){
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
                            content: Text(
                                "Tutaj będzie przejście do konkretnej wiadomości"),
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
                },),
                //=====================================================================================
                SizedBox(
                  height: ScreenUtil().setHeight(10),
                ),
                GreenBoxWidget(),
                SizedBox(
                  height: ScreenUtil().setHeight(30),
                ),
                //==================DIETY WYBRANE DLA CIEBIE==============
                horizontalLine(),
                SizedBox(
                  height: ScreenUtil().setHeight(30),
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: RichText(
                            text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Diety wybrane dla Ciebie",
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(40),
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black)),
                          ],
                        )))),
                SizedBox(
                  height: ScreenUtil().setHeight(10),
                ),
                //====================KARUZELA=======================
                CarouselDietsListWidget(), //<-----------------------------
                //===================================================== 
              ],
            )),
      ),
      //===============================STOPKA==================================
      bottomNavigationBar: BottomNavigationBarWidget(), //<----------------
      
      //=======================================================================
     ),);
  }
}
