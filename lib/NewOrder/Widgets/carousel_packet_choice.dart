import 'package:flutter/material.dart';

class PacketChoiceCarouselWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          MaterialButton(
            color: Colors.grey[700],
            child: Text('z weekendami',
                style: TextStyle(fontSize: 16, color: Colors.white)),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
            ),
            onPressed: () {},
          ),
          MaterialButton(
            child: Text('bez weekendów',
                style: TextStyle(fontSize: 16, color: Colors.grey[700])),
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
