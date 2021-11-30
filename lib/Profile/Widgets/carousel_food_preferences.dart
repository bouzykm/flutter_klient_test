import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<String> _foodPreferencesList = [
  'Bez ryb',
  'Bez mięsa',
  'Bez laktozy'
];

//musi byc stateful widget - zmianie ulegaja przyciski po nacisnieciu
class FoodPreferencesCarouselWidget extends StatefulWidget {
  @override
  _FoodPreferencesCarouselWidgetState createState() => _FoodPreferencesCarouselWidgetState();
}

class _FoodPreferencesCarouselWidgetState extends State<FoodPreferencesCarouselWidget> {
  List<bool> _pressedButton = List.generate(_foodPreferencesList.length, (i) => false);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setSp(80.0), // ograniczenie wysokosci przycisku
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _foodPreferencesList.length,
        itemBuilder: (context, i) {
          return Row(
            children: <Widget>[
              //=========================== PRZYCISK ================================
              MaterialButton(
                  height: ScreenUtil().setSp(
                      1000), //nie zmieniaj wartosci - max zakres wysokosci przycisku
                  color: _pressedButton[i] // KOLOR TŁA
                      ? Colors.grey[700] //gdy jest wcisniety
                      : null, // gdy nie jest wcisniety
                  child: Text(_foodPreferencesList[i],
                      style: TextStyle(
                          fontSize: 16,
                          color: _pressedButton[i] // KOLOR TEKSTU
                              ? Colors.white // gdy  jest wcisniety
                              : Colors.grey[700], // gdy nie jest wcisneity
                          fontWeight: FontWeight.w800)),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                  onPressed: () {
                    setState(() => _pressedButton[i] = !_pressedButton[i]);
                  }),
              //====================================================================
              SizedBox(width: 5),
              //====================================================================
            ],
          );
        },
      ),
    );
  }
}
