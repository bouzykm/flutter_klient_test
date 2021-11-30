import 'package:flutter/material.dart';
import 'package:flutter_klient_lightbox_test/NewOrder/Widgets/carousel_caloricity_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_klient_lightbox_test/Diet/Dish/Widgets/carousel_nutritional_values.dart';

Widget horizontalLine() => Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setSp(250)),
      child: Container(
        width: ScreenUtil().setWidth(300),
        height: ScreenUtil().setSp(4),
        color: Colors.black26.withOpacity(.2),
      ),
    );

class DishDetailsPage extends StatefulWidget {
  @override
  _DishDetailsPageState createState() => _DishDetailsPageState();
}

class _DishDetailsPageState extends State<DishDetailsPage> {
  final double containerHeight =
      ScreenUtil().setSp(1200.0); //wysokosc okna dialogowego
  bool _showProfile = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          Positioned(
            //-------animacja wejscia cz2----------
            bottom: _showProfile ? 0 : -containerHeight,
            right: 0,
            left: 0,
            //--------------------------------------
            child: Dismissible(
              direction: DismissDirection.vertical,
              key: Key('1'), // TODO zmiany kiedy bedzie lista
              onDismissed: (direction) => {
                Navigator.of(context).pop(),
              },
              child: Container(
                padding: new EdgeInsets.all(ScreenUtil().setSp(40.0)),
                color: Colors.white,
                height: containerHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    horizontalLine(),
                    SizedBox(
                      height: ScreenUtil().setSp(20.0),
                    ),
                    Row(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: new BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[400],
                                blurRadius: ScreenUtil().setSp(
                                    100.0), // has the effect of softening the shadow
                                spreadRadius: ScreenUtil().setSp(
                                    1), // has the effect of extending the shadow
                                // offset: Offset(
                                //   10.0, // horizontal, move right 10
                                //   10.0, // vertical, move down 10
                                // ),
                              )
                            ],
                          ),
                          child: Material(
                            elevation: 10,
                            borderRadius: BorderRadius.circular(20.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Image.asset(
                                'images/danieJogurt.jpg',
                                width: ScreenUtil().setSp(260.0),
                                height: ScreenUtil().setSp(260.0),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Śniadanie',
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(60),
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Jogurt z autorską\n mieszanką musli\n \'Z polskiego sadu\'',
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(30),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setSp(30),
                    ),
                    Text(
                      'Kaloryczność',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(40),
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: ScreenUtil().setSp(10),
                    ),
                    CaloricityCarouselWidget(),
                    SizedBox(
                      height: ScreenUtil().setSp(20),
                    ),
                    Text(
                      'Składniki',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(40),
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: ScreenUtil().setSp(10),
                    ),
                    Text(
                      'jogurt naturalny wzbogacony w wapń (mleko), płatki owsiane, ryżowe, siemię lniane, orzechy laskowe, suszone śliwki, suszone jabłka, świeże owoce i warzywa, twaróg naturalny półtłusty (mleko), ciemne pieczywo żytnie/mieszane, herbatka owocowa/ziołowa/zielona',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(25),
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: ScreenUtil().setSp(20),
                    ),
                    Text(
                      'Wartości odżywcze',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(40),
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: ScreenUtil().setSp(10),
                    ),
                    NutritionalValuesCarouselWidget(),
                    SizedBox(
                      height: ScreenUtil().setSp(30),
                    ),
                    MaterialButton(
                      elevation: ScreenUtil().setSp(50),
                      height: ScreenUtil().setSp(110),
                      minWidth: ScreenUtil().setSp(700),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(40.0),
                      ),
                      onPressed: () {
                        //Get.to(OrderPage());
                      },
                      color: Colors.lightGreen,
                      textColor: Colors.white,
                      child: Text("Wymień posiłek",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(45),
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: ScreenUtil().setSp(40),
                    ),
                    horizontalLine(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
