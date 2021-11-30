import 'package:flutter/material.dart';

class MealsChoiceCarouselWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          MaterialButton(
            minWidth: 120,
            color: Colors.grey[700],
            child: RichText(
              text: TextSpan(
                text: '5\n',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w800),
                children: <TextSpan>[
                  TextSpan(
                    text: 'posiłków\n ',
                    style: TextStyle(
                      fontSize: 16,
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
          MaterialButton(
            minWidth: 120,
            child: RichText(
              text: TextSpan(
                text: '4\n',
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 35,
                    fontWeight: FontWeight.w800),
                children: <TextSpan>[
                  TextSpan(
                    text: 'posiłki \nbez kolacji',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
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
          MaterialButton(
            child: RichText(
              text: TextSpan(
                text: '4\n',
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 35,
                    fontWeight: FontWeight.w800),
                children: <TextSpan>[
                  TextSpan(
                    text: 'posiłki \nbez śniadania',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
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
            width: 15,
          ),
        ],
      ),
    );
  }
}
