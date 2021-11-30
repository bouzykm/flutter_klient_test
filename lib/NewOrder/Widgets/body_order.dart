import 'package:flutter/material.dart';
import 'package:flutter_klient_lightbox_test/NewOrder/Widgets/carousel_caloricity_list.dart';
import 'package:flutter_klient_lightbox_test/NewOrder/Widgets/carousel_meals_choice.dart';
import 'package:flutter_klient_lightbox_test/NewOrder/Widgets/carousel_order_diet_list.dart';
import 'package:flutter_klient_lightbox_test/NewOrder/Widgets/carousel_packet_choice.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



Widget horizontalLine() => Center(
      child: Container(
        width: ScreenUtil().setWidth(150),
        height: 3.0,
        color: Colors.black26.withOpacity(.2),
      ),
    );

class SummaryBodyWidget extends StatefulWidget {
  @override
  _SummaryBodyWidgetState createState() => _SummaryBodyWidgetState();
}

class _SummaryBodyWidgetState extends State<SummaryBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return new SliverList(
      delegate: new SliverChildListDelegate(
        [
          Container(
            margin: new EdgeInsets.only(top: 5, left: 15, right: 15),
            decoration: new BoxDecoration(
                //borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                ),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    horizontalLine(),
                    SizedBox(
                      height: 10,
                    ),
                    //============================TYTUŁ============================
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Szybkie zamawianie',
                                  style: TextStyle(
                                      fontSize: 38,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black))
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Wybierz dietę',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //================================================================
                    SizedBox(
                      height: 5,
                    ),
                    CarouselOrderDietListWidget(),
                    //================================================================
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Wybierz grupę kaloryczną',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //================================================================
                    SizedBox(
                      height: 5,
                    ),
                    CaloricityCarouselWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    //================================================================
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Wybierz liczbę posiłków',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //================================================================
                    SizedBox(
                      height: 5,
                    ),
                    MealsChoiceCarouselWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    //================================================================
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Wybierz pakiet',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //================================================================
                    SizedBox(
                      height: 5,
                    ),
                    PacketChoiceCarouselWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    //================================================================
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Cena: 868.00 zł\n',
                                  style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black)),
                              TextSpan(
                                  text: '921.00 zł',
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 36,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black26)),
                            ],
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    //================================================================
                    SizedBox(
                      height: 110,
                    ),
                    //================================================================
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
