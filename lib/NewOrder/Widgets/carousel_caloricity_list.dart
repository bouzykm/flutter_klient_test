import 'package:flutter/material.dart';

class CaloricityCarouselWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          MaterialButton(
            color: Colors.grey[700],
            child: Text('1200 kcal',
                style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w800)),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
            ),
            onPressed: () {},
          ),
          MaterialButton(
            child: Text('1500 kcal',
                style: TextStyle(fontSize: 16, color: Colors.grey[700], fontWeight: FontWeight.w800)),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
            ),
            onPressed: () {},
          ),
          MaterialButton(
            child: Text('1800 kcal',
                style: TextStyle(fontSize: 16, color: Colors.grey[700], fontWeight: FontWeight.w800)),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
            ),
            onPressed: () {},
          ),
          MaterialButton(
            child: Text('2000 kcal',
                style: TextStyle(fontSize: 16, color: Colors.grey[700], fontWeight: FontWeight.w800)),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
            ),
            onPressed: () {},
          ),
          MaterialButton(
            child: Text('2500 kcal',
                style: TextStyle(fontSize: 16, color: Colors.grey[700], fontWeight: FontWeight.w800)),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
            ),
            onPressed: () {},
          ),
          MaterialButton(
            child: Text('3000 kcal',
                style: TextStyle(fontSize: 16, color: Colors.grey[700], fontWeight: FontWeight.w800)),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
            ),
            onPressed: () {},
          ),
          MaterialButton(
            child: Text('4000 kcal',
                style: TextStyle(fontSize: 16, color: Colors.grey[700], fontWeight: FontWeight.w800)),
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
