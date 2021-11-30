import 'package:flutter/material.dart';
import 'package:flutter_klient_lightbox_test/.Global/Widgets/bottom_navigation_bar.dart';
import 'package:flutter_klient_lightbox_test/.Global/global_variables.dart'
    as globalVariables;
import 'package:flutter_klient_lightbox_test/Home/Widgets/carousel_diets_list.dart';
import 'package:flutter_klient_lightbox_test/Home/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//obsluga przycisku wstecz
Future<bool> onWillPop() {
  return Get.to(HomePage()); // wroc do strony glownej
}

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  //================== DEKLARACJE =========================
  TextStyle titleBoxTextStyle = TextStyle(
      fontSize: ScreenUtil().setSp(40),
      fontWeight: FontWeight.w800,
      color: Colors.black);

  TextStyle detailsBoxTextStyle = TextStyle(
      fontSize: ScreenUtil().setSp(30),
      fontWeight: FontWeight.w400,
      color: Colors.grey);
//========================================================
  @override
  Widget build(BuildContext context) {
    globalVariables.selectedIndex =
        2; // zaznacz 3 ikone bottomNavigationBar kiedy znajdziesz sie na stronie
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
          title: Text('Koszyk zamówień', style: TextStyle(color: Colors.black)),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: <Widget>[
                        new Column(
                          children: <Widget>[
                            Material(
                              elevation: 5,
                              //color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              child: Column(
                                children: [
                                  SizedBox(height: ScreenUtil().setSp(5)),
                                  Container(
                                    margin: new EdgeInsets.only(
                                        top: 15.0, bottom: 15.0, left: 140),
                                    decoration: new BoxDecoration(
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(10.0)),
                                    ),
                                    child: new Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .end, // pozycja obrazka
                                      children: <Widget>[
                                        new Expanded(
                                            child: new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            //============== TEKST W BOXIE =====================
                                            new Text('Slim FLEX',
                                                style: titleBoxTextStyle),
                                            new SizedBox(
                                                height:
                                                    ScreenUtil().setHeight(5)),
                                            Row(
                                              children: <Widget>[
                                                Icon(Icons.fastfood,
                                                    color: Colors.grey),
                                                SizedBox(
                                                  width:
                                                      ScreenUtil().setWidth(15),
                                                ),
                                                Text('1800 kcal',
                                                    style: detailsBoxTextStyle),
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.local_dining,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(
                                                  width:
                                                      ScreenUtil().setWidth(15),
                                                ),
                                                Text('Office - 4 posiłki',
                                                    style: detailsBoxTextStyle),
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.calendar_today,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(
                                                  width:
                                                      ScreenUtil().setWidth(15),
                                                ),
                                                Text('02.10.2019 - 30.10.2019',
                                                    style: detailsBoxTextStyle),
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.not_interested,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(
                                                  width:
                                                      ScreenUtil().setWidth(15),
                                                ),
                                                Text(
                                                  'Bez weekendów',
                                                  style: detailsBoxTextStyle,
                                                ),
                                              ],
                                            ),
                                            new SizedBox(
                                                height:
                                                    ScreenUtil().setHeight(5)),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    MaterialButton(
                                                      elevation: 3,
                                                      height: ScreenUtil()
                                                          .setSp(70),
                                                      padding:
                                                          EdgeInsets.all(0),
                                                      minWidth: ScreenUtil()
                                                          .setSp(70),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      onPressed: () {},
                                                      color: Colors.grey[700],
                                                      textColor: Colors.white,
                                                      child: Text(
                                                        '-',
                                                        style: TextStyle(
                                                            fontSize:
                                                                ScreenUtil()
                                                                    .setSp(50)),
                                                      ),
                                                    ),
                                                    MaterialButton(
                                                      elevation: 3,
                                                      height: ScreenUtil()
                                                          .setSp(70),
                                                      padding:
                                                          EdgeInsets.all(0),
                                                      minWidth: ScreenUtil()
                                                          .setSp(70),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      onPressed: () {},
                                                      color: Colors.grey[500],
                                                      textColor: Colors.white,
                                                      child: Text(
                                                        '1',
                                                        style: TextStyle(
                                                            fontSize:
                                                                ScreenUtil()
                                                                    .setSp(40)),
                                                      ),
                                                    ),
                                                    MaterialButton(
                                                      elevation: 3,
                                                      height: ScreenUtil()
                                                          .setSp(70),
                                                      padding:
                                                          EdgeInsets.all(0),
                                                      minWidth: ScreenUtil()
                                                          .setSp(70),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      onPressed: () {},
                                                      color: Colors.grey[700],
                                                      textColor: Colors.white,
                                                      child: Text(
                                                        '+',
                                                        style: TextStyle(
                                                            fontSize:
                                                                ScreenUtil()
                                                                    .setSp(50)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    MaterialButton(
                                                      elevation: 3,
                                                      height: ScreenUtil()
                                                          .setSp(70),
                                                      padding:
                                                          EdgeInsets.all(0),
                                                      minWidth: ScreenUtil()
                                                          .setSp(70),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      onPressed: () {},
                                                      color: Colors.grey[700],
                                                      textColor: Colors.white,
                                                      child: Icon(
                                                        Icons.delete,
                                                        size: ScreenUtil()
                                                            .setSp(40),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: ScreenUtil()
                                                          .setSp(20),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            //=================================================
                                          ],
                                        )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: ScreenUtil().setSp(20)),
                          ],
                        ),
                        //==================== CENA ZESTAWU =========================
                        Positioned(
                          top: ScreenUtil().setSp(280),
                          left: ScreenUtil().setSp(90),
                          child: Text('221zł', style: titleBoxTextStyle),
                        ),
                        //==================== OBRAZEK DIETY ========================
                        Positioned(
                          top: ScreenUtil().setSp(30),
                          left: ScreenUtil().setSp(30),
                          child: Material(
                            elevation: 3,
                            borderRadius: BorderRadius.circular(20.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Image.asset(
                                'images/box.png',
                                width: ScreenUtil().setSp(200.0),
                                height: ScreenUtil().setSp(200.0),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        //=============================================================
                      ],
                    );
                  },
                ),
              ),
            ),
            Container(
              height: 65,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(width: 0.3, color: Colors.grey),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20.0))),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(width: ScreenUtil().setSp(5)),
                  RichText(
                    text: TextSpan(
                        text: 'Do zapłaty: ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '1250',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          TextSpan(
                            text: ' PLN',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ]),
                  ),
                  MaterialButton(
                    elevation: ScreenUtil().setSp(1),
                    minWidth: ScreenUtil().setWidth(250),
                    height: ScreenUtil().setHeight(60),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(
                        ScreenUtil().setHeight(10),
                      ),
                    ),
                    onPressed: () {},
                    color: Colors.lightGreen,
                    textColor: Colors.white,
                    child: Text("Zamów",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(35),
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(width: ScreenUtil().setSp(5)),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBarWidget(),
      ),
    );
  }
}
