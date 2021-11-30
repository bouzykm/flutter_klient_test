import 'package:flutter/material.dart';
import 'package:flutter_klient_lightbox_test/NewOrder/new_order_page.dart';
import 'package:flutter_klient_lightbox_test/Diet/Widgets/bar_diet_details.dart';
import 'package:flutter_klient_lightbox_test/Diet/Widgets/body_diet_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DietDetailsPage extends StatefulWidget {
  @override
  _DietDetailsPageState createState() => _DietDetailsPageState();
}

class _DietDetailsPageState extends State<DietDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          DietDetailsBarWidget(),
          DietListWidget(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: 
          MaterialButton(
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
            child: Text("Przejdź do zamówienia",
                style: TextStyle(fontSize: ScreenUtil().setSp(40), fontWeight: FontWeight.w600)),
          ),
    );
  }
}
