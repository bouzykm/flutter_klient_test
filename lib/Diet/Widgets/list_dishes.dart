import 'package:flutter/material.dart';
import 'package:flutter_klient_lightbox_test/Diet/Dish/dish_details_page.dart';
import 'package:flutter_klient_lightbox_test/NewOrder/new_order_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_klient_lightbox_test/.Global/.Requests/diet_dishes_list_request.dart'
    as request;
import 'package:flutter_klient_lightbox_test/.Global/global_variables.dart'
    as globalVariables;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../diet_details_page.dart';

List<String> _mealsOfTheDay = [
  'Śniadanie',
  'Drugie śniadanie',
  'Obiad',
  'Podwieczorek',
  'Kolacja',
];

List<String> _mealsOfTheDayImages = [
  'images/clockTime/breakfast.png',
  'images/clockTime/elevenses.png',
  'images/clockTime/dinner.png',
  'images/clockTime/tea.png',
  'images/clockTime/supper.png',
];

class DishesListWidget extends StatefulWidget {
  @override
  _DishesListWidgetState createState() => _DishesListWidgetState();
}

class _DishesListWidgetState extends State<DishesListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<request.Dish>>(
      future: request.dishesListRequest(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<request.Dish> data = snapshot.data
              .where((dish) => dish.container.contains('A'))
              .toList(); // domyslnie 1 wersja
          if (data.length==0)
            Fluttertoast.showToast(msg: 'Brak menu w wybranym dniu');
          return _list(data, context);
        } else if (snapshot.hasError) {
          return InkWell(
            child: Text(
              '\n\nBłąd:\n\n ${snapshot.error}\n\nNaciśnij tutaj, aby odświeżyć',
            ),
            onTap: () {
              Get.to(DietDetailsPage());
            },
          );
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 150),
            CircularProgressIndicator()
          ],
        );
      },
    );
  }
}

_list(data, context) {
  return Container(
    height: ScreenUtil().setSp(1180),
    //height: MediaQuery.of(context).size.height,
    child: ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset(_mealsOfTheDayImages[index],
              height: ScreenUtil().setSp(90)),
          title: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _mealsOfTheDay[index],
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(40),
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                ),
              ]),
          subtitle: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${data[index].name}',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(30),
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(
                height: ScreenUtil().setSp(10),
              ),
            ],
          ),
          trailing: Icon(Icons.arrow_forward_ios,
              color: Colors.grey[700], size: ScreenUtil().setSp(50)),
          onTap: () {
            //------animacja wejscia cz1.-------
            showGeneralDialog(
              barrierLabel: "Label",
              barrierDismissible: true,
              barrierColor: Colors.black.withOpacity(0.5),
              transitionDuration: Duration(milliseconds: 500),
              context: context,
              pageBuilder: (context, anim1, anim2) {
                return DishDetailsPage(); //<---------------------------- szczegoly dania
              },
              transitionBuilder: (context, anim1, anim2, child) {
                return SlideTransition(
                  position: Tween(begin: Offset(0, 1), end: Offset(0, 0))
                      .animate(anim1),
                  child: child,
                );
              },
            );
            //-----------------------------------
          },
        );
        //=====================================================================
      },
    ),
  );
}
