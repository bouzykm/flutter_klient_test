import 'package:flutter/material.dart';
import 'package:flutter_klient_lightbox_test/.Global/global_variables.dart'
    as globalVariables;
import 'package:flutter_klient_lightbox_test/Cart/cart_page.dart';
import 'package:flutter_klient_lightbox_test/Home/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DietDetailsBarWidget extends StatefulWidget {
  @override
  _DietDetailsBarWidgetState createState() => _DietDetailsBarWidgetState();
}

class _DietDetailsBarWidgetState extends State<DietDetailsBarWidget> {
  @override
  Widget build(BuildContext context) {
    return new SliverAppBar(
      //======= PRZYCISK WSTECZ ========
      leading: IconButton(
        icon: new Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Get.to(HomePage());
        },
      ),
      //================================
      backgroundColor: Colors.lightGreen,
      expandedHeight: ScreenUtil().setSp(600.0),
      floating: false,
      pinned: true,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      flexibleSpace: new Stack(
        children: <Widget>[
          ListView(
            children: [
              Container(
                margin: new EdgeInsets.only(
                    top: ScreenUtil().setSp(10.0),
                    left: ScreenUtil().setSp(25.0)),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                ),
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //================ NAGŁOWEK ==================
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.shopping_cart,
                                    color: Colors.white,
                                    size: ScreenUtil().setSp(50.0)),
                                onPressed: () {
                                  Get.to(ShoppingCart());
                                },
                              ),
                            ],
                          ),
                          //========================== ZAWARTOSC - TEKST ===============================
                          Container(
                            padding: new EdgeInsets.only(right: 140.0),
                            child: Text(
                              globalVariables.chosenDietName,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(60.0),
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(15.0),
                          ),
                          Container(
                            padding: new EdgeInsets.only(right: 160.0),
                            child: new Text(
                              '${globalVariables.chosenDietCaloricityMin}-${globalVariables.chosenDietCaloricityMax} kcal',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(35.0),
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            padding: new EdgeInsets.only(right: 160.0),
                            child: new Text(
                              '★★★★☆',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(45.0),
                                  fontWeight: FontWeight.w600,
                                  color: Colors.yellow),
                            ),
                          ),
                          Container(
                            padding: new EdgeInsets.only(right: 160.0),
                            child: new Text(
                              '132 recenzje',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(35.0),
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setSp(30.0),
                          ),
                          Container(
                            padding: new EdgeInsets.only(right: 150.0),
                            child: Text(
                              // max ok 140 znakow
                              'Inspiracją dla diety LightBox jest najzdrowsza na świecie, bardzo lubiana kuchnia śródziemnomorska',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 6,
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(30.0),
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                          //=============================================================================
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          //============= AVATAR ================
          Positioned(
            top: ScreenUtil().setSp(150.0),
            right: ScreenUtil().setSp(-140.0),
            child: Card(
              child: new CircleAvatar(
                radius: ScreenUtil().setSp(200.0),
                backgroundImage: NetworkImage(globalVariables.chosenDietImgURL),
                backgroundColor: Colors.grey[100],
              ),
              elevation: 10,
              shape: CircleBorder(),
            ),
          ),
          //===================================
        ],
      ),
    );
  }
}
