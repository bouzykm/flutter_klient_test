import 'package:flutter/material.dart';

DateTime selectedDate = DateTime.now();

class CarouselAddressListWidget extends StatefulWidget {
  @override
  _CarouselAddressListWidgetState createState() =>
      _CarouselAddressListWidgetState();
}

class _CarouselAddressListWidgetState extends State<CarouselAddressListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
//====================================START=========================================
          Stack(
            children: [
              Container(
                //height: 100.0,
                width: 250,
                margin: new EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  color: Colors.grey[100],
                  //color: Color.fromRGBO(240, 240, 240, 1),
                  borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                ),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                        margin: new EdgeInsets.all(10.0),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text('Dom',
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black)),
                            new Text("ul. Kowalska 12a/54",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black)),
                            new Text('Gdańsk 80-123',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black)),
                                    
                          ],
                        )),
                  ],
                ),
              ),
              Positioned(
                child: Icon(
                  Icons.check_circle,
                  size: 45,
                  color: Colors.lightGreen,
                ),
              ),
              Positioned(
                top: 15,
                right: 20,
                child: Icon(
                  Icons.home,
                  size: 45,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          //==============================================
          SizedBox(
            width: 20,
          ),
          //======START=========================================
          Stack(
            children: [
              Container(
                //height: 100.0,
                width: 250,
                margin: new EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  color: Colors.grey[100],
                  //color: Color.fromRGBO(240, 240, 240, 1),
                  borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                ),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                        margin: new EdgeInsets.all(10.0),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text('Praca',
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black)),
                            new Text("Gabinet stomatologiczny",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black)),
                            new Text("ul. Studyjna 15",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black)),
                            new Text('Gdańsk 80-123',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black)),
                          ],
                        )),
                  ],
                ),
              ),
              Positioned(
                child: Icon(
                  Icons.check_circle_outline,
                  size: 45,
                  color: Colors.lightGreen,
                ),
              ),
              Positioned(
                top: 15,
                right: 20,
                child: Icon(
                  Icons.work,
                  size: 45,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          //==============================================
          SizedBox(
            width: 20,
          ),
          //======START=========================================
          Stack(
            children: [
              Container(
                //height: 100.0,
                width: 250,
                margin: new EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  color: Colors.grey[100],
                  //color: Color.fromRGBO(240, 240, 240, 1),
                  borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                ),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                        margin: new EdgeInsets.all(10.0),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text('Praca 2',
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black)),
                            new Text("LightBox",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black)),
                            new Text("ul. Akacjowa 1",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black)),
                            new Text('Gdańsk 80-123',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black)),
                          ],
                        )),
                  ],
                ),
              ),
              Positioned(
                child: Icon(
                  Icons.check_circle_outline,
                  size: 45,
                  color: Colors.lightGreen,
                ),
              ),
              Positioned(
                top: 15,
                right: 20,
                child: Icon(
                  Icons.work,
                  size: 45,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          //==============================================
        ],
      ),
    );
  }
}
