import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<String> _targetList = [
  'Utrata wagi',
  'Zbudowanie mięśni',
  'Zdrowe odżywianie'
];

//musi byc stateful widget - zmianie ulegaja przyciski po nacisnieciu
class TargetCarouselWidget extends StatefulWidget {
  @override
  _TargetCarouselWidgetState createState() => _TargetCarouselWidgetState();
}

class _TargetCarouselWidgetState extends State<TargetCarouselWidget> {
  List<bool> _pressedButton = List.generate(_targetList.length, (i) => false);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setSp(80.0), // ograniczenie wysokosci przycisku
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _targetList.length,
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
                  child: Text(_targetList[i],
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
