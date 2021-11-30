import 'package:flutter/material.dart';
import 'package:flutter_klient_lightbox_test/Diet/diet_details_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_klient_lightbox_test/.Global/global_variables.dart' as globalVariables;


class GreyGreenBoxWidget extends StatefulWidget {
  @override
  _GreyGreenBoxWidgetState createState() => _GreyGreenBoxWidgetState();
}

class _GreyGreenBoxWidgetState extends State<GreyGreenBoxWidget> {
//================== DEKLARACJE =========================
  TextStyle titleWhiteBoxTextStyle = TextStyle(
      fontSize: ScreenUtil().setSp(40),
      fontWeight: FontWeight.w800,
      color: Colors.black);

  TextStyle titleGreenBoxTextStyle = TextStyle(
      fontSize: ScreenUtil().setSp(40),
      fontWeight: FontWeight.w800,
      color: Colors.white);

  TextStyle detailsWhiteBoxTextStyle = TextStyle(
      fontSize: ScreenUtil().setSp(30),
      fontWeight: FontWeight.w600,
      color: Colors.black);

  TextStyle detailsGreenBoxTextStyle = TextStyle(
      fontSize: ScreenUtil().setSp(30),
      fontWeight: FontWeight.w600,
      color: Colors.white);
//========================================================
  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Stack(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  //=============== ODSTEP MIEDZY CZUBKIEM OBRAZKA A CZUBKIEM BOXA ============
                  new Container(
                    height: ScreenUtil().setHeight(40),
                    color: Colors.transparent,
                  ),
                  //============================================================================
                  Material(
                    elevation: 5,
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Column(
                      children: [
                        Container(
                          margin: new EdgeInsets.all(15.0),
                          decoration: new BoxDecoration(
                            borderRadius:
                                new BorderRadius.all(new Radius.circular(10.0)),
                          ),
                          child: new Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.end, // pozycja obrazka
                            children: <Widget>[
                              new Expanded(
                                  child: new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  //============== TEKST W BOXIE =====================
                                  new Text('Slim FLEX',
                                      style: titleWhiteBoxTextStyle),
                                  new SizedBox(
                                      height: ScreenUtil().setHeight(10)),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.fastfood, color: Colors.black),
                                      SizedBox(
                                        width: ScreenUtil().setWidth(15),
                                      ),
                                      Text('1800 kcal',
                                          style: detailsWhiteBoxTextStyle),
                                    ],
                                  ),
                                  new SizedBox(
                                      height: ScreenUtil().setHeight(10)),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.local_dining,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: ScreenUtil().setWidth(15),
                                      ),
                                      Text('Office - 4 posiłki',
                                          style: detailsWhiteBoxTextStyle),
                                    ],
                                  ),
                                  new SizedBox(
                                      height: ScreenUtil().setHeight(10)),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.calendar_today,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: ScreenUtil().setWidth(15),
                                      ),
                                      Text('02.10.2019 - 30.10.2019',
                                          style: detailsWhiteBoxTextStyle),
                                    ],
                                  ),
                                  new SizedBox(
                                      height: ScreenUtil().setHeight(10)),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.not_interested,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: ScreenUtil().setWidth(15),
                                      ),
                                      Text(
                                        'Bez weekendów',
                                        style: detailsWhiteBoxTextStyle,
                                      ),
                                    ],
                                  ),
                                  //=================================================
                                ],
                              )),
                              //============== PRZYCISK SZCZEGOLOW ZAMIENIA ==============
                              SizedBox(
                                width: ScreenUtil().setWidth(55),
                                height: ScreenUtil().setHeight(55.0),
                                child: FloatingActionButton(
                                  heroTag: 'fabDiet'[index],
                                  elevation: 7,
                                  backgroundColor: Colors.grey[700],
                                  onPressed: () {
                                    //PRZY WYBRANIU DIETY - przypisz szczegoly wybranej diety do zmiennych
                                    globalVariables.chosenDietName = 'Slim FLEX';
                                    globalVariables.chosenDietCaloricityMin = 1000;
                                    globalVariables.chosenDietCaloricityMax = 1500;
                                    globalVariables.chosenDietImgURL = 'http://www.lightbox.pl/images/dania-w-menu/886/pelnoziarnisty-makaron-rigatoni-z-sosem-serowym-i-warzywami-2.jpg';
                                    Get.to(DietDetailsPage());
                                  },
                                  child: Icon(Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: ScreenUtil().setSp(30)),
                                ),
                              ),
                              //=======================================================
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(10)),
                  Material(
                    elevation: 5,
                    color: Colors.lightGreen,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: new EdgeInsets.all(15.0),
                          decoration: new BoxDecoration(
                            borderRadius:
                                new BorderRadius.all(new Radius.circular(10.0)),
                          ),
                          child: new Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.end, // pozycja obrazka
                            children: <Widget>[
                              new Expanded(
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    //============== TEKST W BOXIE =====================
                                    new Text(
                                      'Wtorek, 8 października 2019',
                                      style: titleGreenBoxTextStyle,
                                    ),
                                    new SizedBox(
                                        height: ScreenUtil().setHeight(10)),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.location_on,
                                            color: Colors.white),
                                        SizedBox(
                                          width: ScreenUtil().setWidth(15),
                                        ),
                                        Text('Praca',
                                            style: detailsGreenBoxTextStyle),
                                      ],
                                    ),
                                    new SizedBox(
                                        height: ScreenUtil().setHeight(10)),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.watch_later,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: ScreenUtil().setWidth(15),
                                        ),
                                        Text('Dostawa 10:00 - 12:00',
                                            style: detailsGreenBoxTextStyle),
                                      ],
                                    ),
                                    new SizedBox(
                                        height: ScreenUtil().setHeight(10)),
                                    //=================================================
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  new SizedBox(height: ScreenUtil().setHeight(50)),
                ],
              ),
              //==================== OBRAZEK DIETY ========================
              Positioned(
                right: ScreenUtil().setSp(1),
                child: Card(
                  child: new CircleAvatar(
                    radius: ScreenUtil().setSp(130),
                    backgroundImage: AssetImage('images/dietaSlimFlex.jpg'),
                  ),
                  elevation: 5,
                  shape: CircleBorder(),
                ),
              ),
              //=============================================================
            ],
          );
        },
      ),
    );
  }
}
