import 'package:flutter/material.dart';
import 'package:flutter_klient_lightbox_test/Diet/diet_details_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GreyBoxWidget extends StatefulWidget {
  @override
  _GreyBoxWidgetState createState() => _GreyBoxWidgetState();
}

class _GreyBoxWidgetState extends State<GreyBoxWidget> {
//================== DEKLARACJE =========================
  TextStyle titleBoxTextStyle = TextStyle(
      fontSize: ScreenUtil().setSp(40),
      fontWeight: FontWeight.w800,
      color: Colors.black);

  TextStyle detailsBoxTextStyle = TextStyle(
      fontSize: ScreenUtil().setSp(30),
      fontWeight: FontWeight.w600,
      color: Colors.black);
//========================================================
  @override
  Widget build(BuildContext context) {
    return new Stack(
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
                            new Text('Slim FLEX', style: titleBoxTextStyle),
                            new SizedBox(height: ScreenUtil().setHeight(10)),
                            Row(
                              children: <Widget>[
                                Icon(Icons.fastfood, color: Colors.black),
                                SizedBox(
                                  width: ScreenUtil().setWidth(15),
                                ),
                                Text('1800 kcal', style: detailsBoxTextStyle),
                              ],
                            ),
                            new SizedBox(height: ScreenUtil().setHeight(10)),
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
                                    style: detailsBoxTextStyle),
                              ],
                            ),
                            new SizedBox(height: ScreenUtil().setHeight(10)),
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
                                    style: detailsBoxTextStyle),
                              ],
                            ),
                            new SizedBox(height: ScreenUtil().setHeight(10)),
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
                                  style: detailsBoxTextStyle,
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
                            heroTag: 'fabDiet',
                            elevation: 7,
                            backgroundColor: Colors.grey[700],
                            onPressed: () {
                              Get.to(DietDetailsPage());
                            },
                            child: Icon(Icons.arrow_forward_ios,
                                color: Colors.white, size: ScreenUtil().setSp(30)),
                          ),
                        ),
                        //=======================================================
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
  }
}
