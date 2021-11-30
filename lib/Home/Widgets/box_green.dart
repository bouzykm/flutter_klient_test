import 'package:flutter/material.dart';
import 'package:flutter_klient_lightbox_test/CurrentOrders/current_orders_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GreenBoxWidget extends StatefulWidget {
  @override
  _GreenBoxWidgetState createState() => _GreenBoxWidgetState();
}

class _GreenBoxWidgetState extends State<GreenBoxWidget> {
  //================== DEKLARACJE =========================
  TextStyle titleBoxTextStyle = TextStyle(
      fontSize: ScreenUtil().setSp(40),
      fontWeight: FontWeight.w800,
      color: Colors.white);

  TextStyle detailsBoxTextStyle = TextStyle(
      fontSize: ScreenUtil().setSp(30),
      fontWeight: FontWeight.w600,
      color: Colors.white);
//========================================================
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: Colors.lightGreen,
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: new EdgeInsets.all(15.0),
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
            ),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.end, // pozycja obrazka
              children: <Widget>[
                new Expanded(
                    child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //============== TEKST W BOXIE =====================
                    new Text('Masz 3 aktywne zamówienia',
                        style: titleBoxTextStyle),
                    new SizedBox(height: ScreenUtil().setHeight(10)),
                    Row(
                      children: <Widget>[
                        Icon(Icons.credit_card, color: Colors.white),
                        SizedBox(
                          width: ScreenUtil().setWidth(15),
                        ),
                        Text('Wszystkie zamówienia opłacone', style: detailsBoxTextStyle),
                      ],
                    ),
                    new SizedBox(height: ScreenUtil().setHeight(10)),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.watch_later,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(15),
                        ),
                        Text('Nadal możesz zmienić posiłki FLEX!',
                            style: detailsBoxTextStyle),
                      ],
                    ),
                    new SizedBox(height: ScreenUtil().setHeight(10)),
                    //=================================================
                  ],
                )),
                //============== PRZYCISK SZCZEGOLOW ZAMIENIA ==============
                SizedBox(
                  width: ScreenUtil().setWidth(55),
                  height: ScreenUtil().setHeight(55.0),
                  child: FloatingActionButton(
                    heroTag: 'FabDelivery',
                    elevation: 7,
                    backgroundColor: Colors.grey[700],
                    onPressed: () {
                      Get.to(CurrentOrdersPage());
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
    );
  }
}
