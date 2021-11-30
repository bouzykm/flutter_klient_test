import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel, WeekdayFormat;

DateTime _currentDate;

class CalendarBarWidget extends StatefulWidget {
  @override
  _CalendarBarWidgetState createState() => _CalendarBarWidgetState();
}

class _CalendarBarWidgetState extends State<CalendarBarWidget> {
  @override
  Widget build(BuildContext context) {
    return new SliverAppBar(
      leading: IconButton(
        icon: new Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.of(context).pop(true);
        },
      ),
      backgroundColor: Colors.lightGreen,
      expandedHeight: 450.0,
      floating: false,
      pinned: true,
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
      flexibleSpace: new ListView(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: CalendarCarousel(
              onDayPressed: (DateTime date, List events) {
                this.setState(() => _currentDate = date);
              },
              

              //weekDays: null, /// for pass null when you do not want to render weekDays
              customDayBuilder: (
                bool isSelectable,
                int index,
                bool isSelectedDay,
                bool isToday,
                bool isPrevMonthDay,
                TextStyle textStyle,
                bool isNextMonthDay,
                bool isThisMonthDay,
                DateTime day,
              ) {
                /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
                /// This way you can build custom containers for specific days only, leaving rest as default.

                // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
                if (day.day == 14 ||
                    day.day == 15 ||
                    day.day == 16 ||
                    day.day == 17 ||
                    day.day == 18 ||
                    day.day == 19 ||
                    day.day == 20 ||
                    day.day == 21) {
                  return Center(
                    child: Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(150),
                          border: Border.all(width: 8, color: Colors.white)),
                      child: Image.asset('images/logo.png'),
                    ),
                  );
                } else {
                  return null;
                }
              },

              //header
              headerTextStyle: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              weekdayTextStyle: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              iconColor: Colors.white,
              weekDayFormat: WeekdayFormat.short,

              //days in month
              daysTextStyle: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
              weekendTextStyle: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
              prevDaysTextStyle:
                  TextStyle(fontSize: 14.0, color: Colors.black26),
              nextDaysTextStyle:
                  TextStyle(fontSize: 14.0, color: Colors.black26),

              //today
              todayTextStyle: TextStyle(fontSize: 14.0, color: Colors.white),
              todayButtonColor: Colors.black.withOpacity(0.5),
              todayBorderColor: Colors.transparent,

              //all
              thisMonthDayBorderColor: Colors.transparent,
              firstDayOfWeek: 1,
              weekFormat: false,
              locale: ('pl'),
              //markedDatesMap: _markedDateMap,
              height: 400.0,
              selectedDateTime: _currentDate,
              daysHaveCircularBorder: true,
            ),
          ),
        ],
      ),
    );
  }
}
