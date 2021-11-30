import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NutritionalValuesCarouselWidget extends StatefulWidget {
  @override
  _NutritionalValuesCarouselWidgetState createState() =>
      _NutritionalValuesCarouselWidgetState();
}

class _NutritionalValuesCarouselWidgetState
    extends State<NutritionalValuesCarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setSp(130.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
//====================================START=========================================
          MaterialButton(
            minWidth: ScreenUtil().setSp(160.0),
            color: Colors.green,
            child: RichText(
              text: TextSpan(
                text: '1319.16\n',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(28),
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
                children: <TextSpan>[
                  TextSpan(
                    text: 'kJ',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(28),
                      fontWeight: FontWeight.w600,
                    ),
                    //   recognizer: _longPressRecognizer,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
            ),
            onPressed: () {},
          ),
          SizedBox(
            width:  ScreenUtil().setSp(10.0),
          ),
          MaterialButton(
            minWidth: ScreenUtil().setSp(160.0),
            color: Colors.green,
            child: RichText(
              text: TextSpan(
                text: '315.34\n',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(28),
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
                children: <TextSpan>[
                  TextSpan(
                    text: 'kcal',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(28),
                      fontWeight: FontWeight.w600,
                    ),
                    //   recognizer: _longPressRecognizer,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
            ),
            onPressed: () {},
          ),
          SizedBox(
            width:  ScreenUtil().setSp(10.0),
          ),
          MaterialButton(
            minWidth: ScreenUtil().setSp(160.0),
            color: Colors.green,
            child: RichText(
              text: TextSpan(
                text: '36.67g\n',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(28),
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Węgl.',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(28),
                      fontWeight: FontWeight.w600,
                    ),
                    //   recognizer: _longPressRecognizer,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
            ),
            onPressed: () {},
          ),
          SizedBox(
            width:  ScreenUtil().setSp(10.0),
          ),
          MaterialButton(
            minWidth: ScreenUtil().setSp(160.0),
            color: Colors.green,
            child: RichText(
              text: TextSpan(
                text: '1.79\n',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(28),
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Sól',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(28),
                      fontWeight: FontWeight.w600,
                    ),
                    //   recognizer: _longPressRecognizer,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
            ),
            onPressed: () {},
          ),
          SizedBox(
            width:  ScreenUtil().setSp(10.0),
          ),
          MaterialButton(
            minWidth: ScreenUtil().setSp(160.0),
            color: Colors.green,
            child: RichText(
              text: TextSpan(
                text: '21.1g\n',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(28),
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Białko',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(28),
                      fontWeight: FontWeight.w600,
                    ),
                    //   recognizer: _longPressRecognizer,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
            ),
            onPressed: () {},
          ),
          SizedBox(
            width:  ScreenUtil().setSp(10.0),
          ),
          MaterialButton(
            minWidth: ScreenUtil().setSp(160.0),
            color: Colors.green,
            child: RichText(
              text: TextSpan(
                text: '5.16g\n',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(28),
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Błonnik',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(28),
                      fontWeight: FontWeight.w600,
                    ),
                    //   recognizer: _longPressRecognizer,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
            ),
            onPressed: () {},
          ),
          SizedBox(
            width:  ScreenUtil().setSp(10.0),
          ),
          MaterialButton(
            minWidth: ScreenUtil().setSp(160.0),
            color: Colors.green,
            child: RichText(
              text: TextSpan(
                text: '6.02g\n',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(28),
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Cukry',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(28),
                      fontWeight: FontWeight.w600,
                    ),
                    //   recognizer: _longPressRecognizer,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
            ),
            onPressed: () {},
          ),
          SizedBox(
            width:  ScreenUtil().setSp(10.0),
          ),
          MaterialButton(
            minWidth: ScreenUtil().setSp(160.0),
            color: Colors.green,
            child: RichText(
              text: TextSpan(
                text: '11.46g\n',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(28),
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Tłuszcz',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(28),
                      fontWeight: FontWeight.w600,
                    ),
                    //   recognizer: _longPressRecognizer,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
            ),
            onPressed: () {},
          ),
          SizedBox(
            width:  ScreenUtil().setSp(10.0),
          ),
          
        ],
      ),
    );
  }
}
