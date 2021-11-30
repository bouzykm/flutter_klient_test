import 'package:flutter/material.dart';
import 'package:flutter_klient_lightbox_test/Diet/diet_details_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_klient_lightbox_test/NewOrder/new_order_page.dart';
import 'package:flutter_klient_lightbox_test/.Global/.Requests/home_carousel_diets_list_request.dart'
    as request;
import 'package:flutter_klient_lightbox_test/.Global/global_variables.dart'
    as globalVariables;

class CarouselDietsListWidget extends StatefulWidget {
  @override
  _CarouselDietsListWidgetState createState() => _CarouselDietsListWidgetState();
}

class _CarouselDietsListWidgetState extends State<CarouselDietsListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<request.Diet>>(
      future: request.carouselDietsListRequest(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<request.Diet> data = snapshot.data;
          return _carousel(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
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

_carousel(data) {
  return Container(
    height: ScreenUtil().setSp(280),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            //==================WLASCIWOSCI BOXA ================================
            Container(
              width: ScreenUtil().setWidth(430),
              margin: new EdgeInsets.all(10.0),
              decoration: new BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 5.0, // has the effect of softening the shadow
                    spreadRadius: 1.0, // has the effect of extending the shadow
                    offset: Offset(
                      0, // horizontal, move right 10
                      3.0, // vertical, move down 10
                    ),
                  )
                ],
                color: Colors.grey[100],
                borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
              ),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    margin: new EdgeInsets.all(ScreenUtil().setSp(20.0)),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //================= ZAWARTOSC BOXA ===========================
                        new Text(data[index].name, // nazwa diety
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(32.0),
                                fontWeight: FontWeight.w800,
                                color: Colors.black)),
                        new SizedBox(
                          height: ScreenUtil().setHeight(12),
                        ),
                        new Text(
                            '${data[index].caloricityMin}-${data[index].caloricityMax} kcal',
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(25.0),
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                        new Text("★★★★☆",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(35.0),
                                fontWeight: FontWeight.w600,
                                color: Colors.lightGreen)),
                        //===========================================================
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //===================== AVATAR W PRAWYM GORNYM ROGU BOXA ======================
            Positioned(
              top: -5,
              right: 1,
              child: Card(
                child: new CircleAvatar(
                    radius: ScreenUtil().setSp(85.0),
                    backgroundImage: NetworkImage(
                        'http://www.lightbox.pl${data[index].imgURL}'),
                    backgroundColor: Colors.grey[100]),
                elevation: 5,
                shape: CircleBorder(),
              ),
            ),
            //==============================================================================
            Container(
              height: ScreenUtil().setHeight(300.0),
              margin: new EdgeInsets.all(ScreenUtil().setSp(8.0)),
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
              ),
              //========================== RZAD PRZYCISKOW =====================================
              child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    //============== przycisk SPRAWDŹ =====================
                    MaterialButton(
                      elevation: 3,
                      minWidth: ScreenUtil().setWidth(300),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                      ),
                      onPressed: () {
                        //PRZY WYBRANIU DIETY - przypisz szczegoly wybranej diety do zmiennych
                        globalVariables.chosenDietName = data[index].name;
                        globalVariables.chosenDietCaloricityMin = data[index].caloricityMin;
                        globalVariables.chosenDietCaloricityMax = data[index].caloricityMax;
                        globalVariables.chosenDietImgURL = 'http://www.lightbox.pl${data[index].imgURL}';
                        Get.to(DietDetailsPage());
                      },
                      color: Colors.lightGreen,
                      textColor: Colors.white,
                      child: Text("Sprawdź".toUpperCase(),
                          style: TextStyle(fontSize: ScreenUtil().setSp(25))),
                    ), 
                    //=====================================================
                    SizedBox(
                      width: ScreenUtil().setWidth(15),
                    ),
                    //================== PRZYCISK KOSZYK =================
                    MaterialButton(
                      elevation: 3,
                      minWidth: ScreenUtil().setWidth(150),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                      ),
                      onPressed: () {
                        Get.to(NewOrderPage());
                      },
                      color: Colors.grey[700],
                      textColor: Colors.white,
                      child: Icon(Icons.add_shopping_cart),
                    ),
                    //=====================================================
                  ]),
              //============================================================================
            ),
          ],
        );
      },
    ),
  );
}
