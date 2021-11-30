import 'package:flutter/material.dart';
import 'package:flutter_klient_lightbox_test/Diet/Widgets/list_dishes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_klient_lightbox_test/Diet/Widgets/carousel_week_calendar.dart';
import 'package:get/get.dart';
import 'package:flutter_klient_lightbox_test/Diet/Dish/dish_details_page.dart';

String chosenDate = dateFormat.format(today).toString();

Widget horizontalLine() => Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setSp(250)),
      child: Container(
        width: ScreenUtil().setWidth(300),
        height: ScreenUtil().setSp(4),
        color: Colors.black26.withOpacity(.2),
      ),
    );

class DietListWidget extends StatefulWidget {
  @override
  _DietListWidgetState createState() => new _DietListWidgetState();
}

class _DietListWidgetState extends State<DietListWidget> {

  callback(newChosenDate) {
    // przypisz do zmiennej nowo wybrana date z karuzeli
    setState(() {
      chosenDate = newChosenDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new SliverList(
      delegate: new SliverChildListDelegate(
        [
          SizedBox(
            height: 10,
          ),
          horizontalLine(),
          Container(
            margin: new EdgeInsets.only(
                top: ScreenUtil().setSp(15),
                left: ScreenUtil().setSp(30),
                right: ScreenUtil().setSp(30)),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: ScreenUtil().setSp(20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Menu, $chosenDate',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(50),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setSp(20),
                    ),
                    WeekCalendarCarouselWidget(chosenDate, callback), // konstruktur przysyla zmienne za kazdym razem, gdy wybiery jest dzien z karuzeli
                    DishesListWidget(), //<------------------------------
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
