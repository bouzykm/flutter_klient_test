import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_klient_lightbox_test/NewOrder/Widgets/bar_calendar.dart';
import 'package:flutter_klient_lightbox_test/NewOrder/Widgets/body_order.dart';
import 'package:get/get.dart';

class NewOrderPage extends StatefulWidget {
  @override
  _NewOrderPageState createState() => _NewOrderPageState();
}

Widget horizontalLine() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: ScreenUtil().setWidth(200),
        height: 3.0,
        color: Colors.black26.withOpacity(.2),
      ),
    );

class _NewOrderPageState extends State<NewOrderPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          CalendarBarWidget(),
          SummaryBodyWidget(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MaterialButton(
            elevation: ScreenUtil().setSp(40),
            minWidth: ScreenUtil().setWidth(600),
            height: ScreenUtil().setHeight(90),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(ScreenUtil().setHeight(70),),
            ),
            onPressed: () {
              Get.to(NewOrderPage());
            },
            color: Colors.lightGreen,
            textColor: Colors.white,
            child: Text("Dodaj do koszyka",
                style: TextStyle(fontSize: ScreenUtil().setSp(40), fontWeight: FontWeight.w600)),
          ),
    );
  }
}
