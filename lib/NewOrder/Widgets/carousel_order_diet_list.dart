import 'package:flutter/material.dart';



DateTime selectedDate = DateTime.now();

class CarouselOrderDietListWidget extends StatefulWidget {
  @override
  _CarouselOrderDietListWidgetState createState() =>
      _CarouselOrderDietListWidgetState();
}

class _CarouselOrderDietListWidgetState
    extends State<CarouselOrderDietListWidget> {
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
                            new Text("Slim FLEX",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black)),
                            new SizedBox(
                              height: 8.0,
                            ),
                            new Text("1800-2500 kcal",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                            new Text("★★★★☆",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.lightGreen)),
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
                  top: 1,
                  right: 1,
                  child: new CircleAvatar(
                    
                    radius: 50.0,
                    backgroundImage: AssetImage('images/sport2.jpg'),
                  )),
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
                            new Text("Slim Optimum",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black)),
                            new SizedBox(
                              height: 8.0,
                            ),
                            new Text("1000-1800 kcal",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                            new Text("★★★★★",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.lightGreen)),
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
                  top: 1,
                  right: 1,
                  child: new CircleAvatar(
                    
                    radius: 50.0,
                    backgroundImage: AssetImage('images/sport2.jpg'),
                  )),
            ],
          ),
          //====================================================
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
                            new Text("Sport FLEX",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black)),
                            new SizedBox(
                              height: 8.0,
                            ),
                            new Text("2500-4000 kcal",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                            new Text("★★★☆☆",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.lightGreen)),
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
                  top: 1,
                  right: 1,
                  child: new CircleAvatar(
                    
                    radius: 50.0,
                    backgroundImage: AssetImage('images/sport2.jpg'),
                  )),
            ],
          ),

          //==============================================
        ],
      ),
    );
  }
}

// class Category extends StatelessWidget {
//   final String image_location;
//   final String image_caption;

//   Category({this.image_location, this.image_caption});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(2.0),
//       child: InkWell(
//         onTap: () {},
//         child: Container(
//           width: 120.0,
//           child: ListTile(
//             title: Image.asset(image_location, width: 120.0, height: 80.0),
//             subtitle: Text(image_caption, textAlign: TextAlign.center),
//           ),
//         ),
//       ),
//     );
//   }
// }
