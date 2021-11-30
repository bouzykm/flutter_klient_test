import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<IconData> _icons = [Icons.history];

List<Color> _iconsNotificationsColor = [
  Colors.lightGreen,
];

List<int> _iconsNotificationsNumber = [0];

class CurrentOrdersAppBarWidget extends StatefulWidget
    with PreferredSizeWidget {
  @override
  _CurrentOrdersAppBarWidgetState createState() =>
      _CurrentOrdersAppBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CurrentOrdersAppBarWidgetState extends State<CurrentOrdersAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black54,
          size: ScreenUtil().setSp(50),
        ),
        onPressed: () {
          Navigator.of(context).pop(true);
        },
      ),
      title: Text('Twoje aktualne zamówienia', style: TextStyle(color: Colors.black)),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 10.0,
      actions: <Widget>[
        ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: _icons.length,
          itemBuilder: (context, index) {
            //======================= PRZYCISKI ===============================
            return Stack(
              children: [
                IconButton(
                  icon: Icon(_icons[index],
                      color: Colors.black54, size: ScreenUtil().setSp(60)),
                  onPressed: () {
                    switch (index) {
                      case 0: // historia zamowien
                        {
                          //====================ALERT DIALOG - EXCEPTION=====================
                          //przycisk potwierdzajacy
                          Widget okButton = FlatButton(
                            textColor: Color.fromRGBO(102, 153, 51, 1),
                            child: Text("Potwierdź"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          );
                          //dialog
                          AlertDialog alert = AlertDialog(
                            title: Text("Info"),
                            content: Text("Tutaj będzie ekran historii zamówień"),
                            actions: [
                              okButton,
                            ],
                          );
                          //pokaz komunikat
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                          //===========================================================================
                          break;
                        }
                    }
                  },
                ),
                if (_iconsNotificationsNumber[index] >
                    0) // pokaz liczbe powiadomien, jezeli są
                  Container(
                    width: ScreenUtil().setSp(40),
                    height: ScreenUtil().setSp(40),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _iconsNotificationsColor[index],
                        border: Border.all(
                            color: Colors.white, width: ScreenUtil().setSp(1))),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Center(
                        child: Text(
                          _iconsNotificationsNumber[index].toString(),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: ScreenUtil().setSp(25),
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
              ],
            );
            //=============================================================
          },
        ),
      ],
    );
  }
}
