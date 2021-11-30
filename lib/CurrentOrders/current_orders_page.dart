import 'package:flutter/material.dart';
import 'package:flutter_klient_lightbox_test/.Global/global_variables.dart'
    as globalVariables;
import 'package:flutter_klient_lightbox_test/CurrentOrders/Widgets/box_grey_green.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_klient_lightbox_test/.Global/Widgets/bottom_navigation_bar.dart';

import 'Widgets/appbar_current_orders.dart';

Widget horizontalLine() => Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setSp(30)),
      child: Container(
        width: ScreenUtil().setWidth(150),
        height: ScreenUtil().setHeight(6),
        color: Colors.black26.withOpacity(.2),
      ),
    );

class CurrentOrdersPage extends StatefulWidget {
  @override
  _CurrentOrdersPageState createState() => _CurrentOrdersPageState();
}

class _CurrentOrdersPageState extends State<CurrentOrdersPage> {
  @override
  Widget build(BuildContext context) {
    globalVariables.selectedIndex =
        1; // zaznacz pierwsza ikone bottomNavigationBar kiedy znajdziesz sie na stronie
    //obsluga przycisku wstecz
    return Scaffold(
      //======================== NAGŁOWEK ===============================
      appBar: CurrentOrdersAppBarWidget(),
      //=====================================================================
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: ScreenUtil().setSp(10)),
                // =====================KAFLE======================
                GreyGreenBoxWidget(), //<-----------------------------
                SizedBox(
                  height: ScreenUtil().setHeight(30),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(30),
                ),
              ],
            )),
      ),
      //===============================STOPKA==================================
      bottomNavigationBar: BottomNavigationBarWidget(), //<----------------
      //=======================================================================
    );
  }
}
